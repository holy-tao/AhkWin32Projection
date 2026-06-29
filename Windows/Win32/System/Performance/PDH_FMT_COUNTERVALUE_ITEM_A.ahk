#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PDH_FMT_COUNTERVALUE.ahk" { PDH_FMT_COUNTERVALUE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PDH_FMT_COUNTERVALUE_ITEM structure contains the instance name and formatted value of a counter. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue_item_a
 * @namespace Windows.Win32.System.Performance
 * @charset ANSI
 */
export default struct PDH_FMT_COUNTERVALUE_ITEM_A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the instance name of the counter. The string is appended to the end of this structure.
     */
    szName : PSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue">PDH_FMT_COUNTERVALUE</a> structure that contains the counter value of the instance.
     */
    FmtValue : PDH_FMT_COUNTERVALUE

}
