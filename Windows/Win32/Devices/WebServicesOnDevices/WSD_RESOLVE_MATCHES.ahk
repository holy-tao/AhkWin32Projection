#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_RESOLVE_MATCH.ahk" { WSD_RESOLVE_MATCH }

/**
 * Represents a ResolveMatches message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_resolve_matches
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_RESOLVE_MATCHES {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_resolve_match">WSD_RESOLVE_MATCH</a> structure that contains a child ResolveMatch message.
     */
    ResolveMatch : WSD_RESOLVE_MATCH.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
