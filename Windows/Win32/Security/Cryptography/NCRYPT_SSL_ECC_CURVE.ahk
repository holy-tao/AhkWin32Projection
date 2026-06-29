#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_SSL_ECC_CURVE {
    #StructPack 4

    szCurveName : WCHAR[255]

    szOID : CHAR[255]

    dwPublicKeyLength : UInt32

    dwCurveType : UInt32

    dwFlags : UInt32

}
