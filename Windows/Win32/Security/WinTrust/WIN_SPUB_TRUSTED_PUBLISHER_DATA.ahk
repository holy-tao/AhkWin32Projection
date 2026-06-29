#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WIN_CERTIFICATE.ahk" { WIN_CERTIFICATE }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WIN_SPUB_TRUSTED_PUBLISHER_DATA {
    #StructPack 8

    hClientToken : HANDLE

    lpCertificate : WIN_CERTIFICATE.Ptr

}
