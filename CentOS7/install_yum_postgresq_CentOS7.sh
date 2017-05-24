#!/bin/sh
#
# Auto Install
#
# rpm -ivh http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-2.noarch.rpm
# rpm -ivh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm

yum -y --skip-broken install postgresql94*
yum -y update postgresql94*
yum -y install geos.x86_64 geos-devel.x86_64
yum -y install proj.x86_64 proj-devel.x86_64 proj-epsg.x86_64 proj-nad.x86_64 proj-debuginfo.x86_64
yum -y install --enablerepo=epel gdal.x86_64 gdal-devel.x86_64 gdal-libs.x86_64 gdal-doc.noarch
yum -y install postgis2_94
yum -y install postgis2_94-*

###/sbin/service postgresql-9.4 initdb
### changed for CentOS7
/usr/pgsql-9.4/bin/postgresql94-setup initdb

/bin/cp -f /var/lib/pgsql/9.4/data/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf.bak
/bin/cp -f ./pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf

sleep 5

###/sbin/service postgresql-9.4 start
### changed for CentOS7
/bin/systemctl start  postgresql-9.4.service

sleep 20

psql -U postgres -d template1 -f /usr/pgsql-9.4/share/contrib/postgis-2.1/postgis.sql
psql -U postgres -d template1 -f /usr/pgsql-9.4/share/contrib/postgis-2.1/spatial_ref_sys.sql

echo "SELECT postgis_version();" | psql -U postgres template1

###/sbin/chkconfig postgresql-9.4 on
### changed for CentOS7
/bin/systemctl enable postgresql-9.4.service
