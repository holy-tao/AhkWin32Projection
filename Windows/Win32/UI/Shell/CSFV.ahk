#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import ".\IShellView.ahk" { IShellView }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import ".\FOLDERVIEWMODE.ahk" { FOLDERVIEWMODE }

/**
 * Used with the SHCreateShellFolderViewEx function.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-csfv
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CSFV {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the <b>CSFV</b> structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object for which to create the view.
     */
    pshf : IShellFolder

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface. This parameter can be <b>NULL</b>.
     */
    psvOuter : IShellView

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * Ignored.
     */
    pidl : ITEMIDLIST.Ptr

    /**
     * Type: <b>LONG</b>
     */
    lEvents : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-lpfnviewcallback">LPFNVIEWCALLBACK</a></b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-lpfnviewcallback">LPFNVIEWCALLBACK</a> function used by this folder view to handle callback messages. This parameter can be <b>NULL</b>.
     */
    pfnCallback : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a></b>
     */
    fvm : FOLDERVIEWMODE

}
