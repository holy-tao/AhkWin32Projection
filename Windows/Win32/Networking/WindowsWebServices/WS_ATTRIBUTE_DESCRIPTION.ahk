#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_TYPE.ahk" { WS_TYPE }

/**
 * Represents a mapping between a C data type and an XML attribute.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_attribute_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ATTRIBUTE_DESCRIPTION {
    #StructPack 8

    /**
     * The local name of the XML attribute.
     */
    attributeLocalName : WS_XML_STRING.Ptr

    /**
     * The namespace of the XML attribute.
     */
    attributeNs : WS_XML_STRING.Ptr

    /**
     * The type that corresponds to the XML attribute.
     *                 
     * 
     * Not all types support being read and written as attributes.  If the
     *                     documentation for the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a> indicates it supports
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>, then it can be used with this structure.
     */
    type : WS_TYPE

    /**
     * Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     */
    typeDescription : IntPtr

}
