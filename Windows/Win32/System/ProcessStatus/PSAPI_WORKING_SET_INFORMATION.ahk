#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSAPI_WORKING_SET_BLOCK.ahk" { PSAPI_WORKING_SET_BLOCK }

/**
 * Contains working set information for a process.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_working_set_information
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PSAPI_WORKING_SET_INFORMATION {
    #StructPack 8

    /**
     * The number of entries in the <b>WorkingSetInfo</b> array.
     */
    NumberOfEntries : IntPtr

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_block">PSAPI_WORKING_SET_BLOCK</a> elements, one for each page in the process working set.
     */
    WorkingSetInfo : PSAPI_WORKING_SET_BLOCK[1]

}
