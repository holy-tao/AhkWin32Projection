#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This type description is used with WS_XML_STRING_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_string_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_STRING_DESCRIPTION {
    #StructPack 4

    /**
     * The minimum number of bytes of UTF8 character data.
     */
    minByteCount : UInt32

    /**
     * The maximum number of bytes of UTF8 character data.
     */
    maxByteCount : UInt32

}
