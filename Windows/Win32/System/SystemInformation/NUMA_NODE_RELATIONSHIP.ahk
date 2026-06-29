#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GROUP_AFFINITY.ahk" { GROUP_AFFINITY }

/**
 * Represents information about a NUMA node in a processor group. This structure is used with the GetLogicalProcessorInformationEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-numa_node_relationship
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct NUMA_NODE_RELATIONSHIP {
    #StructPack 8

    /**
     * The number of the NUMA node.
     */
    NodeNumber : UInt32

    /**
     * This member is reserved.
     */
    Reserved : Int8[18]

    /**
     * The number of groups included in the *GroupMasks* array. This field was introduced in TBD Release Iron. On earlier versions, this value is always 0.
     */
    GroupCount : UInt16

    GroupMask : GROUP_AFFINITY

    static __New() {
        DefineProp(this.Prototype, 'GroupMasks', { type: GROUP_AFFINITY[1], offset: 24 })
        this.DeleteProp("__New")
    }
}
