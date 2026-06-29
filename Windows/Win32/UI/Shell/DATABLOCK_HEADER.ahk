#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Serves as the header for some of the extra data structures used by IShellLinkDataList.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DATABLOCK_HEADER {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the extra data block.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * A signature that identifies the type of data block that follows the header.
     */
    dwSignature : UInt32

}
