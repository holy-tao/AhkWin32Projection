#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an instance of a counter set.
 * @remarks
 * The <b>Offset</b> member of  <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> contains the byte offset from the beginning of the <b>PERF_COUNTERSET_INSTANCE</b> block to the counter's raw counter value.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counterset_instance
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTERSET_INSTANCE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * GUID that identifies the counter set to which this instance belongs.
     * @type {Pointer<Guid>}
     */
    CounterSetGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size, in bytes, of the instance block. The instance block contains this structure, followed by one or more <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> blocks, and ends with the instance name.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Identifier that uniquely identifies this instance. 
     * 
     * The provider specified the identifier when calling <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a>.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Byte offset from the beginning of this structure to the null-terminated Unicode instance name.
     * 
     * The provider specified the instance name when calling <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a>.
     * @type {Integer}
     */
    InstanceNameOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size, in bytes, of the instance name. The size includes the null-terminator.
     * @type {Integer}
     */
    InstanceNameSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
