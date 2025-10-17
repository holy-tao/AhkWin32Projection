#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_BACKUP_QUEUE_PARAMS_V2_W extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    FullInfPath {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    FilenameOffset {
        get => NumGet(this, 524, "int")
        set => NumPut("int", value, this, 524)
    }

    /**
     * @type {String}
     */
    ReinstallInstance {
        get => StrGet(this.ptr + 528, 259, "UTF-16")
        set => StrPut(value, this.ptr + 528, 259, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1048
    }
}
