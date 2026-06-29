#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An optional type description used with WS_GUID_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_guid_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_GUID_DESCRIPTION extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * The required value.
     * @type {Guid}
     */
    value {
        get {
            if(!this.HasProp("__value"))
                this.__value := Guid(0, this)
            return this.__value
        }
    }
}
