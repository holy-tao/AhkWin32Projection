#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWscProduct.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods to collect product information for the selected type of providers installed on the computer.
 * @see https://docs.microsoft.com/windows/win32/api//iwscapi/nn-iwscapi-iwscproductlist
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class IWSCProductList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSCProductList
     * @type {Guid}
     */
    static IID => Guid("{722a338c-6e8e-4e72-ac27-1417fb0c81c2}")

    /**
     * The class identifier for WSCProductList
     * @type {Guid}
     */
    static CLSID => Guid("{17072f7b-9abe-4a74-a261-1eb76b55107a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Count", "get_Item"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} provider 
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
    Initialize(provider) {
        result := ComCall(7, this, "uint", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproductlist-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IWscProduct} 
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproductlist-get_item
     */
    get_Item(index) {
        result := ComCall(9, this, "uint", index, "ptr*", &pVal := 0, "HRESULT")
        return IWscProduct(pVal)
    }
}
