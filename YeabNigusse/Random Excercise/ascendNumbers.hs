--Receive 3 numbers and display them in ascending order from smallest to largest 

main = do 
    putStrLn "how many numbers do you want to enter"
    n <- getLine
    putStrLn "enter numbers"
    numbers <- sequence (replicate (read n) getLine)
    print (toInt numbers)

toInt :: [String] -> [Int]
toInt  = map (\x -> read x) 

string = "my string
is long"