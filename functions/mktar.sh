#!/bin/bash
tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; 
