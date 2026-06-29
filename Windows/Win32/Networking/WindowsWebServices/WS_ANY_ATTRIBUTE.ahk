#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * This type is used to store an attribute that has not been directly mapped to a field.
 * @remarks
 * This structure is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_any_attributes">WS_ANY_ATTRIBUTES</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_any_attribute
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ANY_ATTRIBUTE {
    #StructPack 8

    /**
     * Specifies the localName of the attribute.
     */
    localName : WS_XML_STRING

    /**
     * Specifies the namespace of the attribute.
     */
    ns : WS_XML_STRING

    /**
     * Specifies the value of the attribute.  This
     *                     field may not be <b>NULL</b>.
     */
    value : WS_XML_TEXT.Ptr

}
