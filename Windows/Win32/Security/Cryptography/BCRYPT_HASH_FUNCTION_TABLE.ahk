#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_INTERFACE_VERSION.ahk" { BCRYPT_INTERFACE_VERSION }
#Import ".\BCryptCloseAlgorithmProviderFn.ahk" { BCryptCloseAlgorithmProviderFn }
#Import ".\BCryptCreateHashFn.ahk" { BCryptCreateHashFn }
#Import ".\BCryptCreateMultiHashFn.ahk" { BCryptCreateMultiHashFn }
#Import ".\BCryptDestroyHashFn.ahk" { BCryptDestroyHashFn }
#Import ".\BCryptDuplicateHashFn.ahk" { BCryptDuplicateHashFn }
#Import ".\BCryptFinishHashFn.ahk" { BCryptFinishHashFn }
#Import ".\BCryptGetPropertyFn.ahk" { BCryptGetPropertyFn }
#Import ".\BCryptHashDataFn.ahk" { BCryptHashDataFn }
#Import ".\BCryptOpenAlgorithmProviderFn.ahk" { BCryptOpenAlgorithmProviderFn }
#Import ".\BCryptProcessMultiOperationsFn.ahk" { BCryptProcessMultiOperationsFn }
#Import ".\BCryptSetPropertyFn.ahk" { BCryptSetPropertyFn }

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
