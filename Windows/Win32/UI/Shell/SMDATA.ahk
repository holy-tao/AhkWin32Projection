#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import "..\WindowsAndMessaging\HMENU.ahk" { HMENU }

/**
 * Contains information from a menu band.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-smdata
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SMDATA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A mask that is always set to SMDM_HMENU.
     */
    dwMask : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : UInt32

    /**
     * Type: <b>HMENU</b>
     * 
     * The static menu portion of the menu band.
     */
    hmenu : HMENU

    /**
     * Type: <b>HWND</b>
     * 
     * The HWND value of the owner window.
     */
    hwnd : HWND

    /**
     * Type: <b>UINT</b>
     * 
     * The identifier of the menu item. This value is -1 for the menu itself.
     */
    uId : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The identifier of the parent menu.
     */
    uIdParent : UInt32

    /**
     * Type: <b>UINT</b>
     */
    uIdAncestor : UInt32

    /**
     * Type: <b>IUknown*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the <a href="https://docs.microsoft.com/windows/desktop/shell/profiles-directory">MenuBand</a> object.
     */
    punk : IUnknown

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> of the shell folder portion of the menu.
     */
    pidlFolder : ITEMIDLIST.Ptr

    /**
     * Type: <b>PUITEMID_CHILD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> of the selected item in the shell folder portion of the menu.
     */
    pidlItem : ITEMIDLIST.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface for the folder associated with the shell folder portion of the menu.
     */
    psf : IShellFolder

    /**
     * Type: <b>void*</b>
     * 
     * A pointer to a user-defined data structure.
     */
    pvUserData : IntPtr

}
