#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_CODE_PROPERTIES_V2 extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCheckFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Char>}
     */
    ImagePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    hImageFileHandle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    UrlZoneId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    ImageHash{
        get {
            if(!this.HasProp("__ImageHashProxyArray"))
                this.__ImageHashProxyArray := Win32FixedArray(this.ptr + 28, 64, Primitive, "char")
            return this.__ImageHashProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwImageHashSize {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    HashAlgorithm {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pByteBlock {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<Void>}
     */
    hWndParent {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    dwWVTUIChoice {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Pointer<Char>}
     */
    PackageMoniker {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<Char>}
     */
    PackagePublisher {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<Char>}
     */
    PackageName {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    PackageVersion {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    PackageIsFramework {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 176
    }
}
