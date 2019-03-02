#!/bin/bash

ls /root/*.yml.liquid | xargs -I {} embulk run {}
