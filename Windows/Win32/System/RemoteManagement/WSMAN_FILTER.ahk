#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * WSMAN_FILTER is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_filter
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_FILTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved for future use. This parameter must be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    filter {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved for future use. This parameter must be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    dialect {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
