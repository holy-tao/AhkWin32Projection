#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_TS_SELECTORINFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

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
     * @type {Guid}
     */
    guidNetworkType {
        get {
            if(!this.HasProp("__guidNetworkType"))
                this.__guidNetworkType := Guid(4, this)
            return this.__guidNetworkType
        }
    }

    /**
     * @type {Integer}
     */
    bTSIDCount {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    usTSID {
        get {
            if(!this.HasProp("__usTSIDProxyArray"))
                this.__usTSIDProxyArray := Win32FixedArray(this.ptr + 22, 1, Primitive, "ushort")
            return this.__usTSIDProxyArray
        }
    }
}
