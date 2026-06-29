#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSAPI_WORKING_SET_EX_BLOCK.ahk" { PSAPI_WORKING_SET_EX_BLOCK }

/**
 * Contains extended working set information for a process.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_working_set_ex_information
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PSAPI_WORKING_SET_EX_INFORMATION {
    #StructPack 8

    /**
     * The virtual address.
     */
    VirtualAddress : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_ex_block">PSAPI_WORKING_SET_EX_BLOCK</a> union that indicates the attributes of the page at <b>VirtualAddress</b>.
     */
    VirtualAttributes : PSAPI_WORKING_SET_EX_BLOCK

}
