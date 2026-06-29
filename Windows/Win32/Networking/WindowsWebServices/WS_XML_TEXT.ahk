#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }

/**
 * Represents a node of text content in xml.
 * @remarks
 * XML has no concept of typed content; all content is textual in nature.  In some cases this is inefficient, requiring
 *         translation between text and natural form (e.g. the characters '1','2','8' and the numerical value 128) or requiring
 *         more bytes of storage for the representation (e.g. the characters '2',5','5' might take 3 bytes, while the numerical
 *         value 255 could only take 1).
 *         This structure provides a way to indicate textual content in xml without physically representing it as the characters
 *         that comprise that value.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_TEXT {
    #StructPack 4

    textType : WS_XML_TEXT_TYPE

}
