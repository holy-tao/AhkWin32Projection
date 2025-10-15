#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\BOOL.ahk

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
     * @type {PWSTR}
     */
    ImagePath{
        get {
            if(!this.HasProp("__ImagePath"))
                this.__ImagePath := PWSTR(this.ptr + 8)
            return this.__ImagePath
        }
    }

    /**
     * @type {HANDLE}
     */
    hImageFileHandle{
        get {
            if(!this.HasProp("__hImageFileHandle"))
                this.__hImageFileHandle := HANDLE(this.ptr + 16)
            return this.__hImageFileHandle
        }
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
     * @type {HWND}
     */
    hWndParent{
        get {
            if(!this.HasProp("__hWndParent"))
                this.__hWndParent := HWND(this.ptr + 120)
            return this.__hWndParent
        }
    }

    /**
     * @type {Integer}
     */
    dwWVTUIChoice {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {PWSTR}
     */
    PackageMoniker{
        get {
            if(!this.HasProp("__PackageMoniker"))
                this.__PackageMoniker := PWSTR(this.ptr + 136)
            return this.__PackageMoniker
        }
    }

    /**
     * @type {PWSTR}
     */
    PackagePublisher{
        get {
            if(!this.HasProp("__PackagePublisher"))
                this.__PackagePublisher := PWSTR(this.ptr + 144)
            return this.__PackagePublisher
        }
    }

    /**
     * @type {PWSTR}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := PWSTR(this.ptr + 152)
            return this.__PackageName
        }
    }

    /**
     * @type {Integer}
     */
    PackageVersion {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {BOOL}
     */
    PackageIsFramework{
        get {
            if(!this.HasProp("__PackageIsFramework"))
                this.__PackageIsFramework := BOOL(this.ptr + 168)
            return this.__PackageIsFramework
        }
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
