#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_ECC_CURVE_NAMES {
    #StructPack 8

    dwEccCurveNames : UInt32

    pEccCurveNames : PWSTR.Ptr

}
