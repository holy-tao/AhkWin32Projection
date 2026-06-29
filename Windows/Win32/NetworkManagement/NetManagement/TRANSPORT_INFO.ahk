#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\TRANSPORT_TYPE.ahk" { TRANSPORT_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct TRANSPORT_INFO {
    #StructPack 4

    Type : TRANSPORT_TYPE

    SkipCertificateCheck : BOOLEAN

    TcpPort : UInt16

    QuicPort : UInt16

    RdmaPort : UInt16

    Flags : UInt32

}
