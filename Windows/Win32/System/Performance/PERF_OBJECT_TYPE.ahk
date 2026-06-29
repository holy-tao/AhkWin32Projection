#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes object-specific performance information, for example, the number of instances of the object and the number of counters that the object defines.
 * @remarks
 * Providers use this structure to provide performance data for objects that they support. Consumers use this structure to consume performance data for objects that they queried.
 * 
 *  This structure is followed by a list of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> structures, one for each counter defined for the performance object.
 * 		For details on the layout of the performance data block, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_object_type
 * @namespace Windows.Win32.System.Performance
 * @architecture X64, Arm64
 */
export default struct PERF_OBJECT_TYPE {
    #StructPack 8

    /**
     * Size of the object-specific data, in bytes. This member is the offset from the beginning of this structure to the next 
     * <b>PERF_OBJECT_TYPE</b> structure, if one exists.
     */
    TotalByteLength : UInt32

    /**
     * Size of this structure plus the size of all the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> structures.
     * 
     * If the object is a multiple instance object (the <b>NumInstances</b> member is not zero), this member is the offset from the beginning of this structure to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_instance_definition">PERF_INSTANCE_DEFINITION</a> structure. Otherwise, this value is the offset to the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a>.
     */
    DefinitionLength : UInt32

    /**
     * Size of this structure, in bytes. This member is the offset from the beginning of this structure to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> structure.
     */
    HeaderLength : UInt32

    /**
     * Index to the object's name in the title database. For details on using the index to retrieve the object's name, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * Providers specify the index value in their initialization file. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a>.
     */
    ObjectNameTitleIndex : UInt32

    /**
     * Reserved.
     */
    ObjectNameTitle : UInt32

    /**
     * Index to the object's help text in the title database.  For details on using the index to retrieve the object's help text, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * Providers specify the index value in their initialization file. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a>.
     */
    ObjectHelpTitleIndex : UInt32

    /**
     * Reserved.
     */
    ObjectHelpTitle : UInt32

    DetailLevel : UInt32

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> blocks returned by the object.
     */
    NumCounters : UInt32

    /**
     * Index to the counter's name in the title database of the default counter whose information is to be displayed when this object is selected in the Performance tool. This member may be –1 to indicate that there is no default.
     */
    DefaultCounter : Int32

    /**
     * Number of object instances for which counters are being provided. If the object can have zero or more instances, but has none at present, this value should be zero. If the object cannot have multiple instances, this value should be PERF_NO_INSTANCES.
     */
    NumInstances : Int32

    /**
     * This member is zero if the instance strings are Unicode strings. Otherwise, this member is the code-page identifier of the instance names. You can use the code-page value when calling <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> to convert the string to Unicode.
     */
    CodePage : UInt32

    /**
     * Provider generated timestamp that consumers use when calculating counter values. For example, this could be the current value, in counts, of the high-resolution performance counter.
     * 
     * Providers need to provide this value if the counter types of their counters include the <b>PERF_OBJECT_TIMER</b> flag. Otherwise, consumers use the <b>PerfTime</b> value from <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_data_block">PERF_DATA_BLOCK</a>.
     */
    PerfTime : Int64

    /**
     * Provider generated frequency value that consumers use when calculating counter values. For example, this could be the current frequency, in counts per second, of the high-resolution performance counter.
     * 
     * Providers need to provide this value if the counter types of their counters include the <b>PERF_OBJECT_TIMER</b> flag. Otherwise, consumers use the <b>PerfFreq</b> value from <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_data_block">PERF_DATA_BLOCK</a>.
     */
    PerfFreq : Int64

}
