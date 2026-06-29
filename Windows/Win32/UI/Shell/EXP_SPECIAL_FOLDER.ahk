#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds an extra data block used by IShellLinkDataList. It holds special folder information.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_special_folder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct EXP_SPECIAL_FOLDER {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the <b>EXP_SPECIAL_FOLDER</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure's signature. It should be set to EXP_SPECIAL_FOLDER_SIG.
     */
    dwSignature : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The ID of the special folder that the link points into.
     */
    idSpecialFolder : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset into the saved PIDL.
     */
    cbOffset : UInt32

}
