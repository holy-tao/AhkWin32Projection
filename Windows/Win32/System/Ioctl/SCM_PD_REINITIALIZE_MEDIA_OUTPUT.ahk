#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCM_PD_MEDIA_REINITIALIZATION_STATUS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_REINITIALIZE_MEDIA_OUTPUT extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {SCM_PD_MEDIA_REINITIALIZATION_STATUS}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
