#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class TLS_HYBRID_KEYEXCHANGE_BLOB extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwKeyType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumBlobs {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Array<PWSTR>}
     */
    rgwszBlobTypes {
        get {
            if(!this.HasProp("__rgwszBlobTypesProxyArray"))
                this.__rgwszBlobTypesProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "ptr")
            return this.__rgwszBlobTypesProxyArray
        }
    }

    /**
     * @type {Array<Pointer<Integer>>}
     */
    rgbBlobs {
        get {
            if(!this.HasProp("__rgbBlobsProxyArray"))
                this.__rgbBlobsProxyArray := Win32FixedArray(this.ptr + 48, 4, Primitive, "ptr")
            return this.__rgbBlobsProxyArray
        }
    }
}
