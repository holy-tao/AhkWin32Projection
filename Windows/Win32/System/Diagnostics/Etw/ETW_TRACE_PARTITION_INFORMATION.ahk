#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains partition information pulled from an ETW trace.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_trace_partition_information
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_TRACE_PARTITION_INFORMATION {
    #StructPack 8

    /**
     * GUID to identify the machine.
     */
    PartitionId : Guid

    /**
     * GUID that identifies the partition instance that contains the traced partition.
     * If the traced partition is a host, then **ParentId** will be 0.
     */
    ParentId : Guid

    /**
     * Reserved for future use.
     */
    QpcOffsetFromRoot : Int64

    /**
     * Enumeration value of the container type. the value may be one of the following:
     * 
     * - **Process** (1): For events originating from inside a "Windows Server
     *   Container".
     * 
     * - **VmHost** (2): For events originating from inside a "Hyper-V Container".
     * 
     * - **VmHostedUvm** (3): For events originating from a "Hyper-V Container"
     *   template virtual machine.
     * 
     * - **VmDirectUvm** (4): For events originating from applications running with
     *   [Windows Defender Application Guard](/windows/desktop/winmsg/windows).
     */
    PartitionType : UInt32

}
