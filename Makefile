

data:
	R -q -f getdata.r
	unzip UCIHARDataset.zip
	cp -a UCI\ HAR\ Dataset/* .
