function [] = matrix2table(matrix, title, index)
%MATRIX2TABLE makes a LaTex compatible table from a matrix.
%   matrix: the matrix to turn into a table
%   title: the title of the table
%   index: if it's 1 then the first column will be printed as integers
% example code: A = [1 2 3 100 ; 4 5 6 200; 7 8 9 300; 10 11 12 400; 13 14 15 500]
%               matrix2table(A, "MyTable", 1)
% Tomás Ibaceta Guerra (2021).
%---------------------
    [row,col] = size(matrix);
    A = matrix';
    disp("%--------MatrixToTable------")
    disp("\begin{table}[H]")
    disp("\centering")
    fprintf(1, "\\begin{tabular}{")
    for i = 1:col
        fprintf(1,"|c")
    end
    fprintf(1,"|}\n")
    disp("\hline")
    fprintf(1, "\\multicolumn{%d}{|c|}{ %s \\%% } \\\\ \\hline\n", col ,title)
    for i = 1:(col-1)
        fprintf(1, "T%d  &  ", i)
    end
    fprintf(1, "T%d \\\\ \\hline\n", col);
    for i = 1:numel(A)
        if mod(i,col) == 0 %on the last line
            fprintf(1, "%0.5f  \\\\ \\hline\n", A(i))
        elseif mod(i,col) == 1 %on the first line
            if index == 1
                fprintf(1, "%d & ", A(i))
            else
                fprintf(1, "%0.5f & ", A(i))
            end
        else
            fprintf(1, "%0.5f & ", A(i))
        end
    end

    disp("\end{tabular}")
    disp("\end{table}")   
end

