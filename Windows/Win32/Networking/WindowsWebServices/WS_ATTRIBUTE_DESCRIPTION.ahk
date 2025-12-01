#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a mapping between a C data type and an XML attribute.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_attribute_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ATTRIBUTE_DESCRIPTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The local name of the XML attribute.
     * @type {Pointer<WS_XML_STRING>}
     */
    attributeLocalName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The namespace of the XML attribute.
     * @type {Pointer<WS_XML_STRING>}
     */
    attributeNs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The type that corresponds to the XML attribute.
     *                 
     * 
     * Not all types support being read and written as attributes.  If the
     *                     documentation for the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a> indicates it supports
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>, then it can be used with this structure.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     * @type {Pointer<Void>}
     */
    typeDescription {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
