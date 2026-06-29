#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\DRIVER_VER_MAJORMINOR.ahk" { DRIVER_VER_MAJORMINOR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct DRIVER_VER_INFO {
    #StructPack 8

    cbStruct : UInt32

    dwReserved1 : IntPtr

    dwReserved2 : IntPtr

    dwPlatform : UInt32

    dwVersion : UInt32

    wszVersion : WCHAR[260]

    wszSignedBy : WCHAR[260]

    pcSignerCertContext : CERT_CONTEXT.Ptr

    sOSVersionLow : DRIVER_VER_MAJORMINOR

    sOSVersionHigh : DRIVER_VER_MAJORMINOR

    dwBuildNumberLow : UInt32

    dwBuildNumberHigh : UInt32

}
