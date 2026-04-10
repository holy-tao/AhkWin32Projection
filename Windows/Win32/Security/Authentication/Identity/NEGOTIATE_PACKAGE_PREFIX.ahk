#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class NEGOTIATE_PACKAGE_PREFIX extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    PackageId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    PackageDataA {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    PackageDataW {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    PrefixLen {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    Prefix {
        get {
            if(!this.HasProp("__PrefixProxyArray"))
                this.__PrefixProxyArray := Win32FixedArray(this.ptr + 32, 32, Primitive, "char")
            return this.__PrefixProxyArray
        }
    }
}
