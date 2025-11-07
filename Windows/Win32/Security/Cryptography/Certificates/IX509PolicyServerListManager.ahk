#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509PolicyServerUrl.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509PolicyServerListManager interface defines the following methods and properties that enable you to manage a collection of IX509PolicyServerUrl objects.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509policyserverlistmanager
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PolicyServerListManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PolicyServerListManager
     * @type {Guid}
     */
    static IID => Guid("{884e204b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "Initialize"]

    /**
     * 
     * @param {Integer} Index 
     * @returns {IX509PolicyServerUrl} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverlistmanager-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return IX509PolicyServerUrl(pVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverlistmanager-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverlistmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @param {IX509PolicyServerUrl} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverlistmanager-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverlistmanager-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverlistmanager-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} context 
     * @param {Integer} Flags 
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
    Initialize(context, Flags) {
        result := ComCall(13, this, "int", context, "int", Flags, "HRESULT")
        return result
    }
}
