Use role accountadmin;

Create warehouse if not exists data_warehouse_jobads
with
warehouse_size= "XSMALL"
auto_suspend = 100
initially_suspended = true
comment = "this is data warehouse project";

use warehouse data_warehouse_jobads;
create database if not exists data_warehouse_ads;
create schema if not exists data_warehouse_ads.staging;
create schema if not exists data_warehouse_ads.warehouse;
create schema if not exists data_warehouse_ads.marts;

