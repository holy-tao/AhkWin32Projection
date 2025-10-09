#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GROUP_AFFINITY.ahk
#Include .\PROCESSOR_RELATIONSHIP.ahk
#Include .\NUMA_NODE_RELATIONSHIP.ahk
#Include .\CACHE_RELATIONSHIP.ahk
#Include .\PROCESSOR_GROUP_INFO.ahk
#Include .\GROUP_RELATIONSHIP.ahk

/**
 * Contains information about the relationships of logical processors and related hardware. The GetLogicalProcessorInformationEx function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The type of relationship between the logical processors. This parameter can be one of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-logical_processor_relationship">LOGICAL_PROCESSOR_RELATIONSHIP</a> enumeration values.
     * @type {Integer}
     */
    Relationship {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PROCESSOR_RELATIONSHIP}
     */
    Processor{
        get {
            if(!this.HasProp("__Processor"))
                this.__Processor := PROCESSOR_RELATIONSHIP(this.ptr + 8)
            return this.__Processor
        }
    }

    /**
     * @type {NUMA_NODE_RELATIONSHIP}
     */
    NumaNode{
        get {
            if(!this.HasProp("__NumaNode"))
                this.__NumaNode := NUMA_NODE_RELATIONSHIP(this.ptr + 8)
            return this.__NumaNode
        }
    }

    /**
     * @type {CACHE_RELATIONSHIP}
     */
    Cache{
        get {
            if(!this.HasProp("__Cache"))
                this.__Cache := CACHE_RELATIONSHIP(this.ptr + 8)
            return this.__Cache
        }
    }

    /**
     * @type {GROUP_RELATIONSHIP}
     */
    Group{
        get {
            if(!this.HasProp("__Group"))
                this.__Group := GROUP_RELATIONSHIP(this.ptr + 8)
            return this.__Group
        }
    }
}
