#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset ANSI
 */
class DEV_BROADCAST_DEVICEINTERFACE_A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dbcc_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dbcc_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dbcc_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    dbcc_classguid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {String}
     */
    dbcc_name {
        get => StrGet(this.ptr + 24, 0, "UTF-8")
        set => StrPut(value, this.ptr + 24, 0, "UTF-8")
    }
}
