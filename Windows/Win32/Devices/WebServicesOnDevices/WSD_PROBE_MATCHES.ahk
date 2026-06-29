#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_PROBE_MATCH_LIST.ahk" { WSD_PROBE_MATCH_LIST }

/**
 * Represents a ProbeMatches message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_probe_matches
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_PROBE_MATCHES {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_probe_match_list">WSD_PROBE_MATCH_LIST</a> structure that contains the list of matches to the <a href="https://docs.microsoft.com/windows/desktop/WsdApi/probe-message">Probe</a> message.
     */
    ProbeMatch : WSD_PROBE_MATCH_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
