output: opencv_filtering_partII.o
	g++ -o output opencv_filtering_partII.o `pkg-config --cflags --libs opencv`

opencv_filtering_partII.o : opencv_filtering_partII.cc
	g++ -c opencv_filtering_partII.cc 

clean: 
	rm *.o output


