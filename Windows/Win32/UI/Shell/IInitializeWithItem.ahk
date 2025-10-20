#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method used to initialize a handler, such as a property handler, thumbnail handler, or preview handler, with an IShellItem.
 * @remarks
 * 
  * Whenever possible, it is recommended that initialization be done through a stream using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-iinitializewithstream">IInitializeWithStream</a>. Benefits of this include increased security and stability.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iinitializewithitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInitializeWithItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeWithItem
     * @type {Guid}
     */
    static IID => Guid("{7f73be3f-fb79-493c-a6c7-7ee14e245841}")

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
     * @param {IShellItem} psi 
     * @param {Integer} grfMode 
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
    Initialize(psi, grfMode) {
        result := ComCall(3, this, "ptr", psi, "uint", grfMode, "HRESULT")
        return result
    }
}
