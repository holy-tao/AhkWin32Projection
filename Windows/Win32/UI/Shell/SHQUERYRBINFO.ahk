#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the size and item count information retrieved by the SHQueryRecycleBin function.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shqueryrbinfo
 * @namespace Windows.Win32.UI.Shell
 * @architecture X64, Arm64
 */
export default struct SHQUERYRBINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. This member must be filled in prior to calling the function.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>__int64</b>
     * 
     * The total size of all the objects in the specified Recycle Bin, in bytes.
     */
    i64Size : Int64

    /**
     * Type: <b>__int64</b>
     * 
     * The total number of items in the specified Recycle Bin.
     */
    i64NumItems : Int64

}
