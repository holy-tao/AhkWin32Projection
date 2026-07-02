#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptDestroyHashFn.ahk" { BCryptDestroyHashFn }
#Import ".\BCryptProcessMultiOperationsFn.ahk" { BCryptProcessMultiOperationsFn }
#Import ".\BCryptCreateMultiHashFn.ahk" { BCryptCreateMultiHashFn }
#Import ".\BCryptHashDataFn.ahk" { BCryptHashDataFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\BCryptCreateHashFn.ahk" { BCryptCreateHashFn }
#Import ".\BCryptDuplicateHashFn.ahk" { BCryptDuplicateHashFn }
#Import ".\BCryptFinishHashFn.ahk" { BCryptFinishHashFn }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_HASH_FUNCTION_TABLE {
    #StructPack 8

    Version : BCRYPT_INTERFACE_VERSION

    OpenAlgorithmProvider : BCryptOpenAlgorithmProviderFn

    GetProperty : BCryptGetPropertyFn

    SetProperty : BCryptSetPropertyFn

    CloseAlgorithmProvider : BCryptCloseAlgorithmProviderFn

    CreateHash : BCryptCreateHashFn

    HashData : BCryptHashDataFn

    FinishHash : BCryptFinishHashFn

    DuplicateHash : BCryptDuplicateHashFn

    DestroyHash : BCryptDestroyHashFn

    CreateMultiHash : BCryptCreateMultiHashFn

    ProcessMultiOperations : BCryptProcessMultiOperationsFn

}
