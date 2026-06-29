#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the clipboard format definition for CFSTR_FILE_ATTRIBUTES_ARRAY.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-file_attributes_array
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FILE_ATTRIBUTES_ARRAY {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The number of items in the <b>rgdwFileAttributes</b> array.
     */
    cItems : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * All of the attributes combined using OR.
     */
    dwSumFileAttributes : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * All of the attributes combined using AND.
     */
    dwProductFileAttributes : UInt32

    /**
     * Type: <b>DWORD[1]</b>
     * 
     * An array of file attributes.
     */
    rgdwFileAttributes : UInt32[1]

}
