#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_WRITER_PROPERTY_ID.ahk" { WS_XML_WRITER_PROPERTY_ID }

/**
 * Specifies a writer specific setting.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_WRITER_PROPERTY {
    #StructPack 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_writer_property_id">WS_XML_WRITER_PROPERTY_ID</a>.
     */
    id : WS_XML_WRITER_PROPERTY_ID

    /**
     * A pointer to the value to set.
     *             The pointer must have an alignment compatible with the type
     *             of the property.
     */
    value : IntPtr

    /**
     * The size in bytes of the memory pointed to by value.
     */
    valueSize : UInt32

}
