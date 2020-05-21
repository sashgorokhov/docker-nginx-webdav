#!/bin/bash

if [ "x$USERNAME" != "x" ] && [ "x$PASSWORD" != "x" ]
then
  htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD
  echo Done.
else
  echo Using no auth.
  sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/default.conf
  sed -i 's%auth_basic_user_file htpasswd;% %g' /etc/nginx/conf.d/default.conf
fi
