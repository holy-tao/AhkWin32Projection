#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptGenRandomFn.ahk" { BCryptGenRandomFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_RNG_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : BCryptOpenAlgorithmProviderFn

    GetProperty : BCryptGetPropertyFn

    SetProperty : BCryptSetPropertyFn

    CloseAlgorithmProvider : BCryptCloseAlgorithmProviderFn

    GenRandom : BCryptGenRandomFn

}
