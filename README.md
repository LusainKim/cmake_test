# cmake_test repository

## Intro

cmake를 사용하여 visual studio solution을 만드는 간단한 샘플 프로젝트입니다.

## Requirement

* Windows 10
* Visual Studio 2013 이상(권장: Visual Studio 2017)
* cmake 3.8.2 이상의 버전(권장: 최신 버전의 cmake)

## Build

repo의 root directory에 `build` 폴더를 생성하고 해당 위치에서 다음 커맨드를 입력합니다
`-G` 는 generator를 설정하는 옵션입니다. 생성하고 싶은 제네레이터를 확인하세요.

```
build > cmake -G "Visual Studio 15 2017 Win64" ..
```

## Output

빌드 산출물은 root/bin/$(configuration) 폴더에 생성됩니다.
디버깅 시 해당 위치를 작업 디렉터리로 설정합니다.
