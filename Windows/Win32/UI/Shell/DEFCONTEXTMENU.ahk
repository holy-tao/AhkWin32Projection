#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains context menu information used by SHCreateDefaultContextMenu.
 * @remarks
 * If the <b>aKeys</b> and <b>cKeys</b> members are valid and member <b>punkAssociationInfo</b> is also valid (not <b>NULL</b>), the system constructs the menu using the values of <b>aKeys</b> and <b>cKeys</b>, and ignores member <b>punkAssociationInfo</b> (<a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a>).
 * 
 * Members <b>apidl</b> and <b>cidl</b> can be used as parameters to method <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> to retrieve <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-defcontextmenu
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DEFCONTEXTMENU extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the context menu. Set this member to the handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createmenu">CreateMenu</a>.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenucb">IContextMenuCB</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenucb">IContextMenuCB</a> interface supported by the callback object. This value is optional and can be <b>NULL</b>.
     * @type {IContextMenuCB}
     */
    pcmcb {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The PIDL of the folder that contains the selected file object(s) or the folder of the context menu if no file objects are selected. This value is optional and can be <b>NULL</b>, in which case the PIDL is computed from the <b>psf</b> member.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidlFolder {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface of the folder object that contains the selected file objects, or the folder that contains the context menu if no file objects are selected.
     * @type {IShellFolder}
     */
    psf {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The count of items in member <b>apidl</b>.
     * @type {Integer}
     */
    cidl {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>PCUITEMID_CHILD_ARRAY</b>
     * 
     * A pointer to a constant array of <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structures. Each entry in the array describes a child item to which the context menu applies, for instance, a selected file the user wants to <b>Open</b>.
     * @type {Pointer<Pointer<ITEMIDLIST>>}
     */
    apidl {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a> interface on the object from which to load extensions. This parameter is optional and thus can be <b>NULL</b>. If this value is <b>NULL</b> and members <b>aKeys</b> and <b>cKeys</b> are also <b>NULL</b> (see Remarks),  <b>punkAssociationInfo</b> is computed from the <b>apidl</b> member and <b>cidl</b> via a request for <b>IQueryAssociations</b> through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a>.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> returns <b>E_NOTIMPL</b>, a default implementation is provided based on the <i>SFGAO_FOLDER</i> and <i>SFGAO_FILESYSTEM</i> attributes returned from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">IShellFolder::GetAttributesOf</a>.
     * @type {IUnknown}
     */
    punkAssociationInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The count of items in member <b>aKeys</b>. This value can be zero. If the value is zero, the extensions are loaded based on the object that supports interface <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a> as specified by member <b>punkAssociationInfo</b>.  If the value is non-NULL, the extensions are loaded based only on member <b>aKeys</b> and not member <b>punkAssociationInfo</b>.
     * 
     *                     
     * 
     * <div class="alert"><b>Note</b>  The maximum number of keys is 16. Callers must enforce this limit as the API does not. Failing to do so can result in memory corruption.</div>
     * <div> </div>
     * @type {Integer}
     */
    cKeys {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>const HKEY*</b>
     * 
     * A pointer to an HKEY that specifies the registry key from which to load extensions. This parameter is optional and can be <b>NULL</b>. If the value is <b>NULL</b>, the extensions are loaded based on the object that supports interface <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a> as specified in <b>punkAssociationInfo</b>.
     * @type {Pointer<HKEY>}
     */
    aKeys {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
