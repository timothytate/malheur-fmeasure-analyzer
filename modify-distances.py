import sys

MAX_DIST = sys.argv[1]
MIN_DIST = sys.argv[2]

with open('config.mlw', 'r') as file:
	filedata = file.read()

start_txt1 = filedata.find('max_dist =')
start_txt2 = filedata.find('min_dist =')

proto_str_new = 'max_dist = {}'.format(MAX_DIST)
proto_str_old = filedata[start_txt1:start_txt1+len(proto_str_new)]

cluster_str_new = 'min_dist = {}'.format(MIN_DIST)
cluster_str_old = filedata[start_txt2:start_txt2+len(cluster_str_new)]

filedata = filedata.replace(proto_str_old, proto_str_new)
filedata = filedata.replace(cluster_str_old, cluster_str_new)

with open('config.mlw', 'w') as file:
	file.write(filedata)
