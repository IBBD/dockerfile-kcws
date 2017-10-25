#
# Dgraph Dockerfile
#

# Pull base image.
# 注意：在python3下有问题
FROM ibbd/tensorflow

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 建议：
# 代码挂载到：/var/www/kcws/
# 数据挂载到：/var/www/data/
# 注意报错：update-alternatives: error: error creating symbolic link '/usr/share/man/man1/rmid.1.gz.dpkg-tmp': No such file or directory
# 0E: gnupg, gnupg2 and gnupg1 do not seem to be installed, but one of them is required for this operation
RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        gnupg \
        openjdk-8-jdk \
    && echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
    && curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
    && apt-get install -y --no-install-recommends \
        bazel \
    && apt-get autoremove \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*
