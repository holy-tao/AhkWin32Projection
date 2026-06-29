#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a performance counter.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> structure contains one or more counters. This structure defines each counter and gives the offset to its value.  These structures follow the <b>PERF_OBJECT_TYPE</b> structure in memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * 
 * Providers should provide their counters in the same order each time their counters are queried. If the counter uses a base counter in its calculation (the counter type includes the <b>PERF_COUNTER_FRACTION</b> flag), the base counter must follow this counter in the list of counters. If the counter type includes the <b>PERF_MULTI_COUNTER</b> flag, the second counter value must follow this counter's value in the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_definition
 * @namespace Windows.Win32.System.Performance
 * @architecture X64, Arm64
 */
export default struct PERF_COUNTER_DEFINITION {
    #StructPack 4

    /**
     * Size of this structure, in bytes.
     */
    ByteLength : UInt32

    /**
     * Index of the counter's name in the title database. For details on using the index to retrieve the counter's name, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * To set this value, providers add the counter's offset value defined in their symbol file to the <b>First Counter</b> registry value. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a> and <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/implementing-openperformancedata">Implementing the OpenPerformanceData function</a>.
     * 
     * This value should be zero if the counter is a base counter (<b>CounterType</b> includes the PERF_COUNTER_BASE flag).
     */
    CounterNameTitleIndex : UInt32

    /**
     * Reserved.
     */
    CounterNameTitle : UInt32

    /**
     * Index to the counter's help text in the title database. For details on using the index to retrieve the counter's help text, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * To set this value, providers add the counter's offset value defined in their symbol file to the <b>First Help</b> registry value. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a> and <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/implementing-openperformancedata">Implementing the OpenPerformanceData function</a>.
     * 
     * This value should be zero if the counter is a base counter (<b>CounterType</b> includes the PERF_COUNTER_BASE flag).
     */
    CounterHelpTitleIndex : UInt32

    /**
     * Reserved.
     */
    CounterHelpTitle : UInt32

    /**
     * Scale factor to use when graphing the counter value. Valid values range from  -7 to 7 (the values correspond to 0.0000001 - 10000000). If this value is zero, the scale value is 1; if this value is 1, the scale value is 10; if this value is –1, the scale value is .10; and so on.
     */
    DefaultScale : Int32

    DetailLevel : UInt32

    /**
     * Type of counter. For a list of predefined counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. Consumers use the counter type to determine how to calculate and display the counter value. Providers should limit their choice of counter types to the predefined list.
     */
    CounterType : UInt32

    /**
     * Counter size, in bytes. 
     * 
     * Currently, only DWORDs (4 bytes) and ULONGLONGs (8 bytes) are used to provide counter values.
     */
    CounterSize : UInt32

    /**
     * Offset from the start of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a> structure to the first byte of this counter. The location of the <b>PERF_COUNTER_BLOCK</b> structure within the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> block depends on if the object contains instances. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
     * 
     * Note that multiple counters can use the same raw data and point to the same offset in the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a> block.
     */
    CounterOffset : UInt32

}
