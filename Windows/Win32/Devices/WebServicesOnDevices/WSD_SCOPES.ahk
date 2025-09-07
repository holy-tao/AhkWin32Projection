#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * A collection of scopes used in WS-Discovery messaging.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_scopes
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SCOPES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A matching rule used for scopes.
     * @type {PWSTR}
     */
    MatchBy{
        get {
            if(!this.HasProp("__MatchBy"))
                this.__MatchBy := PWSTR(this.ptr + 0)
            return this.__MatchBy
        }
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that contains a list of scopes.
     * @type {Pointer<WSD_URI_LIST>}
     */
    Scopes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
