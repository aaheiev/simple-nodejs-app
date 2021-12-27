# docker build -t simple-nodejs-app .
FROM base/nodejs

ARG build_id=0
ARG git_branch='undefined'
ARG git_commit_id='undef'
ARG assembly_version='0.0.0.0'
ARG product_version='0.0.0'

ARG app_user='app'
ARG app_group='app'
ARG app_dir='/opt/app'

ENV BUILD_ID         $build_id
ENV ASSEMBLY_VERSION $assembly_version
ENV PRODUCT_VERSION  $product_version
ENV GIT_COMMIT_ID    $git_commit_id
ENV GIT_BRANCH_NAME  $git_branch
ENV HTTP_PORT        '3000'

WORKDIR $app_dir

RUN adduser -S $app_user

COPY . ./

RUN npm install \
    && ln -sf /dev/stdout /opt/app/app.error.log \
    && ln -sf /dev/stderr /opt/app/app.output.log \
    && chown -R $app_user $app_dir

USER $app_user

CMD [ "pm2-runtime", "start", "process.yaml" ]
