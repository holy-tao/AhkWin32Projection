#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This type is used to store a set of attributes that have not been directly mapped to field of a structure.
 * @remarks
 * This structure is typically used to preserve unknown attributes
  *                 when deserializing a structure.
  *                 See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ATTRIBUTES_FIELD_MAPPING</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_ANY_ATTRIBUTES_TYPE</a> for more
  *                 information.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_any_attributes
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ANY_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of attributes.  This field may
     *                     be <b>NULL</b> if attributeCount is zero.
     * @type {Pointer<WS_ANY_ATTRIBUTE>}
     */
    attributes {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of attributes in the array.
     * @type {Integer}
     */
    attributeCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
