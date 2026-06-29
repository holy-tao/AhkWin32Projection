#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the CFSTR_SHELLIDLIST clipboard format to transfer the pointer to an item identifier list (PIDL) of one or more Shell namespace objects.
 * @remarks
 * To use this structure to retrieve a particular PIDL, add the <b>aoffset</b> value of the PIDL to the address of the structure. The following two macros can be used to retrieve PIDLs from the structure. The first retrieves the PIDL of the parent folder. The second retrieves a PIDL, specified by its zero-based index.
 * 				
 *                 
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-cida
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CIDA {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The number of PIDLs that are being transferred, not including the parent folder.
     */
    cidl : UInt32

    /**
     * Type: <b>UINT[1]</b>
     * 
     * An array of offsets, relative to the beginning of this structure. The array contains <b>cidl</b>+1 elements. The first element of <b>aoffset</b> contains an offset to the fully qualified PIDL of a parent folder. If this PIDL is empty, the parent folder is the desktop. Each of the remaining elements of the array contains an offset to one of the PIDLs to be transferred. All of these PIDLs are relative to the PIDL of the parent folder.
     */
    aoffset : UInt32[1]

}
