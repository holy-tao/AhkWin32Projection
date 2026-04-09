#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MUX_PID_TYPE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_MUX_PIDLISTITEM extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    usPIDNumber {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    usProgramNumber {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {MUX_PID_TYPE}
     */
    ePIDType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
