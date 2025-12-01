#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_STRING.ahk

/**
 * A structure used to specify an XML name (of an element or an attribute) as a local name, namespace pair.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_qname
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_QNAME extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The local name.
     * @type {WS_XML_STRING}
     */
    localName{
        get {
            if(!this.HasProp("__localName"))
                this.__localName := WS_XML_STRING(0, this)
            return this.__localName
        }
    }

    /**
     * The namespace URI.
     * @type {WS_XML_STRING}
     */
    ns{
        get {
            if(!this.HasProp("__ns"))
                this.__ns := WS_XML_STRING(32, this)
            return this.__ns
        }
    }
}
