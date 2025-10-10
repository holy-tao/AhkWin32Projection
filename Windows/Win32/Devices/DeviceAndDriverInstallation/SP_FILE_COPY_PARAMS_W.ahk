#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_FILE_COPY_PARAMS_W extends Win32Struct
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
     * @type {Pointer<Char>}
     */
    SourceRootPath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    SourcePath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Char>}
     */
    SourceFilename {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Char>}
     */
    SourceDescription {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Char>}
     */
    SourceTagfile {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Char>}
     */
    TargetDirectory {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Char>}
     */
    TargetFilename {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
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
     * @type {Pointer<Char>}
     */
    SecurityDescriptor {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
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
