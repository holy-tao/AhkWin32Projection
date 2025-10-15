#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CONFIG_CI_PROV_INFO_RESULT2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwResult {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwPolicyIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    fIsExplicitDeny{
        get {
            if(!this.HasProp("__fIsExplicitDeny"))
                this.__fIsExplicitDeny := BOOLEAN(this.ptr + 16)
            return this.__fIsExplicitDeny
        }
    }

    /**
     * @type {Integer}
     */
    cbCalculatedFileHash {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCalculatedFileHash {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
