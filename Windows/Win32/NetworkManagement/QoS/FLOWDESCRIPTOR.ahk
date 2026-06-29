#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\FLOWSPEC.ahk" { FLOWSPEC }
#Import ".\RSVP_FILTERSPEC.ahk" { RSVP_FILTERSPEC }

/**
 * The FLOWDESCRIPTOR structure specifies one or more filters for a given FLOWSPEC.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-flowdescriptor
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct FLOWDESCRIPTOR {
    #StructPack 8

    /**
     * Flow specification (FLOWSPEC), provided as a <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure.
     */
    FlowSpec : FLOWSPEC

    /**
     * Number of filters provided in <b>FilterList</b>.
     */
    NumFilters : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec">RSVP_FILTERSPEC</a> structure containing FILTERSPEC information.
     */
    FilterList : RSVP_FILTERSPEC.Ptr

}
