#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Specifies constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_bool_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_BOOL_DESCRIPTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the required value.
     * @type {BOOL}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := BOOL(this.ptr + 0)
            return this.__value
        }
    }
}
