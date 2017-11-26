# cnn_vhdl_generator
AUTOMATIC VHDL GENERATION FOR CNN MODELS

"Tool Name :  Automatic VHDL Generation for Small Scale Convolutional Neural Networks"
+ " Description: This tool generates VHDL code for hand-tuned and benchmarked models like LeNet"
+ "System minimum requirements:"
+ " RAM :  2GB \n"
+ " OS :  Any machine supports Java"


This version of the tool offers the following
 ---------------------------------------- 
+ " This version supports the following"
+ " Layers :  Up to 16 "
+ " Feature-maps :  Up to 1024 "
+ " Filter size :  Up to 10 "
+ " Classes :  Up to 200 "
+ " Pooling :  Max pooling "
+ " Activation :  ReLU "
+ " Classifier :  SoftMax"

----------------------------------------
#Get Started with the Generation Tool

 1-In the main (first) window, select network type and target platform then click on "Customize and build model"
 2-In the Configuration Block do the following
	* You can manually build your network, where you can specify all the network parameters from the drop lists in the table
	* You can load a pre-configured model by click on "load configuration" button
	* Once your done with configuration, click on "Validate Model Entries" to check the validity of your model
	* You can save your manually configured model by clicking on "Save Configuration" button
	* Click on "load weights and biases" button to load weights and biases
 3- In Weights and Biases Incorpration windown do the following
	* Choose representation, weight size, bias size, and desired percision 
	* Click on "Load weights and Biases" button to load weights and biases, 
	  you can use the sample random weights provided to you for the provided configuration file
	* The tool will automatically check and verify the loaded file to see if it matches the configuration file as well as chosen
	  weight and bias sizes and representation 
    * If loaded file passes the validation and checking test, the "Generate VHDL files" button will get enabled automatically
	  and then Generate Testbench button will get enabled automatically as well. 
	* Generated files can be found in the same directoy in a folder called "generated_files".
	 

------------------------------------------
# Created by: Muhammad K.A. Hamdan	 
