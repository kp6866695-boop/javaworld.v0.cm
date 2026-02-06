// ==================== NAVIGATION & SECTION MANAGEMENT ====================

function navigateToModule(moduleId) {
    const sectionMap = {
        'lab': 'lab',
        'java': 'java',
        'cyber': 'cyber'
    };
    showSection(sectionMap[moduleId]);
}

function goHome() {
    showSection('home');
}

function showSection(sectionId) {
    const sections = document.querySelectorAll('.section');
    sections.forEach(section => {
        section.classList.remove('active');
    });

    const selectedSection = document.getElementById(sectionId + '-section');
    if (selectedSection) {
        selectedSection.classList.add('active');
    }

    const navLinks = document.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('data-section') === sectionId) {
            link.classList.add('active');
        }
    });

    window.scrollTo(0, 0);
}

// ==================== INITIALIZATION ====================

document.addEventListener('DOMContentLoaded', function() {
    showSection('home');
    setupLabTopics();
    setupJavaTopics();
    setupNavigation();
});

function setupNavigation() {
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const section = this.getAttribute('data-section');
            showSection(section);
        });
    });
}

// ==================== VIRTUAL LAB ====================

function setupLabTopics() {
    const topicBtns = document.querySelectorAll('.topic-btn');
    topicBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const topic = this.getAttribute('data-topic');
            switchLabTopic(topic);
        });
    });
}

function switchLabTopic(topicId) {
    document.querySelectorAll('.topic-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    document.querySelectorAll('.topic-content').forEach(content => {
        content.classList.remove('active');
    });

    document.querySelector(`[data-topic="${topicId}"]`).classList.add('active');
    document.getElementById(topicId).classList.add('active');
}

// ==================== JAVA PORTAL ====================

function setupJavaTopics() {
    const javaTopicBtns = document.querySelectorAll('.java-topic-btn');
    javaTopicBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const topic = this.getAttribute('data-java-topic');
            switchJavaTopic(topic);
        });
    });
}

function switchJavaTopic(topicId) {
    document.querySelectorAll('.java-topic-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    document.querySelectorAll('.java-topic-box').forEach(box => {
        box.classList.remove('active');
    });

    document.querySelector(`[data-java-topic="${topicId}"]`).classList.add('active');
    document.getElementById(`java-${topicId}`).classList.add('active');
}

function executeVariables() {
    const name = document.getElementById('var-name').value || 'Student';
    const age = document.getElementById('var-age').value || '15';
    const number = document.getElementById('var-number').value || '7';

    const output = `String name = "${name}";
int age = ${age};
int favoriteNumber = ${number};

Output:
Name: ${name}
Age: ${age}
Favorite Number: ${number}`;

    displayOutput('var-output', 'var-result', output);
}

function executeIfElse() {
    const marks = parseInt(document.getElementById('if-marks').value) || 0;
    let grade = '';

    if (marks >= 90) grade = 'A';
    else if (marks >= 75) grade = 'B';
    else if (marks >= 60) grade = 'C';
    else if (marks >= 40) grade = 'D';
    else grade = 'F';

    const output = `int marks = ${marks};
if (marks >= 90) System.out.println("Grade: A");
else if (marks >= 75) System.out.println("Grade: B");
else if (marks >= 60) System.out.println("Grade: C");
else System.out.println("Grade: F");

Output:
Your Marks: ${marks}
Your Grade: ${grade}`;

    displayOutput('if-output', 'if-result', output);
}

function executeLoops() {
    const num = parseInt(document.getElementById('loop-number').value) || 5;
    let output = `Multiplication Table of ${num}:\n\n`;

    for (let i = 1; i <= 10; i++) {
        output += `${num} × ${i} = ${num * i}\n`;
    }

    displayOutput('loop-output', 'loop-result', output);
}

function executeArrays() {
    const input = document.getElementById('array-numbers').value || '10, 20, 30, 40, 50';
    const numbersStr = input.split(',').map(n => n.trim());
    const numbers = numbersStr.map(n => parseInt(n)).filter(n => !isNaN(n));

    if (numbers.length === 0) {
        alert('Please enter valid numbers separated by commas');
        return;
    }

    let sum = 0;
    for (let i = 0; i < numbers.length; i++) {
        sum += numbers[i];
    }
    const average = (sum / numbers.length).toFixed(2);

    const output = `int[] numbers = {${numbersStr.join(', ')}};
int sum = 0;
for (int i = 0; i < numbers.length; i++) sum += numbers[i];

Output:
Array: [${numbers.join(', ')}]
Sum: ${sum}
Average: ${average}
Count: ${numbers.length}`;

    displayOutput('array-output', 'array-result', output);
}

function executeFunctions() {
    const num1 = parseInt(document.getElementById('func-num1').value) || 0;
    const num2 = parseInt(document.getElementById('func-num2').value) || 0;

    const sum = num1 + num2;
    const product = num1 * num2;
    const difference = num1 - num2;

    const output = `static int add(int a, int b) { return a + b; }
static int multiply(int a, int b) { return a * b; }
static int subtract(int a, int b) { return a - b; }

Output:
add(${num1}, ${num2}) = ${sum}
multiply(${num1}, ${num2}) = ${product}
subtract(${num1}, ${num2}) = ${difference}`;

    displayOutput('func-output', 'func-result', output);
}

