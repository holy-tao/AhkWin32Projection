#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PROVIDER_FIELD_INFO.ahk

/**
 * Defines metadata information about the requested field.
 * @see https://docs.microsoft.com/windows/win32/api//tdh/ns-tdh-provider_field_infoarray
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROVIDER_FIELD_INFOARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>FieldInfoArray</b> array.
     * @type {Integer}
     */
    NumberOfElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of field information in  the <b>FieldInfoArray</b> array. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-event_field_type">EVENT_FIELD_TYPE</a> enumeration.
     * @type {Integer}
     */
    FieldType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_field_info">PROVIDER_FIELD_INFO</a> structures that define the field's name, description and value.
     * @type {Array<PROVIDER_FIELD_INFO>}
     */
    FieldInfoArray{
        get {
            if(!this.HasProp("__FieldInfoArrayProxyArray"))
                this.__FieldInfoArrayProxyArray := Win32FixedArray(this.ptr + 8, 1, PROVIDER_FIELD_INFO, "")
            return this.__FieldInfoArrayProxyArray
        }
    }
}
