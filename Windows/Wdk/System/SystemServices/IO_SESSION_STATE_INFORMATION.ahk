#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk
#Include .\IO_SESSION_STATE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_SESSION_STATE_INFORMATION extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {IO_SESSION_STATE}
     */
    SessionState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    LocalSession {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
