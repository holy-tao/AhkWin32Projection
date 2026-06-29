#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IShellFolderViewCB.ahk" { IShellFolderViewCB }
#Import ".\IShellView.ahk" { IShellView }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * This structure is used with the SHCreateShellFolderView function.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfv_create
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SFV_CREATE {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the <b>SFV_CREATE</b> structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface of the folder for which to create the view.
     */
    pshf : IShellFolder

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface. This parameter may be <b>NULL</b>. This parameter is used only when the view created by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderview">SHCreateShellFolderView</a> is hosted in a common dialog box.
     */
    psvOuter : IShellView

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a> interface that handles the view's callbacks when various events occur. This parameter may be <b>NULL</b>.
     */
    psfvcb : IShellFolderViewCB

}
