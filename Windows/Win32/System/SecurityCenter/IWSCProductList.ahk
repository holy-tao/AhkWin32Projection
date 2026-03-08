#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWscProduct.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods to collect product information for the selected type of providers installed on the computer.
 * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nn-iwscapi-iwscproductlist
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Gathers information on all of the providers of the specified type on the computer.
     * @remarks
     * Once the client gets an <a href="https://docs.microsoft.com/windows/desktop/api/iwscapi/nn-iwscapi-iwscproductlist">IWSCProductList</a> pointer, they must call <b>Initialize</b> with a provider type, which gathers information on all the providers of that type installed on the system. Only one type of provider can be specified when calling <b>Initialize</b>, and the <b>Initialize</b> method may only be called once for each instance of an <b>IWSCProductList</b> pointer.  After the list has been initialized, the user is free to call <a href="https://docs.microsoft.com/windows/desktop/api/iwscapi/nf-iwscapi-iwscproductlist-get_count">Count</a> to obtain the number of providers in the list and <a href="https://docs.microsoft.com/windows/desktop/api/iwscapi/nf-iwscapi-iwscproductlist-get_item">Item</a> to retrieve an individual provider.
     * @param {Integer} provider 
     * @returns {HRESULT} If the method  succeeds, returns S_OK.
     * 
     * If the method  fails, returns a Win32 error code.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproductlist-initialize
     */
    Initialize(provider) {
        result := ComCall(7, this, "uint", provider, "HRESULT")
        return result
    }

    /**
     * Gathers the total number of all security product providers of the specified type on the computer.
     * @returns {Integer} A pointer to the number of providers in the list of security products on the computer.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproductlist-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Returns one of the types of providers on the computer.
     * @remarks
     * A provider is obtained by calling the <b>Item</b> method, which returns an interface pointer to an initialized <a href="https://docs.microsoft.com/windows/desktop/api/iwscapi/nn-iwscapi-iwscproduct">IWscProduct</a> object.  The user is then able to retrieve the name, product state, and signature status through the methods of the <b>IWscProduct</b> interface.
     * @param {Integer} index The list of the providers.
     * @returns {IWscProduct} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iwscapi/nn-iwscapi-iwscproduct">IWscProduct</a> product information.
     * @see https://learn.microsoft.com/windows/win32/api/iwscapi/nf-iwscapi-iwscproductlist-get_item
     */
    get_Item(index) {
        result := ComCall(9, this, "uint", index, "ptr*", &pVal := 0, "HRESULT")
        return IWscProduct(pVal)
    }
}
