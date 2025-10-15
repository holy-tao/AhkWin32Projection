#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_STARTAPPBLOB extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ProductID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BSTR}
     */
    AppTitle{
        get {
            if(!this.HasProp("__AppTitle"))
                this.__AppTitle := BSTR(this.ptr + 16)
            return this.__AppTitle
        }
    }

    /**
     * @type {BSTR}
     */
    IconPath{
        get {
            if(!this.HasProp("__IconPath"))
                this.__IconPath := BSTR(this.ptr + 24)
            return this.__IconPath
        }
    }

    /**
     * @type {BOOL}
     */
    IsUninstallable{
        get {
            if(!this.HasProp("__IsUninstallable"))
                this.__IsUninstallable := BOOL(this.ptr + 32)
            return this.__IsUninstallable
        }
    }

    /**
     * @type {Integer}
     */
    AppInstallType {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Pointer<Guid>}
     */
    InstanceID {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    IsModern{
        get {
            if(!this.HasProp("__IsModern"))
                this.__IsModern := BOOL(this.ptr + 52)
            return this.__IsModern
        }
    }

    /**
     * @type {BOOL}
     */
    IsModernLightUp{
        get {
            if(!this.HasProp("__IsModernLightUp"))
                this.__IsModernLightUp := BOOL(this.ptr + 56)
            return this.__IsModernLightUp
        }
    }

    /**
     * @type {Integer}
     */
    LightUpSupportMask {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 64
    }
}
