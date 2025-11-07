#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a node of text content in xml.
 * @remarks
 * 
 * XML has no concept of typed content; all content is textual in nature.  In some cases this is inefficient, requiring
 *         translation between text and natural form (e.g. the characters '1','2','8' and the numerical value 128) or requiring
 *         more bytes of storage for the representation (e.g. the characters '2',5','5' might take 3 bytes, while the numerical
 *         value 255 could only take 1).
 *         This structure provides a way to indicate textual content in xml without physically representing it as the characters
 *         that comprise that value.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_TEXT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    textType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
