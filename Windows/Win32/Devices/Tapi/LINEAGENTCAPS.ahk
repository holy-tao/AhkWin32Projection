#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The LINEAGENTCAPS structure describes the capabilities of an ACD agent. The lineGetAgentCaps function returns the LINEAGENTCAPS structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentcaps
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTCAPS {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed to hold all the information requested, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Size of the agent handler information, in bytes.
     */
    dwAgentHandlerInfoSize : UInt32

    /**
     * Offset from the beginning of the structure to a null-terminated string specifying the name, version, or other identifying information of the server application that is handling agent requests. The size of the string is specified by <b>dwAgentHandlerInfoSize</b>.
     */
    dwAgentHandlerInfoOffset : UInt32

    /**
     * TAPI version that the agent handler application used in preparing the contents of this structure. This is no greater than the API version that the calling application passed in to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentcapsa">lineGetAgentCaps</a>.
     */
    dwCapsVersion : UInt32

    /**
     * Agent-related features available for this line using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentfeature--constants">LINEAGENTFEATURE_ constants</a>. Invoking a supported feature requires the line and address to be in the proper state. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the line is in the appropriate state for the operation to be meaningful. This field allows an application to discover which agent features can be (and which can never be) supported by the device.
     */
    dwFeatures : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a> that can be used in the <i>dwAgentState</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a>. Setting a supported state requires the line and address to be in the proper state. A zero in a bit position indicates that the corresponding state is never available. A one indicates that the corresponding state may be available if the line is in the appropriate state for the state to be meaningful. This field allows an application to discover which agent states can be (and which can never be) supported on the device.
     */
    dwStates : UInt32

    /**
     * LINEAGENTSTATE_ constants that can be used in the <i>dwNextAgentState</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a>. Setting a supported state requires the line and address to be in the proper state. A zero in a bit position indicates that the corresponding state is never available. A one indicates that the corresponding state may be available if the line is in the appropriate state for the state to be meaningful. This field allows an application to discover which agent states can be (and which can never be) supported on the device.
     */
    dwNextStates : UInt32

    /**
     * Maximum number of agent identifiers that can be logged in on the address simultaneously. Determines the highest value that can be passed in as the <b>dwNumEntries</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a> structure to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentgroup">lineSetAgentGroup</a>.
     */
    dwMaxNumGroupEntries : UInt32

    /**
     * Indicates the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstatus--constants">LINEAGENTSTATUS_ constants</a> that can be received by the application in <i>dwParam2</i> of a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-agentstatus">LINE_AGENTSTATUS</a> message.
     */
    dwAgentStatusMessages : UInt32

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a> structures that appear in the <i>ExtensionIDList</i> array. The value is 0 if agent-handler-specific extensions are supported on the address.
     */
    dwNumAgentExtensionIDs : UInt32

    /**
     * Size of the agent extension IDs array, in bytes.
     */
    dwAgentExtensionIDListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a> structures. The size is <b>dwNumExtensionIDs</b> times SIZEOF(LINEEXTENSIONID). The array lists the 128-bit universally unique identifiers for all agent-handler-specific extensions supported by the agent handle for the address. The extension being used is referenced in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineagentspecific">lineAgentSpecific</a> function and 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-agentspecific">LINE_AGENTSPECIFIC</a> message by its position in this table, the first entry being entry 0, so it is important that the agent handler always present extension identifiers in this array in the same order. The size of the array is specified by <b>dwAgentExtensionIDListOffset</b>.
     */
    dwAgentExtensionIDListOffset : UInt32

    /**
     * GUID for ACD proxy associated with the line. This element is exposed only to applications that negotiate a TAPI version of 2.2 or higher.
     */
    ProxyGUID : Guid

}
