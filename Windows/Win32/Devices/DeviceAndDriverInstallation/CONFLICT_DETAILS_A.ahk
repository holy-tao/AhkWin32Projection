#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-conflict_details_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class CONFLICT_DETAILS_A extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CD_ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CD_ulMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CD_dnDevInst {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    CD_rdResDes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CD_ulFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    CD_szDescription {
        get => StrGet(this.ptr + 28, 259, "UTF-8")
        set => StrPut(value, this.ptr + 28, 259, "UTF-8")
    }
}
