#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the counter that is sent to a provider's callback when the consumer adds or removes a counter from the query.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_identity
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_IDENTITY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * GUID that uniquely identifies the counter set that this counter belongs to.
     * @type {Pointer<Guid>}
     */
    CounterSetGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size, in bytes, of this structure and the computer name and instance name that are appended to this structure in memory.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Unique identifier of the counter in the counter set. 
     * 
     * This member is set to <b>PERF_WILDCARD_COUNTER</b> if the consumer wants to add or remove all counters in the counter set.
     * @type {Integer}
     */
    CounterId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Identifier of the counter set instance to which the counter belongs. 
     * 
     * Ignore this value if the instance name at <b>NameOffset</b> is PERF_WILDCARD_INSTANCE.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset to the null-terminated Unicode computer name that follows this structure in memory.
     * @type {Integer}
     */
    MachineOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset to the null-terminated Unicode instance name that follows this structure in memory.
     * @type {Integer}
     */
    NameOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
