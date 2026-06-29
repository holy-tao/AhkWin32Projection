#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }

/**
 * An array of XML prefixes that should be treated as inclusive prefixes during exclusive XML canonicalization. The treatment of inclusive prefixes is defined in RFC 3741.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_canonicalization_inclusive_prefixes
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES {
    #StructPack 8

    /**
     * The number of prefixes.
     */
    prefixCount : UInt32

    /**
     * The array of prefixes.
     */
    prefixes : WS_XML_STRING.Ptr

}
