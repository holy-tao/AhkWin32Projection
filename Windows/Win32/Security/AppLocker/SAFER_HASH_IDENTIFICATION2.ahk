#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAFER_IDENTIFICATION_HEADER.ahk" { SAFER_IDENTIFICATION_HEADER }
#Import ".\SAFER_IDENTIFICATION_TYPES.ahk" { SAFER_IDENTIFICATION_TYPES }
#Import ".\SAFER_HASH_IDENTIFICATION.ahk" { SAFER_HASH_IDENTIFICATION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Cryptography\ALG_ID.ahk" { ALG_ID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.AppLocker
 */
export default struct SAFER_HASH_IDENTIFICATION2 {
    #StructPack 8

    hashIdentification : SAFER_HASH_IDENTIFICATION

    HashSize : UInt32

    ImageHash : Int8[64]

    HashAlgorithm : ALG_ID

}
