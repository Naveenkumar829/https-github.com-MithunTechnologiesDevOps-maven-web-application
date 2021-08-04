node{
    
   def mavenHome = tool name: "maven 3.6.3"
    
    stage('CheckoutCode'){
        git branch: 'development', credentialsId: '33d27d4e-05d8-4e0c-bf08-93bac6f0a46f', url: 'https://github.com/Naveenkumar829/https-github.com-MithunTechnologiesDevOps-maven-web-application.git'
    }
    stage('Build'){
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage('ExecuteSonarQubeReport'){
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    stage('ExecuteSonaTypeNexusReport'){
        sh "${mavenHome}/bin/mvn deploy"
    
    }
    
    stage('Tomcat'){

        sshagent(['a2e35600-df75-4f9a-969e-b9c0afbcb577']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.126.242.200:/opt/tomcat9/webapps/"
}
    }

    stage('jacaco'){
        jacoco deltaBranchCoverage: '80', deltaInstructionCoverage: '80', maximumBranchCoverage: '80', maximumComplexityCoverage: '80', maximumInstructionCoverage: '80', minimumBranchCoverage: '80', minimumInstructionCoverage: '80'
    }
    /*
    stage('email'){
        mail bcc: '', body: 'jenkins automation build is completed. please validate and let us know in case of any concerns.', cc: 'venkatanaveenkumar.namburi@gmail.com', from: '', replyTo: '', subject: 'Jenkins Automation build', to: 'nvnaveenkumar0@gmail.com'
    } */
    
}
