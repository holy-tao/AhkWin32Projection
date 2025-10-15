#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_FILE_COPY_PARAMS_A extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    QueueHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    SourceRootPath{
        get {
            if(!this.HasProp("__SourceRootPath"))
                this.__SourceRootPath := PSTR(this.ptr + 16)
            return this.__SourceRootPath
        }
    }

    /**
     * @type {PSTR}
     */
    SourcePath{
        get {
            if(!this.HasProp("__SourcePath"))
                this.__SourcePath := PSTR(this.ptr + 24)
            return this.__SourcePath
        }
    }

    /**
     * @type {PSTR}
     */
    SourceFilename{
        get {
            if(!this.HasProp("__SourceFilename"))
                this.__SourceFilename := PSTR(this.ptr + 32)
            return this.__SourceFilename
        }
    }

    /**
     * @type {PSTR}
     */
    SourceDescription{
        get {
            if(!this.HasProp("__SourceDescription"))
                this.__SourceDescription := PSTR(this.ptr + 40)
            return this.__SourceDescription
        }
    }

    /**
     * @type {PSTR}
     */
    SourceTagfile{
        get {
            if(!this.HasProp("__SourceTagfile"))
                this.__SourceTagfile := PSTR(this.ptr + 48)
            return this.__SourceTagfile
        }
    }

    /**
     * @type {PSTR}
     */
    TargetDirectory{
        get {
            if(!this.HasProp("__TargetDirectory"))
                this.__TargetDirectory := PSTR(this.ptr + 56)
            return this.__TargetDirectory
        }
    }

    /**
     * @type {PSTR}
     */
    TargetFilename{
        get {
            if(!this.HasProp("__TargetFilename"))
                this.__TargetFilename := PSTR(this.ptr + 64)
            return this.__TargetFilename
        }
    }

    /**
     * @type {Integer}
     */
    CopyStyle {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<Void>}
     */
    LayoutInf {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {PSTR}
     */
    SecurityDescriptor{
        get {
            if(!this.HasProp("__SecurityDescriptor"))
                this.__SecurityDescriptor := PSTR(this.ptr + 88)
            return this.__SecurityDescriptor
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 96
    }
}
