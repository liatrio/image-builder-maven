## What is the image for?
The intended purpose of this image is for it to be used as a Jenkins agent. By using the installed features the user is able to create Jenkins pipelines that can trigger [Maven](https://maven.apache.org/) commands that can build and install Java projects. An example of using this image as a Jenkins agent via [Kubernetes](https://plugins.jenkins.io/kubernetes/) can be seen below. 

First, an example of configuring the pod template in yaml to create the agent.

```yaml
jenkins:
  clouds:
    - kubernetes:
        name: "kubernetes"
        templates:
          - name: "image-builder-maven"
            label: "image-builder-maven"
            nodeUsageMode: NORMAL
            containers:
              - name: "image-maven"
                image: "ghcr.io/liatrio/image-builder-maven:${builder_images_version}"
```
And then specifying the agent in the Jenkinsfile for an example step.

```jenkins
stage('Build') {
  agent {
    label "image-builder-maven"
  }
  steps {
    container('image-maven') {
      sh "mvn --version"
      sh "mvn package"
    }
  }
}
```

## What is installed on this image?
- Version [3.8.5](https://maven.apache.org/docs/3.8.5/release-notes.html) of Java build automation tool Maven.
