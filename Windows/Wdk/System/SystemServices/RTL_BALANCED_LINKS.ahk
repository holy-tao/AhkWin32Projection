#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTL_BALANCED_LINKS.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class RTL_BALANCED_LINKS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<RTL_BALANCED_LINKS>}
     */
    Parent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<RTL_BALANCED_LINKS>}
     */
    LeftChild {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<RTL_BALANCED_LINKS>}
     */
    RightChild {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {CHAR}
     */
    Balance {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 25, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
