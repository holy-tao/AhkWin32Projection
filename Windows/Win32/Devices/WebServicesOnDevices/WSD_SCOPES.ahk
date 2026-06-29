#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_URI_LIST.ahk" { WSD_URI_LIST }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A collection of scopes used in WS-Discovery messaging.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_scopes
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SCOPES {
    #StructPack 8

    /**
     * A matching rule used for scopes.
     */
    MatchBy : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that contains a list of scopes.
     */
    Scopes : WSD_URI_LIST.Ptr

}
