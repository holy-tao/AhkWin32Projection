#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GROUP_AFFINITY.ahk" { GROUP_AFFINITY }

/**
 * Represents information about affinity within a processor group. This structure is used with the GetLogicalProcessorInformationEx function.
 * @remarks
 * The <b>PROCESSOR_RELATIONSHIP</b> structure describes the logical processors associated with either a processor core or a processor package.  
 * 
 * If the <b>PROCESSOR_RELATIONSHIP</b> structure represents a processor core, the <b>GroupCount</b> member is always 1.  
 * 
 * If the <b>PROCESSOR_RELATIONSHIP</b> structure represents a processor package, the  <b>GroupCount</b> member is 1 only if all processors are in the same processor group. If the package contains more than one NUMA node, the system might assign different NUMA nodes to different processor groups. In this case, the <b>GroupCount</b> member is the number of groups to which NUMA nodes in the package are assigned.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_relationship
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct PROCESSOR_RELATIONSHIP {
    #StructPack 8

    /**
     * If the <b>Relationship</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex">SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX</a> structure is <b>RelationProcessorCore</b>, this member is LTP_PC_SMT if the core has more than one logical processor, or 0 if the core has one logical processor. 
     * 
     * If the <b>Relationship</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex">SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX</a> structure is <b>RelationProcessorPackage</b>, this member is always 0.
     */
    Flags : Int8

    /**
     * If the <b>Relationship</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex">SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX</a> structure is <b>RelationProcessorCore</b>, <b>EfficiencyClass</b> specifies the intrinsic tradeoff between performance and power for the applicable core. A core  with a higher value for the efficiency class has intrinsically greater performance and less efficiency than a core with a lower value for the efficiency class. <b>EfficiencyClass</b> is only nonzero on systems with a heterogeneous set of cores.
     * 
     * If the <b>Relationship</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex">SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX</a> structure is <b>RelationProcessorPackage</b>, <b>EfficiencyClass</b> is always 0.
     * 
     * The minimum operating system version that supports this member is Windows 10.
     */
    EfficiencyClass : Int8

    /**
     * This member is reserved.
     */
    Reserved : Int8[20]

    /**
     * This member specifies the number of entries in the <b>GroupMask</b> array. For more information, see Remarks.
     */
    GroupCount : UInt16

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-group_affinity">GROUP_AFFINITY</a> structures. The <b>GroupCount</b> member specifies the number of structures in the array. Each structure in the array specifies a  group number and processor affinity within the group.
     */
    GroupMask : GROUP_AFFINITY[1]

}
