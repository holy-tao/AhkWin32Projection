#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The PDH_COUNTER_PATH_ELEMENTS structure contains the components of a counter path. (Unicode)
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhmakecounterpatha">PdhMakeCounterPath</a> to create a counter path and by <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhparsecounterpatha">PdhParseCounterPath</a> to parse a counter path.
 * 
 * When you allocate memory for this structure, allocate enough memory for the member strings, such as <b>szCounterName</b>, that are appended to the end of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_path_elements_w
 * @namespace Windows.Win32.System.Performance
 * @charset Unicode
 */
export default struct PDH_COUNTER_PATH_ELEMENTS_W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the computer name.
     */
    szMachineName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the object name.
     */
    szObjectName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the instance name. Can contain a wildcard character.
     */
    szInstanceName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the parent instance name. Can contain a wildcard character.
     */
    szParentInstance : PWSTR

    /**
     * Index used to uniquely identify duplicate instance names.
     */
    dwInstanceIndex : UInt32

    /**
     * Pointer to a null-terminated string that specifies the counter name.
     */
    szCounterName : PWSTR

}
