#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RCVALL_VALUE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class RCVALL_IF extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {RCVALL_VALUE}
     */
    Mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Interface {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
