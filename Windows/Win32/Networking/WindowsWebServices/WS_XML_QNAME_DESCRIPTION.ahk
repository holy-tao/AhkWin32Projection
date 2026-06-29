#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This type description is used with WS_XML_QNAME_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_qname_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_QNAME_DESCRIPTION {
    #StructPack 4

    /**
     * The minimum number of bytes of UTF8 character data 
     *                     for the local name string.
     */
    minLocalNameByteCount : UInt32

    /**
     * The maximum number of bytes of UTF8 character data
     *                     for the local name string.
     */
    maxLocalNameByteCount : UInt32

    /**
     * The minimum number of bytes of UTF8 character data 
     *                     for the namespace string.
     */
    minNsByteCount : UInt32

    /**
     * The maximum number of bytes of UTF8 character data 
     *                     for the namespace string.
     */
    maxNsByteCount : UInt32

}
