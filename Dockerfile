FROM public.ecr.aws/lambda/python:3.11
COPY app/ ${LAMBDA_TASK_ROOT}
CMD ["main.lambda_handler"]