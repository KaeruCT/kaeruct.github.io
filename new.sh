#!/bin/bash
# Copyright (c) 2025 Andrés Villarreal
# Licensed under MIT License - see LICENSE file for details

hugo new --kind post posts/$(date "+%F" | sed 's/-/\//g')/$1.md