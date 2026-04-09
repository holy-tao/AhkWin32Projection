#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_LLCP_SOCKET_ERROR.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_LLCP_SOCKET_ERROR_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hSocket {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NFC_LLCP_SOCKET_ERROR}
     */
    eSocketError {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
