#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PROCESSOR_GROUP_INFO.ahk

/**
 * Represents information about processor groups. This structure is used with the GetLogicalProcessorInformationEx function.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-group_relationship
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class GROUP_RELATIONSHIP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The maximum number of processor groups on the system.
     * @type {Integer}
     */
    MaximumGroupCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The number of active groups on the system. This member indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_group_info">PROCESSOR_GROUP_INFO</a> structures in the <b>GroupInfo</b> array.
     * @type {Integer}
     */
    ActiveGroupCount {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * This member is reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_group_info">PROCESSOR_GROUP_INFO</a> structures. Each structure represents the number and affinity of processors in an active group on the system.
     * @type {Array<PROCESSOR_GROUP_INFO>}
     */
    GroupInfo{
        get {
            if(!this.HasProp("__GroupInfoProxyArray"))
                this.__GroupInfoProxyArray := Win32FixedArray(this.ptr + 24, 1, PROCESSOR_GROUP_INFO, "")
            return this.__GroupInfoProxyArray
        }
    }
}
