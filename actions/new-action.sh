#!/bin/bash

mkdir -p "$1"
cp action.yml.template "$1/action.yml"
editor "$1/action.yml"
