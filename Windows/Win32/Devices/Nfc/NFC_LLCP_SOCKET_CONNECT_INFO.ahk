#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_LLCP_SERVICE_NAME_ENTRY.ahk" { NFC_LLCP_SERVICE_NAME_ENTRY }
#Import ".\NFC_LLCP_SOCKET_CONNECT_TYPE.ahk" { NFC_LLCP_SOCKET_CONNECT_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_CONNECT_INFO {
    #StructPack 8

    hRemoteDev : IntPtr

    hSocket : IntPtr

    eConnectType : NFC_LLCP_SOCKET_CONNECT_TYPE

    bSAP : Int8

    static __New() {
        DefineProp(this.Prototype, 'sServiceName', { type: NFC_LLCP_SERVICE_NAME_ENTRY, offset: 20 })
        this.DeleteProp("__New")
    }
}
