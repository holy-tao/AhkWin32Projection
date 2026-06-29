#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASPPPLCPW {
    #StructPack 4

    dwSize : UInt32

    fBundled : BOOL

    dwError : UInt32

    dwAuthenticationProtocol : UInt32

    dwAuthenticationData : UInt32

    dwEapTypeId : UInt32

    dwServerAuthenticationProtocol : UInt32

    dwServerAuthenticationData : UInt32

    dwServerEapTypeId : UInt32

    fMultilink : BOOL

    dwTerminateReason : UInt32

    dwServerTerminateReason : UInt32

    szReplyMessage : WCHAR[1024]

    dwOptions : UInt32

    dwServerOptions : UInt32

}