function displayOutput(outputId, resultId, text) {
    const outputSection = document.getElementById(outputId);
    const resultElement = document.getElementById(resultId);
    resultElement.textContent = text;
    outputSection.style.display = 'block';
    
    setTimeout(() => {
        outputSection.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }, 100);
}

// ==================== CYBER SAFETY ====================

function startScenario(scenarioType) {
    document.querySelectorAll('.scenario-detail').forEach(detail => {
        detail.classList.remove('active');
    });

    document.getElementById(scenarioType + '-detail').classList.add('active');
    document.getElementById(scenarioType + '-result').style.display = 'none';
}

function showPhishingResult(action) {
    const titleElem = document.getElementById('phishing-title');
    const msgElem = document.getElementById('phishing-msg');

    if (action === 'click') {
        titleElem.textContent = '❌ Unsafe Choice';
        titleElem.style.color = '#ef4444';
        msgElem.innerHTML = `<strong>You clicked the link and entered credentials!</strong><br>
        The attacker now has access to your account and money!<br><br>
        <strong>Red Flags:</strong><ul>
        <li>Suspicious domain (bank-secure.com not official bank)</li>
        <li>Urgent language creating panic</li>
        <li>Request for personal information</li>
        <li>This was a PHISHING ATTACK!</li></ul>`;
    } else {
        titleElem.textContent = '✅ Safe Choice';
        titleElem.style.color = '#10b981';
        msgElem.innerHTML = `<strong>Great! You identified the phishing attack!</strong><br>
        You protected yourself from identity theft and fraud.<br><br>
        <strong>Why This Was Phishing:</strong><ul>
        <li>Suspicious domain, not real bank</li>
        <li>Urgent language creating pressure</li>
        <li>Never legitimate banks ask for credentials via email</li></ul>`;
    }

    document.getElementById('phishing-result').style.display = 'block';
}

function showPasswordResult(strength) {
    const titleElem = document.getElementById('password-title');
    const msgElem = document.getElementById('password-msg');
    const strengthDiv = document.getElementById('password-strength');

    if (strength === 'weak') {
        titleElem.textContent = '❌ Weak Password';
        titleElem.style.color = '#ef4444';
        msgElem.innerHTML = `<strong>"123456" is very weak!</strong><ul>
        <li>✗ Only 6 characters</li>
        <li>✗ Only numbers</li>
        <li>✗ Common pattern</li></ul>
        Can be cracked in seconds!`;
        strengthDiv.className = 'password-strength strength-weak';
        strengthDiv.textContent = 'Strength: Very Weak (0/5)';
    } else if (strength === 'medium') {
        titleElem.textContent = '⚠️ Medium Strength';
        titleElem.style.color = '#f59e0b';
        msgElem.innerHTML = `<strong>"MyName2024" is moderately strong</strong><ul>
        <li>✓ Good length</li>
        <li>✗ No special characters</li>
        <li>✗ Contains personal info</li></ul>`;
        strengthDiv.className = 'password-strength strength-medium';
        strengthDiv.textContent = 'Strength: Medium (3/5)';
    } else {
        titleElem.textContent = '✅ Strong Password!';
        titleElem.style.color = '#10b981';
        msgElem.innerHTML = `<strong>"Tr0p!cal#Moon9" is strong!</strong><ul>
        <li>✓ 14 characters</li>
        <li>✓ Uppercase & lowercase</li>
        <li>✓ Numbers & symbols</li>
        <li>✓ Random & unpredictable</li></ul>`;
        strengthDiv.className = 'password-strength strength-strong';
        strengthDiv.textContent = 'Strength: Strong (5/5)';
    }

    document.getElementById('password-result').style.display = 'block';
}

function showScamResult(action) {
    const titleElem = document.getElementById('scam-title');
    const msgElem = document.getElementById('scam-msg');

    if (action === 'fall') {
        titleElem.textContent = '❌ You Got Scammed!';
        titleElem.style.color = '#ef4444';
        msgElem.innerHTML = `<strong>You paid $5 and received nothing!</strong><ul>
        <li>No console arrived</li>
        <li>Only spam emails</li>
        <li>Your email sold to other scammers</li></ul>
        <strong>Red Flags Missed:</strong><ul>
        <li>Free items with shipping = classic scam</li>
        <li>Fake urgency ("only 3 left")</li>
        <li>Too good to be true!</li></ul>`;
    } else {
        titleElem.textContent = '✅ Smart Decision!';
        titleElem.style.color = '#10b981';
        msgElem.innerHTML = `<strong>You avoided this scam!</strong><br>
        No legitimate company gives expensive items away.<br><br>
        <strong>Why It Was Obviously a Scam:</strong><ul>
        <li>Free gaming console? Impossible!</li>
        <li>"Just pay shipping" = classic tactic</li>
        <li>No real company info</li>
        <li>Artificial urgency</li></ul>`;
    }

    document.getElementById('scam-result').style.display = 'block';
}

function resetScenario(scenarioType) {
    document.getElementById(scenarioType + '-result').style.display = 'none';
}