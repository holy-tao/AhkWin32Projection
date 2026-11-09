#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Environment
 */
class ENCLAVE_PACKAGE_IDENTITY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Array<Integer>}
     */
    PackageId {
        get {
            if(!this.HasProp("__PackageIdProxyArray"))
                this.__PackageIdProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__PackageIdProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PackageSvn {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
