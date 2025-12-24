#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\INetFwProduct.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * To access the methods and properties for registering third-party firewall products with Windows Firewall and for enumerating registered products.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwproducts
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwProducts extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwProducts
     * @type {Guid}
     */
    static IID => Guid("{39eb36e0-2097-40bd-8af2-63a13b525362}")

    /**
     * The class identifier for NetFwProducts
     * @type {Guid}
     */
    static CLSID => Guid("{cc19079b-8272-4d73-bb70-cdb533527b61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Register", "Item", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Indicates the number of registered third-party firewall products.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwproducts-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * The Register method registers a third-party firewall product.
     * @param {INetFwProduct} product The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwproduct">INetFwProduct</a> object that defines the product to be registered.
     * @returns {IUnknown} The registration handle. The registration will be removed when this object is released.
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwproducts-register
     */
    Register(product) {
        result := ComCall(8, this, "ptr", product, "ptr*", &registration := 0, "HRESULT")
        return IUnknown(registration)
    }

    /**
     * The Item method returns the product with the specified index if it is in the collection.
     * @param {Integer} index Index of the product to retrieve.
     * @returns {INetFwProduct} Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwproduct">INetFwProduct</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwproducts-item
     */
    Item(index) {
        result := ComCall(9, this, "int", index, "ptr*", &product := 0, "HRESULT")
        return INetFwProduct(product)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the registered third-party firewall products in the collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwproducts-get__newenum
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }
}
