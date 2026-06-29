#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents an attribute (for example, &lt;a:purchaseOrder xmlns:a=&quot;http://tempuri.org&quot; id=&quot;5&quot;&gt;)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_attribute
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_ATTRIBUTE {
    #StructPack 8

    /**
     * Whether to use a single quote or double quote to surround an attribute value.  In the example, the value of singleQuote for attribute "id" would be <b>FALSE</b>.
     */
    singleQuote : Int8

    /**
     * Whether or not the attribute is an xmlns attribute.  In the example above, this would be <b>TRUE</b> for the attribute "xmlns:a", but <b>FALSE</b> for the attribute "id".
     */
    isXmlNs : Int8

    /**
     * The prefix of the attribute.  In the example above, the prefix for attribute "xmlns:a" is "a", while the prefix for "id" is a zero length string.
     *         
     * 
     * The prefix for the attribute "xmlns" is a zero length string.
     */
    prefix : WS_XML_STRING.Ptr

    /**
     * The localName of the attribute.  In the example above, the localName for attribute "xmlns:a" is not used so it is <b>NULL</b>.  The localName for attribute "id" is "id".
     */
    localName : WS_XML_STRING.Ptr

    /**
     * The namespace of the attribute.  In the example above, the namespace for the attribute "xmlns:a" is "http://tempuri.org".  The namespace for attribute "id" is the
     *           empty namespace which is represented by a zero length string.
     */
    ns : WS_XML_STRING.Ptr

    /**
     * The value of the attribute.  In the example above the value for attribute "xmlns:a" is not used so it is <b>NULL</b>.  The value for the attribute "id" is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a> that refers to the value "5".
     */
    value : WS_XML_TEXT.Ptr

}
