#!/usr/bin/env bash
gcloud ai-platform jobs submit training generator_train_`date +"%s"` \
  --python-version=3.7 \
  --runtime-version=1.15 \
  --scale-tier basic \
  --package-path ./trainer \
  --module-name trainer.task \
  --job-dir=gs://asl-kschool-training/ \
  --region us-central1 \
  -- \
  --epochs 10 \
  --download \
  --bucket-name kschool-challenge-vcm \
  --prefix data/dogs_cats/