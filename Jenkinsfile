
pipeline{
    agent any  
    tools  {
          terraform 'terraform-11'

     }
     parameter {
        properties([parameters([string(defaultValue: 't2.micro', description: 'write instance type you want', name: 'instance_type', trim: false)])])
        properties([parameters([string(defaultValue: '', description: 'region you want', name: 'region', trim: false)])])
     }
     stages{
          stage('Git Checkout'){
              steps{
                  git credentialsId: 'git-id', url: 'https://github.com/Sandeep0045/test-pipeline.git'
               }

          }

          stage('Terraform Init'){
              steps{
                  sh 'terraform init'
              }

          }    
          stage('Terraform Plan'){
              steps{
                   sh """
                       terraform plan -input=false -out myplan -var instance_type=${params.instance_type}  region=${params.region}
                   """               
                               
              }

          }     

          

          stage('Approval') {
              steps {
                script {
                  def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
             }
         }
     }    

          
          stage('Terraform Apply'){
              steps{
                  sh """
                    terraform apply -input=false   myplan 
                  """
              }

          }

   
     }   

}
