# dsci-310-tutorial-6

Below you fill find the text for an example data analysis report using R and Quarto.

1. Copy the text below into your own quarto document
2. Render the document to check it is all working
3. Your task is to refactor each section into separate R scripts (01_load_data.R, 02_methods.R, 03_model.R, 04_results.R) and make sure each script can completely run independently from one another without source()ing another script.
4. Your scripts should save out what ever data artifact it needs for both the pipline code and the quarto report
5. Create a Makefile with a target named all that will run all the scripts in the correct order.
6. Edit the quarto report such that it does not need to run any of the script code and loads up any table data or figure it needs in the report. You can load data from the script and write code to make a table prettier in quarto if you’d like.

You can download the sample quarto document here: [https://github.com/UBC-DSCI/dsci-310-student/blob/main/example_files/t6-quarto.qmd](https://github.com/UBC-DSCI/dsci-310-student/blob/main/example_files/t6-quarto.qmd)
