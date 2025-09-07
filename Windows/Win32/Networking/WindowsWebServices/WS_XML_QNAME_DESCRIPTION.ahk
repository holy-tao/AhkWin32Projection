#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This type description is used with WS_XML_QNAME_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_qname_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_QNAME_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The minimum number of bytes of UTF8 character data 
     *                     for the local name string.
     * @type {Integer}
     */
    minLocalNameByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of bytes of UTF8 character data
     *                     for the local name string.
     * @type {Integer}
     */
    maxLocalNameByteCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minimum number of bytes of UTF8 character data 
     *                     for the namespace string.
     * @type {Integer}
     */
    minNsByteCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum number of bytes of UTF8 character data 
     *                     for the namespace string.
     * @type {Integer}
     */
    maxNsByteCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
