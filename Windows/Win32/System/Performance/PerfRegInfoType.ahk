#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the types of information that you can request about a performance counter set by calling the PerfQueryCounterSetRegistrationInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ne-perflib-perfreginfotype
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PerfRegInfoType extends Win32Enum{

    /**
     * Gets the registration information for a counter set and all of the counters it contains as a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_reg_info">PERF_COUNTERSET_REG_INFO</a> block.  The block includes a <b>PERF_COUNTERSET_REG_INFO</b> structure followed by one or  
     * 
     *         more <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_reg_info">PERF_COUNTER_REG_INFO</a> structures.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTERSET_STRUCT => 1

    /**
     * Gets the registration information for a performance counter as  a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_reg_info">PERF_COUNTER_REG_INFO</a> structure.  
     * 
     *         Use the <i>requestLangId</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function to specify the counter identifier.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTER_STRUCT => 2

    /**
     * Gets a null-terminated UTF16-LE string that indicates the name of the counter set.  
     * 
     *         Use the <i>requestLangId</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function  to specify the preferred locale of the result.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTERSET_NAME_STRING => 3

    /**
     * Gets a null-terminated UTF16-LE string that contains the help string for the counter set.  
     * 
     *         Use the <i>requestLangId</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function to specify the preferred locale of the result.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTERSET_HELP_STRING => 4

    /**
     * Gets the names of the performance counters in the counter set as a <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_buffer_header">PERF_STRING_BUFFER_HEADER</a> block.  
     * 
     *         The block includes a <b>PERF_STRING_BUFFER_HEADER</b> structure, followed by one  
     * 
     *         or more <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header">PERF_STRING_COUNTER_HEADER</a> structures, followed by string data that indicates the counter names.  
     * 
     *         Use the <i>requestLangId</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function to specify the preferred locale of the result.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTER_NAME_STRINGS => 5

    /**
     * Gets the help  strings for the performance counters in the counter set as a <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_buffer_header">PERF_STRING_BUFFER_HEADER</a> block.  
     * 
     *         The block includes a <b>PERF_STRING_BUFFER_HEADER</b> structure, followed by one  
     * 
     *         or more <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header">PERF_STRING_COUNTER_HEADER</a> structures, followed by string data that contains the help strings.  
     * 
     *         Use the <i>requestLangId</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function to specify the preferred locale of the result.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTER_HELP_STRINGS => 6

    /**
     * Gets a null-terminated UTF-16LE string that indicates the name of the provider for the counter set.
     * @type {Integer (Int32)}
     */
    static PERF_REG_PROVIDER_NAME => 7

    /**
     * Gets the GUID of the provider for the counter set.
     * @type {Integer (Int32)}
     */
    static PERF_REG_PROVIDER_GUID => 8

    /**
     * Gets a null-terminated UTF-16LE string that contains the name of the counter set in English. This value is equivalent to setting the <i>requestCode</i> parameter to <b>PERF_REG_COUNTERSET_NAME_STRING</b> and the  <i>requestLangId</i> parameter to 0 when you call the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTERSET_ENGLISH_NAME => 9

    /**
     * Gets the English  names of the performance counters in the counter set as a <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_buffer_header">PERF_STRING_BUFFER_HEADER</a> block.  
     * 
     *         The block includes a <b>PERF_STRING_BUFFER_HEADER</b> structure, followed by one  
     * 
     *         or more <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header">PERF_STRING_COUNTER_HEADER</a> structures, followed by string data that indicates the counter names. This value is equivalent to setting the <i>requestCode</i> parameter to  <b>PERF_REG_COUNTER_NAME_STRINGS</b>  and the  <i>requestLangId</i> parameter to 0 when you call the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function.
     * @type {Integer (Int32)}
     */
    static PERF_REG_COUNTER_ENGLISH_NAMES => 10
}
