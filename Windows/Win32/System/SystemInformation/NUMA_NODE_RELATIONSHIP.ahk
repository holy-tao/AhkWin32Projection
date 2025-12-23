#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GROUP_AFFINITY.ahk

/**
 * Represents information about a NUMA node in a processor group. This structure is used with the GetLogicalProcessorInformationEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-numa_node_relationship
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class NUMA_NODE_RELATIONSHIP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The number of the NUMA node.
     * @type {Integer}
     */
    NodeNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 4, 18, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The number of groups included in the *GroupMasks* array. This field was introduced in TBD Release Iron. On earlier versions, this value is always 0.
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {GROUP_AFFINITY}
     */
    GroupMask{
        get {
            if(!this.HasProp("__GroupMask"))
                this.__GroupMask := GROUP_AFFINITY(24, this)
            return this.__GroupMask
        }
    }

    /**
     * @type {Array<GROUP_AFFINITY>}
     */
    GroupMasks{
        get {
            if(!this.HasProp("__GroupMasksProxyArray"))
                this.__GroupMasksProxyArray := Win32FixedArray(this.ptr + 24, 1, GROUP_AFFINITY, "")
            return this.__GroupMasksProxyArray
        }
    }
}
