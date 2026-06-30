#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains partition information pulled from an ETW trace.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_trace_partition_information
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_TRACE_PARTITION_INFORMATION extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * GUID to identify the machine.
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(0, this)
            return this.__PartitionId
        }
    }

    /**
     * GUID that identifies the partition instance that contains the traced partition.
     * If the traced partition is a host, then **ParentId** will be 0.
     * @type {Guid}
     */
    ParentId {
        get {
            if(!this.HasProp("__ParentId"))
                this.__ParentId := Guid(16, this)
            return this.__ParentId
        }
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    QpcOffsetFromRoot {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

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
     * @type {Integer}
     */
    PartitionType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
