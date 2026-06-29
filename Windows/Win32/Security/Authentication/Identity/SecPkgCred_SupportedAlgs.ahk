#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Cryptography\ALG_ID.ahk" { ALG_ID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCred_SupportedAlgs {
    #StructPack 8

    cSupportedAlgs : UInt32

    palgSupportedAlgs : ALG_ID.Ptr

}
