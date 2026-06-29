#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDH_RAW_COUNTER.ahk" { PDH_RAW_COUNTER }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * The PDH_RAW_COUNTER_ITEM structure contains the instance name and raw value of a counter. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_counter_item_w
 * @namespace Windows.Win32.System.Performance
 * @charset Unicode
 */
export default struct PDH_RAW_COUNTER_ITEM_W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the instance name of the counter. The string is appended to the end of this structure.
     */
    szName : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a> structure that contains the raw counter value of the instance.
     */
    RawValue : PDH_RAW_COUNTER

}
