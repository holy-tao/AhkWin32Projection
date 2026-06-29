#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates where in the PERF_STRING_BUFFER_HEADER block that the string that contains the name or help string for the indicated performance counter starts.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i> parameter set to
 * <b>PERF_REG_COUNTER_NAME_STRINGS</b> or <b>PERF_REG_COUNTER_HELP_STRINGS</b> gets a
 * <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_buffer_header">PERF_STRING_BUFFER_HEADER</a> block that contains one or more
 * <b>PERF_STRING_COUNTER_HEADER</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_STRING_COUNTER_HEADER {
    #StructPack 4

    /**
     * The identifier of the  performance counter.
     */
    dwCounterId : UInt32

    /**
     * The number of bytes from the start of the
     * <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_buffer_header">PERF_STRING_BUFFER_HEADER</a> block to the null-terminated UTF-16LE data. A value of 0xFFFFFFFF indicates that the string is not present; in other words, that the value of the string is NULL.
     */
    dwOffset : UInt32

}
