#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_TS_SELECTORINFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    bTSInfolength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    bReserved {
        get {
            if(!this.HasProp("__bReservedProxyArray"))
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 1, 2, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    guidNetworkType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bTSIDCount {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<Integer>}
     */
    usTSID {
        get {
            if(!this.HasProp("__usTSIDProxyArray"))
                this.__usTSIDProxyArray := Win32FixedArray(this.ptr + 18, 1, Primitive, "ushort")
            return this.__usTSIDProxyArray
        }
    }
}
