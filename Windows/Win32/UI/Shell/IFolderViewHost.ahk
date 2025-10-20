#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that hosts an IFolderView object in a window.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifolderviewhost
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderViewHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderViewHost
     * @type {Guid}
     */
    static IID => Guid("{1ea58f02-d55a-411d-b09e-9e65ac21605b}")

    /**
     * The class identifier for FolderViewHost
     * @type {Guid}
     */
    static CLSID => Guid("{20b1cb23-6968-4eb9-b7d4-a66d00d07cee}")

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
     * @param {HWND} hwndParent 
     * @param {IDataObject} pdo 
     * @param {Pointer<RECT>} prc 
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
    Initialize(hwndParent, pdo, prc) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pdo, "ptr", prc, "HRESULT")
        return result
    }
}
