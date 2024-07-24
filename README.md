# Jenkins on Alpine Linux Container

## Description

A docker-compose setup for running and managing Jenkins CI/CD (check [Installation](#installation))

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

## Installation

Detailed steps to set up the project on your Alpine LXC Container.

- Create `.ashrc` under `/root` with the following content

```bash
# Set PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color=auto'

# Cargo
. "$HOME/.cargo/env"
```

- Create `.profile` under `/root` with the following content

```bash
export ENV=$HOME/.ashrc
```

- Run `ease of use` scripts to setup pre-requisites

- - [All Scripts:](https://github.com/clonne101/scripts.git)
- - - [Packages](https://github.com/clonne101/scripts/tree/main/proxmox/alpine-new-installs.sh)
- - - [Docker & Docker-Compose](https://github.com/clonne101/scripts/tree/main/proxmox/alpine-docker-install.sh)

---

- Clone the repository

```bash
# Clone the repository
git clone https://github.com/clonne101/jenkins.git jenkins-docker

# Navigate to the project directory
cd jenkins-docker

# Copy `.env.example` to `.env` under `/root/jenkins-docker/docker` by running the
# command below and update the `variables`
cp /root/jenkins-docker/docker/.env.example /root/jenkins-docker/docker/.env

# Copy `init.groovy.example` to `.init.groovy` under `/root/jenkins-docker/docker`
# by running the command below and update the `variables`
cp /root/jenkins-docker/docker/init.groovy.example /root/jenkins-docker/docker/init.groovy

# Copy `nginx.conf.example` to `nginx.conf` under `/root/jenkins-docker/docker`
# by running the command below and update the `variables`
cp /root/jenkins-docker/docker/nginx.conf.example /root/jenkins-docker/docker/nginx.conf

```

## Usage

Before running any of the commands below, kindly make sure you have completed
 the above installations for you Alpine Box.

```bash
#### Create required data directories - REQUIRED on FIRST-RUN
make create-dirs

#### Start jenkins container
make start

#### Stop jenkins container
make stop

#### Tail jenkins container logs
make logs

#### Show jenkins containers
make show

#### Clean jenkins containers and volumes
make clean

#### Prints out command list when in doubt
make help
```

## Contributing

Guidelines for contributing to the project.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/your-feature-name`).
6. Open a pull request.

### Submitting Issues

If you encounter any issues, have questions, or would
 like to suggest an enhancement, please submit an issue through the GitHub repository.

#### Steps to Submit an Issue

1. **Search for existing issues**: Before creating a new issue, please check if
 the issue has already been reported.
2. **Open a new issue**: If no existing issue matches your problem, open a
 new issue by clicking on the "New Issue" button in the Issues tab.
3. **Describe the issue**: Provide a clear and concise description of the issue.
 Include steps to reproduce the problem, expected behavior, and actual behavior.
 If applicable, add screenshots or code snippets to illustrate the issue.
4. **Label the issue**: Add relevant labels (e.g., bug, enhancement, question)
 to help categorize the issue.

## License

This project is licensed under the [GPLv3 License](LICENSE).

## Code of Conduct

Please read the [Code of Conduct](CODE_OF_CONDUCT.md) for details.

## Contact

- Email: [openclonne@duck.com](openclonne@duck.com)
- GitHub: [clonne101](https://github.com/clonne101)

## Acknowledgments

- [Jenkins Open-Source](https://www.jenkins.io/doc/book/installing/docker/)
