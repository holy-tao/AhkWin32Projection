#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct ENDPOINTADDRESS2 {
    #StructPack 8

    serviceUrl : PWSTR

    policyUrl : PWSTR

    identityType : UInt32

    identityBytes : IntPtr

}
