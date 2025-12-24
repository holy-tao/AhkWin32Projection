#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods used to get and set shortcut menu information. This information is the same as that provided to SHCreateDefaultContextMenu through the DEFCONTEXTMENU structure.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idefaultfoldermenuinitialize
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDefaultFolderMenuInitialize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDefaultFolderMenuInitialize
     * @type {Guid}
     */
    static IID => Guid("{7690aa79-f8fc-4615-a327-36f7d18f5d91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetMenuRestrictions", "GetMenuRestrictions", "SetHandlerClsid"]

    /**
     * .
     * @param {HWND} hwnd A handle to the shortcut menu.
     * @param {IContextMenuCB} pcmcb Type: <b><a href="nn-shobjidl_core-icontextmenucb.md">IContextMenuCB</a>*</b>
     * 
     * The address of the object that defines the callback for the shortcut menu.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: **PCIDLIST_ABSOLUTE**
     * 
     * The address of an item identifier list that specifies the folder of the items. If NULL, this is computed from the *psf* parameter.
     * @param {IShellFolder} psf Type: <b><a href="nn-shobjidl_core-ishellfolder.md">IShellFolder</a>*</b>
     * 
     * The folder of the items.
     * @param {Integer} cidl Type: <b>UINT</b>
     * 
     * The count of items in the *apidl* parameter.
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl Type: <b>PCUITEMID_CHILD_ARRAY</b>
     * 
     * A pointer to an array of PIDL structures, each of which is an item to be operated on.
     * @param {IUnknown} punkAssociation Type: <b>IUnknown*</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a> object that specifies where to load extensions from.
     * @param {Integer} cKeys Type: <b>UINT</b>
     * 
     * The count of items in the *aKeys* parameter. May be zero.
     * @param {Pointer<HKEY>} aKeys Type: <b>const HKEY*</b>
     * 
     * Specifies where to load extensions from.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-initialize
     */
    Initialize(hwnd, pcmcb, pidlFolder, psf, cidl, apidl, punkAssociation, cKeys, aKeys) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hwnd, "ptr", pcmcb, "ptr", pidlFolder, "ptr", psf, "uint", cidl, apidlMarshal, apidl, "ptr", punkAssociation, "uint", cKeys, "ptr", aKeys, "HRESULT")
        return result
    }

    /**
     * .
     * @param {Integer} dfmrValues A bitwise combination of the [DEFAULT_FOLDER_MENU_RESTRICTIONS](ne-shobjidl_core-default_folder_menu_restrictions.md) values that specify the restrictions to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-setmenurestrictions
     */
    SetMenuRestrictions(dfmrValues) {
        result := ComCall(4, this, "int", dfmrValues, "HRESULT")
        return result
    }

    /**
     * .
     * @param {Integer} dfmrMask A bitwise combination of the [DEFAULT_FOLDER_MENU_RESTRICTIONS](ne-shobjidl_core-default_folder_menu_restrictions.md) values that specify the mask of the restrictions to get.
     * @returns {Integer} A bitwise combination of the [DEFAULT_FOLDER_MENU_RESTRICTIONS](ne-shobjidl_core-default_folder_menu_restrictions.md) values that specify the restrictions.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-getmenurestrictions
     */
    GetMenuRestrictions(dfmrMask) {
        result := ComCall(5, this, "int", dfmrMask, "int*", &pdfmrValues := 0, "HRESULT")
        return pdfmrValues
    }

    /**
     * .
     * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
     * 
     * The CLSID for the object defines the shortcut menu handler.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-sethandlerclsid
     */
    SetHandlerClsid(rclsid) {
        result := ComCall(6, this, "ptr", rclsid, "HRESULT")
        return result
    }
}
