#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. This interface ndicates which Windows Address Book (WAB) object is being displayed (for example, a property sheet or context menu).
 * @see https://docs.microsoft.com/windows/win32/api//wabapi/nn-wabapi-iwabextinit
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IWABExtInit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWABExtInit
     * @type {Guid}
     */
    static IID => Guid("{ea22ebf0-87a4-11d1-9acf-00a0c91f9c8b}")

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
     * @param {Pointer<WABEXTDISPLAY>} lpWABExtDisplay 
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
    Initialize(lpWABExtDisplay) {
        result := ComCall(3, this, "ptr", lpWABExtDisplay, "HRESULT")
        return result
    }
}
