#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_FilterFT.ahk" { MI_FilterFT }

/**
 * Contains a reference to the function table MI_FilterFT.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_filter
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Filter {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_filterft">MI_FilterFT</a> function table.
     */
    ft : MI_FilterFT.Ptr

    /**
     * Reserved for internal use.
     */
    reserved : IntPtr[3]

}
