#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTSTATUS structure describes the current status of an ACD agent. The lineGetAgentStatus function returns the LINEAGENTSTATUS structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentstatus
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTSTATUS {
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
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures that appear in the <i>GroupList</i> array. The value is 0 if no agent is logged in on the address.
     */
    dwNumEntries : UInt32

    /**
     * Size of the group list array, in bytes.
     */
    dwGroupListSize : UInt32

    /**
     * Offset from the beginning of this structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures. The size is <b>dwNumEntries</b> times SIZEOF(LINEAGENTGROUPENTRY). The array contains groups into which the agent is currently logged in on the address. The size of the field is specified by <b>dwGroupListSize</b>.
     */
    dwGroupListOffset : UInt32

    /**
     * Current state of the agent. One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     */
    dwState : UInt32

    /**
     * State into which the agent is automatically placed when the current call completes. One of the <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     */
    dwNextState : UInt32

    /**
     * Identifier of the current agent activity.
     */
    dwActivityID : UInt32

    /**
     * Size of the agent activity string, in bytes.
     */
    dwActivitySize : UInt32

    /**
     * Offset from the beginning of the structure to a null-terminated string specifying the current agent activity. The size of the string is specified by <b>dwActivitySize</b>.
     */
    dwActivityOffset : UInt32

    /**
     * Agent-related features available at the time the status was obtained, using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentfeature--constants">LINEAGENTFEATURE_ constants</a>.
     */
    dwAgentFeatures : UInt32

    /**
     * Agent states that could be selected, at this point in time, using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a>. Consists of one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     */
    dwValidStates : UInt32

    /**
     * Next agent states that could be selected, at this point in time, by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a> function. Consists of one or more of the <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a>.
     */
    dwValidNextStates : UInt32

}
