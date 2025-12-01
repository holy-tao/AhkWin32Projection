#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_NODE.ahk
#Include .\WS_XML_STRING.ahk

/**
 * Represents a comment.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_comment_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_COMMENT_NODE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a>.
     * @type {WS_XML_NODE}
     */
    node{
        get {
            if(!this.HasProp("__node"))
                this.__node := WS_XML_NODE(0, this)
            return this.__node
        }
    }

    /**
     * The textual content of the comment.  In the example, it is the string "The message follows".
     * @type {WS_XML_STRING}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := WS_XML_STRING(8, this)
            return this.__value
        }
    }
}
