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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HWND} hwnd 
     * @param {IContextMenuCB} pcmcb 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @param {IShellFolder} psf 
     * @param {Integer} cidl 
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl 
     * @param {IUnknown} punkAssociation 
     * @param {Integer} cKeys 
     * @param {Pointer<HKEY>} aKeys 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(hwnd, pcmcb, pidlFolder, psf, cidl, apidl, punkAssociation, cKeys, aKeys) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hwnd, "ptr", pcmcb, "ptr", pidlFolder, "ptr", psf, "uint", cidl, apidlMarshal, apidl, "ptr", punkAssociation, "uint", cKeys, "ptr", aKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dfmrValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-setmenurestrictions
     */
    SetMenuRestrictions(dfmrValues) {
        result := ComCall(4, this, "int", dfmrValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dfmrMask 
     * @param {Pointer<Integer>} pdfmrValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-getmenurestrictions
     */
    GetMenuRestrictions(dfmrMask, pdfmrValues) {
        pdfmrValuesMarshal := pdfmrValues is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", dfmrMask, pdfmrValuesMarshal, pdfmrValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultfoldermenuinitialize-sethandlerclsid
     */
    SetHandlerClsid(rclsid) {
        result := ComCall(6, this, "ptr", rclsid, "HRESULT")
        return result
    }
}
