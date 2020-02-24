# trial-llvm-hs

参考

- [Haskell+LLVM 構成で作る自作コンパイラ](https://qiita.com/toru0408/items/6bedee118ba08ea2c0b2)
- [Haskell で LLVM を作る](https://scrapbox.io/mrsekut-p/Haskell%E3%81%A7LLVM%E3%82%92%E8%A7%A6%E3%82%8B)

実行

- `$ stack build`
- `$ echo "1+2*3" >> example/ex.sc`
- `$ stack runghc app/Main.hs example/ex.sc`
- `$ llc example/ex.ll`
- `$ gcc example/ex.s -o example/ex`
- `$ ./example/ex`
