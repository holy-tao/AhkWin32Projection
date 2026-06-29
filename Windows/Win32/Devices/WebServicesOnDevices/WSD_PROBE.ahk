#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_SCOPES.ahk" { WSD_SCOPES }
#Import ".\WSD_NAME_LIST.ahk" { WSD_NAME_LIST }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }

/**
 * Represents a Probe message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_probe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_PROBE {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that contains a list of WS-Discovery Types.
     */
    Types : WSD_NAME_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_scopes">WSD_SCOPES</a> structure that contains a list of WS-Discovery Scopes.
     */
    Scopes : WSD_SCOPES.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
