#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TCP_ICW_LEVEL.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class TCP_ICW_PARAMETERS extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {TCP_ICW_LEVEL}
     */
    Level {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
