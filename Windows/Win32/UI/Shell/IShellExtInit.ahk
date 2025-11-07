#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that initializes Shell extensions for property sheets, shortcut menus, and drag-and-drop handlers (extensions that add items to shortcut menus during nondefault drag-and-drop operations).
 * @remarks
 * 
 * Implement <b>IShellExtInit</b> when you are writing a handler based on the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext">IShellPropSheetExt</a> interface.
 * 
 * Note that Shell extensions based on other interfaces do not use this method of initialization.
 * 
 * You do not use this interface directly. The Shell calls it to initialize the handler.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellextinit
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellExtInit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellExtInit
     * @type {Guid}
     */
    static IID => Guid("{000214e8-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @param {IDataObject} pdtobj 
     * @param {HKEY} hkeyProgID 
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
    Initialize(pidlFolder, pdtobj, hkeyProgID) {
        hkeyProgID := hkeyProgID is Win32Handle ? NumGet(hkeyProgID, "ptr") : hkeyProgID

        result := ComCall(3, this, "ptr", pidlFolder, "ptr", pdtobj, "ptr", hkeyProgID, "HRESULT")
        return result
    }
}
