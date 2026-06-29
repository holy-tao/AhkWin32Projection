#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESSOR_GROUP_INFO.ahk" { PROCESSOR_GROUP_INFO }

/**
 * Represents information about processor groups. This structure is used with the GetLogicalProcessorInformationEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-group_relationship
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct GROUP_RELATIONSHIP {
    #StructPack 8

    /**
     * The maximum number of processor groups on the system.
     */
    MaximumGroupCount : UInt16

    /**
     * The number of active groups on the system. This member indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_group_info">PROCESSOR_GROUP_INFO</a> structures in the <b>GroupInfo</b> array.
     */
    ActiveGroupCount : UInt16

    /**
     * This member is reserved.
     */
    Reserved : Int8[20]

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_group_info">PROCESSOR_GROUP_INFO</a> structures. Each structure represents the number and affinity of processors in an active group on the system.
     */
    GroupInfo : PROCESSOR_GROUP_INFO[1]

}
