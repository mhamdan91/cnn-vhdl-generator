# cnn_vhdl_generator - PLEASE CITE THE PAPER BELOW IF YOU USE THIS WORK
## AUTOMATIC VHDL GENERATION FOR CNN MODELS

"Tool Name :  Automatic VHDL Generation for Small Scale Convolutional Neural Networks"
+ " Description: This tool generates VHDL code for hand-tuned and benchmarked models like LeNet"
+ " System requirements:"
+ " Max needed RAM : 2GB "
+ " OS :  Any operating system supports Java 8 or higher"


### This version of the tool offers the following
 ---------------------------------------- 
+ " This version supports the following:"
+ " Layers :  Up to 16 "
+ " Feature-maps :  Up to 1024 "
+ " Filter size :  Up to 10 "
+ " Classes :  Up to 200 "
+ " Pooling :  Max pooling "
+ " Activation :  ReLU "
+ " Classifier :  SoftMax"

----------------------------------------

### Get Started with the Generation Tool

* In the main (first) window, select network type and target platform then click on "Customize and build model"
* In the Configuration Block do the following:
	* You can manually build your network, where you can specify all the network parameters from the drop lists in the table
	* You can load a pre-configured model by clicking on "load configuration" button
	* Once you are done with configuration, click on "Validate Model Entries" to check the validity of your model
	* You can save your manually configured model by clicking on "Save Configuration" button
	* Click on "load weights and biases" button to load weights and biases
 * In Weights and Biases Incorpration window, do the following:
	* Choose representation, weight size, bias size, and desired percision 
	* Click on "Load Weights and Biases" button to load weights and biases, 
	  you may use the sample random weights provided to you for the provided configuration file for testing purposes
	* The tool will automatically check and verify the loaded file to see if it matches the configuration file as well as chosen
	  weight and bias sizes and representation 
	* If loaded file passes the validation and checking test, the "Generate VHDL files" button will become enabled automatically
	  and then Generate Testbench button will get enabled automatically after generating the VHDL files. 
	* Generated files can be found in the same directoy in a folder called "generated_files".
	
### Toturial
[![VHDL Generation Tool](https://img.youtube.com/vi/SAnRrkk_XR0/0.jpg)](https://www.youtube.com/watch?v=SAnRrkk_XR0&feature=youtu.be)
	
### Publication
* [IEEE VHDL Generator for a High Performance Convolutional Neural Network FPGA-base Accelerator](http://ieeexplore.ieee.org/document/8279827/)
* [RG.  VHDL Generator for a High Performance Convolutional Neural Network FPGA-base Accelerator](https://www.researchgate.net/publication/322942712_VHDL_generator_for_a_high_performance_convolutional_neural_network_FPGA-based_accelerator)

### Thesis 
* [VHDL auto-generation tool for optimized hardware acceleration of convolutional neural networks on FPGA (VGT) ](https://lib.dr.iastate.edu/etd/16368/)

### PLEASE CITE THIS PAPER IF YOU USE THIS WORK
'''
@inproceedings{hamdan2017vhdl,
  title={Vhdl generator for a high performance convolutional neural network fpga-based accelerator},
  author={Hamdan, Muhammad K and Rover, Diane T},
  booktitle={2017 International Conference on ReConFigurable Computing and FPGAs (ReConFig)},
  pages={1--6},
  year={2017},
  organization={IEEE}
}
'''
------------------------------------------
# Created by: Muhammad K.A. Hamdan	 
