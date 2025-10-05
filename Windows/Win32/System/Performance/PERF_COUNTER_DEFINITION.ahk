#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a performance counter.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> structure contains one or more counters. This structure defines each counter and gives the offset to its value.  These structures follow the <b>PERF_OBJECT_TYPE</b> structure in memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
  * 
  * Providers should provide their counters in the same order each time their counters are queried. If the counter uses a base counter in its calculation (the counter type includes the <b>PERF_COUNTER_FRACTION</b> flag), the base counter must follow this counter in the list of counters. If the counter type includes the <b>PERF_MULTI_COUNTER</b> flag, the second counter value must follow this counter's value in the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_definition
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_DEFINITION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    ByteLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Index of the counter's name in the title database. For details on using the index to retrieve the counter's name, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * To set this value, providers add the counter's offset value defined in their symbol file to the <b>First Counter</b> registry value. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a> and <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/implementing-openperformancedata">Implementing the OpenPerformanceData function</a>.
     * 
     * This value should be zero if the counter is a base counter (<b>CounterType</b> includes the PERF_COUNTER_BASE flag).
     * @type {Integer}
     */
    CounterNameTitleIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    CounterNameTitle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Index to the counter's help text in the title database. For details on using the index to retrieve the counter's help text, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * To set this value, providers add the counter's offset value defined in their symbol file to the <b>First Help</b> registry value. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a> and <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/implementing-openperformancedata">Implementing the OpenPerformanceData function</a>.
     * 
     * This value should be zero if the counter is a base counter (<b>CounterType</b> includes the PERF_COUNTER_BASE flag).
     * @type {Integer}
     */
    CounterHelpTitleIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    CounterHelpTitle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Scale factor to use when graphing the counter value. Valid values range from  -7 to 7 (the values correspond to 0.0000001 - 10000000). If this value is zero, the scale value is 1; if this value is 1, the scale value is 10; if this value is –1, the scale value is .10; and so on.
     * @type {Integer}
     */
    DefaultScale {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    DetailLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type of counter. For a list of predefined counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. Consumers use the counter type to determine how to calculate and display the counter value. Providers should limit their choice of counter types to the predefined list.
     * @type {Integer}
     */
    CounterType {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Counter size, in bytes. 
     * 
     * Currently, only DWORDs (4 bytes) and ULONGLONGs (8 bytes) are used to provide counter values.
     * @type {Integer}
     */
    CounterSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Offset from the start of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a> structure to the first byte of this counter. The location of the <b>PERF_COUNTER_BLOCK</b> structure within the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> block depends on if the object contains instances. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
     * 
     * Note that multiple counters can use the same raw data and point to the same offset in the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a> block.
     * @type {Integer}
     */
    CounterOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
