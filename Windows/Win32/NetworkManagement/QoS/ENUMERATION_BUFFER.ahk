#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TC_GEN_FILTER.ahk" { TC_GEN_FILTER }
#Import ".\TC_GEN_FLOW.ahk" { TC_GEN_FLOW }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The ENUMERATION_BUFFER structure contains information specific to a given flow, including flow name, the number of filters associated with the flow, and an array of filters associated with the flow.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-enumeration_buffer
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct ENUMERATION_BUFFER {
    #StructPack 8

    /**
     * Number of bytes from the beginning of the 
     * <b>ENUMERATION_BUFFER</b> to the next 
     * <b>ENUMERATION_BUFFER</b>.
     */
    Length : UInt32

    /**
     * Identifies the owner of the process.
     */
    OwnerProcessId : UInt32

    /**
     * Specifies the length of the <b>FlowName</b> member.
     */
    FlowNameLength : UInt16

    /**
     * Array of WCHAR characters, of length <b>MAX_STRING_LENGTH</b>, that specifies the flow name.
     */
    FlowName : WCHAR[256]

    /**
     * Pointer to the corresponding 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> structure. This structure is placed immediately after the array of TC_GEN_FILTERS and is included in <b>Length</b>.
     */
    pFlow : TC_GEN_FLOW.Ptr

    /**
     * Specifies the number of filters associated with the flow.
     */
    NumberOfFilters : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_filter">TC_GEN_FILTER</a> structures. The number of elements in the array corresponds to the number of filters attached to the specified flow. Note that in order to enumerate through the array of 
     * <b>TC_GEN_FILTER</b> structures, you need to increment the pointer to the current 
     * <b>TC_GEN_FILTER</b> by using the following: 
     * 
     * 
     * 
     * 
     * sizeof(TC_GEN_FILTER) + 2 * [the pattern size of the current 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_filter">TC_GEN_FILTER</a> structure].
     */
    GenericFilter : TC_GEN_FILTER[1]

}
