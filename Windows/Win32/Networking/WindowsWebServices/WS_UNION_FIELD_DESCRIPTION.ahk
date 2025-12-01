#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_FIELD_DESCRIPTION.ahk

/**
 * Represents serialization information about a field within a union. See WS_UNION_DESCRIPTION.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_union_field_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_UNION_FIELD_DESCRIPTION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The enumeration value that field of the union corresponds to.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_union_description">WS_UNION_DESCRIPTION</a>.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Information about the field.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_union_description">WS_UNION_DESCRIPTION</a>.
     * @type {WS_FIELD_DESCRIPTION}
     */
    field{
        get {
            if(!this.HasProp("__field"))
                this.__field := WS_FIELD_DESCRIPTION(8, this)
            return this.__field
        }
    }
}
