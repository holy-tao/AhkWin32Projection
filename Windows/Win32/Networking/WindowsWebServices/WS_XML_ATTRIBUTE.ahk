#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an attribute (for example, &lt;a:purchaseOrder xmlns:a=&quot;http://tempuri.org&quot; id=&quot;5&quot;&gt;)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_attribute
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_ATTRIBUTE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Whether to use a single quote or double quote to surround an attribute value.  In the example, the value of singleQuote for attribute "id" would be <b>FALSE</b>.
     * @type {Integer}
     */
    singleQuote {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Whether or not the attribute is an xmlns attribute.  In the example above, this would be <b>TRUE</b> for the attribute "xmlns:a", but <b>FALSE</b> for the attribute "id".
     * @type {Integer}
     */
    isXmlNs {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The prefix of the attribute.  In the example above, the prefix for attribute "xmlns:a" is "a", while the prefix for "id" is a zero length string.
     *         
     * 
     * The prefix for the attribute "xmlns" is a zero length string.
     * @type {Pointer<WS_XML_STRING>}
     */
    prefix {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The localName of the attribute.  In the example above, the localName for attribute "xmlns:a" is not used so it is <b>NULL</b>.  The localName for attribute "id" is "id".
     * @type {Pointer<WS_XML_STRING>}
     */
    localName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The namespace of the attribute.  In the example above, the namespace for the attribute "xmlns:a" is "http://tempuri.org".  The namespace for attribute "id" is the
     *           empty namespace which is represented by a zero length string.
     * @type {Pointer<WS_XML_STRING>}
     */
    ns {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The value of the attribute.  In the example above the value for attribute "xmlns:a" is not used so it is <b>NULL</b>.  The value for the attribute "id" is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a> that refers to the value "5".
     * @type {Pointer<WS_XML_TEXT>}
     */
    value {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
