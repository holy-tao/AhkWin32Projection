#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the counter that is sent to a provider's callback when the consumer adds or removes a counter from the query.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_identity
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_IDENTITY {
    #StructPack 4

    /**
     * GUID that uniquely identifies the counter set that this counter belongs to.
     */
    CounterSetGuid : Guid

    /**
     * Size, in bytes, of this structure and the computer name and instance name that are appended to this structure in memory.
     */
    BufferSize : UInt32

    /**
     * Unique identifier of the counter in the counter set. 
     * 
     * This member is set to <b>PERF_WILDCARD_COUNTER</b> if the consumer wants to add or remove all counters in the counter set.
     */
    CounterId : UInt32

    /**
     * Identifier of the counter set instance to which the counter belongs. 
     * 
     * Ignore this value if the instance name at <b>NameOffset</b> is PERF_WILDCARD_INSTANCE.
     */
    InstanceId : UInt32

    /**
     * Offset to the null-terminated Unicode computer name that follows this structure in memory.
     */
    MachineOffset : UInt32

    /**
     * Offset to the null-terminated Unicode instance name that follows this structure in memory.
     */
    NameOffset : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

}
