#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    filter{
        get {
            if(!this.HasProp("__filter"))
                this.__filter := PWSTR(this.ptr + 0)
            return this.__filter
        }
    }

    /**
     * Reserved for future use. This parameter must be <b>NULL</b>.
     * @type {PWSTR}
     */
    dialect{
        get {
            if(!this.HasProp("__dialect"))
                this.__dialect := PWSTR(this.ptr + 8)
            return this.__dialect
        }
    }
}
