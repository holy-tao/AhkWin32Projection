#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_ITEM_RANGE.ahk" { WS_ITEM_RANGE }
#Import ".\WS_FIELD_MAPPING.ahk" { WS_FIELD_MAPPING }
#Import ".\WS_TYPE.ahk" { WS_TYPE }
#Import ".\WS_DEFAULT_VALUE.ahk" { WS_DEFAULT_VALUE }
#Import ".\WS_FIELD_DESCRIPTION.ahk" { WS_FIELD_DESCRIPTION }

/**
 * Represents serialization information about a field within a union. See WS_UNION_DESCRIPTION.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_union_field_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_UNION_FIELD_DESCRIPTION {
    #StructPack 8

    /**
     * The enumeration value that field of the union corresponds to.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_union_description">WS_UNION_DESCRIPTION</a>.
     */
    value : Int32

    /**
     * Information about the field.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_union_description">WS_UNION_DESCRIPTION</a>.
     */
    field : WS_FIELD_DESCRIPTION

}
