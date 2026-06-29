#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GROUP_AFFINITY.ahk" { GROUP_AFFINITY }
#Import ".\CACHE_RELATIONSHIP.ahk" { CACHE_RELATIONSHIP }
#Import ".\GROUP_RELATIONSHIP.ahk" { GROUP_RELATIONSHIP }
#Import ".\PROCESSOR_GROUP_INFO.ahk" { PROCESSOR_GROUP_INFO }
#Import ".\PROCESSOR_CACHE_TYPE.ahk" { PROCESSOR_CACHE_TYPE }
#Import ".\NUMA_NODE_RELATIONSHIP.ahk" { NUMA_NODE_RELATIONSHIP }
#Import ".\PROCESSOR_RELATIONSHIP.ahk" { PROCESSOR_RELATIONSHIP }
#Import ".\LOGICAL_PROCESSOR_RELATIONSHIP.ahk" { LOGICAL_PROCESSOR_RELATIONSHIP }

/**
 * Contains information about the relationships of logical processors and related hardware. The GetLogicalProcessorInformationEx function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX {
    #StructPack 8

    /**
     * The type of relationship between the logical processors. This parameter can be one of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-logical_processor_relationship">LOGICAL_PROCESSOR_RELATIONSHIP</a> enumeration values.
     */
    Relationship : LOGICAL_PROCESSOR_RELATIONSHIP

    /**
     * The size of the structure.
     */
    Size : UInt32

    Processor : PROCESSOR_RELATIONSHIP

    static __New() {
        DefineProp(this.Prototype, 'NumaNode', { type: NUMA_NODE_RELATIONSHIP, offset: 8 })
        DefineProp(this.Prototype, 'Cache', { type: CACHE_RELATIONSHIP, offset: 8 })
        DefineProp(this.Prototype, 'Group', { type: GROUP_RELATIONSHIP, offset: 8 })
        this.DeleteProp("__New")
    }
}
