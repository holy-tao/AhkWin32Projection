#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_BACKUP_QUEUE_PARAMS_V2_A extends Win32Struct
{
    static sizeof => 528

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
        get => StrGet(this.ptr + 4, 259, "UTF-8")
        set => StrPut(value, this.ptr + 4, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    FilenameOffset {
        get => NumGet(this, 264, "int")
        set => NumPut("int", value, this, 264)
    }

    /**
     * @type {String}
     */
    ReinstallInstance {
        get => StrGet(this.ptr + 268, 259, "UTF-8")
        set => StrPut(value, this.ptr + 268, 259, "UTF-8")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 528
    }
}
