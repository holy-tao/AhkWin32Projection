#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FILE_SEGMENT_ELEMENT structure represents a segment buffer structure for scatter/gather read/write actions.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_segment_element
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_SEGMENT_ELEMENT {
    #StructPack 8

    /**
     * Contains the data for the scatter/gather read/write action
     * 
     * Assigning a pointer to the **Buffer** member will sign-extend the value if the code is compiled as 32-bits; this can break large-address aware applications running on systems configured with <a href="https://docs.microsoft.com/windows/desktop/Memory/4-gigabyte-tuning">4-Gigabyte Tuning</a> or running under WOW64 on 64-bit Windows. Therefore, use the **PtrToPtr64** macro when assigning pointers to **Buffer**.
     */
    Buffer : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'Alignment', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
