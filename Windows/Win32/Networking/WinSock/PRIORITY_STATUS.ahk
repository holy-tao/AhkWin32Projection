#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKET_PRIORITY_HINT.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class PRIORITY_STATUS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {SOCKET_PRIORITY_HINT}
     */
    Sender {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SOCKET_PRIORITY_HINT}
     */
    Receiver {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
