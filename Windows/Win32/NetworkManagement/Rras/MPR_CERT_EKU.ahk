#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_CERT_EKU {
    #StructPack 8

    dwSize : UInt32

    IsEKUOID : BOOL

    pwszEKU : PWSTR

}
