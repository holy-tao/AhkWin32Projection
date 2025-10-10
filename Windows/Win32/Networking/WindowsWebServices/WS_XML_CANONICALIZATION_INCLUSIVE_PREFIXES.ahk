#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An array of XML prefixes that should be treated as inclusive prefixes during exclusive XML canonicalization. The treatment of inclusive prefixes is defined in RFC 3741.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_canonicalization_inclusive_prefixes
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of prefixes.
     * @type {Integer}
     */
    prefixCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of prefixes.
     * @type {Pointer<WS_XML_STRING>}
     */
    prefixes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
