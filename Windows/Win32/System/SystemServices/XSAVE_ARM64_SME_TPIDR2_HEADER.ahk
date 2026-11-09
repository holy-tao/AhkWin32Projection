#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class XSAVE_ARM64_SME_TPIDR2_HEADER extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
