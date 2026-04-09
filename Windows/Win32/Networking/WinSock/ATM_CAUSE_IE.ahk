#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ATM_CAUSE_IE extends Win32Struct {
    static sizeof => 7

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Location {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Cause {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    DiagnosticsLength {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Array<Integer>}
     */
    Diagnostics {
        get {
            if(!this.HasProp("__DiagnosticsProxyArray"))
                this.__DiagnosticsProxyArray := Win32FixedArray(this.ptr + 3, 4, Primitive, "char")
            return this.__DiagnosticsProxyArray
        }
    }
}
