#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines an instance of a counter set.
 * @remarks
 * The <b>Offset</b> member of  <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> contains the byte offset from the beginning of the <b>PERF_COUNTERSET_INSTANCE</b> block to the counter's raw counter value.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counterset_instance
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTERSET_INSTANCE {
    #StructPack 4

    /**
     * GUID that identifies the counter set to which this instance belongs.
     */
    CounterSetGuid : Guid

    /**
     * Size, in bytes, of the instance block. The instance block contains this structure, followed by one or more <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> blocks, and ends with the instance name.
     */
    dwSize : UInt32

    /**
     * Identifier that uniquely identifies this instance. 
     * 
     * The provider specified the identifier when calling <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a>.
     */
    InstanceId : UInt32

    /**
     * Byte offset from the beginning of this structure to the null-terminated Unicode instance name.
     * 
     * The provider specified the instance name when calling <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a>.
     */
    InstanceNameOffset : UInt32

    /**
     * Size, in bytes, of the instance name. The size includes the null-terminator.
     */
    InstanceNameSize : UInt32

}
