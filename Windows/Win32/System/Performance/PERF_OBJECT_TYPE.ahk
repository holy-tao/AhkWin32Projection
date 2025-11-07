#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes object-specific performance information, for example, the number of instances of the object and the number of counters that the object defines.
 * @remarks
 * 
 * Providers use this structure to provide performance data for objects that they support. Consumers use this structure to consume performance data for objects that they queried.
 * 
 *  This structure is followed by a list of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> structures, one for each counter defined for the performance object.
 * 		For details on the layout of the performance data block, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winperf/ns-winperf-perf_object_type
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_OBJECT_TYPE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Size of the object-specific data, in bytes. This member is the offset from the beginning of this structure to the next 
     * <b>PERF_OBJECT_TYPE</b> structure, if one exists.
     * @type {Integer}
     */
    TotalByteLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of this structure plus the size of all the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> structures.
     * 
     * If the object is a multiple instance object (the <b>NumInstances</b> member is not zero), this member is the offset from the beginning of this structure to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_instance_definition">PERF_INSTANCE_DEFINITION</a> structure. Otherwise, this value is the offset to the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_block">PERF_COUNTER_BLOCK</a>.
     * @type {Integer}
     */
    DefinitionLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of this structure, in bytes. This member is the offset from the beginning of this structure to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> structure.
     * @type {Integer}
     */
    HeaderLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Index to the object's name in the title database. For details on using the index to retrieve the object's name, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * Providers specify the index value in their initialization file. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a>.
     * @type {Integer}
     */
    ObjectNameTitleIndex {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ObjectNameTitle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Index to the object's help text in the title database.  For details on using the index to retrieve the object's help text, see <a href="https://docs.microsoft.com/windows/win32/perfctrs/retrieving-counter-names-and-help-text">Retrieving Counter Names and Help Text</a>.
     * 
     * Providers specify the index value in their initialization file. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/adding-counter-names-and-descriptions-to-the-registry">Adding Counter Names and Descriptions to the Registry</a>.
     * @type {Integer}
     */
    ObjectHelpTitleIndex {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ObjectHelpTitle {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    DetailLevel {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> blocks returned by the object.
     * @type {Integer}
     */
    NumCounters {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Index to the counter's name in the title database of the default counter whose information is to be displayed when this object is selected in the Performance tool. This member may be –1 to indicate that there is no default.
     * @type {Integer}
     */
    DefaultCounter {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Number of object instances for which counters are being provided. If the object can have zero or more instances, but has none at present, this value should be zero. If the object cannot have multiple instances, this value should be PERF_NO_INSTANCES.
     * @type {Integer}
     */
    NumInstances {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * This member is zero if the instance strings are Unicode strings. Otherwise, this member is the code-page identifier of the instance names. You can use the code-page value when calling <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> to convert the string to Unicode.
     * @type {Integer}
     */
    CodePage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Provider generated timestamp that consumers use when calculating counter values. For example, this could be the current value, in counts, of the high-resolution performance counter.
     * 
     * Providers need to provide this value if the counter types of their counters include the <b>PERF_OBJECT_TIMER</b> flag. Otherwise, consumers use the <b>PerfTime</b> value from <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_data_block">PERF_DATA_BLOCK</a>.
     * @type {Integer}
     */
    PerfTime {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * Provider generated frequency value that consumers use when calculating counter values. For example, this could be the current frequency, in counts per second, of the high-resolution performance counter.
     * 
     * Providers need to provide this value if the counter types of their counters include the <b>PERF_OBJECT_TIMER</b> flag. Otherwise, consumers use the <b>PerfFreq</b> value from <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_data_block">PERF_DATA_BLOCK</a>.
     * @type {Integer}
     */
    PerfFreq {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }
}
