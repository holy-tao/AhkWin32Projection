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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {INetFwProduct} product 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-register
     */
    Register(product) {
        result := ComCall(8, this, "ptr", product, "ptr*", &registration := 0, "HRESULT")
        return IUnknown(registration)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {INetFwProduct} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-item
     */
    Item(index) {
        result := ComCall(9, this, "int", index, "ptr*", &product := 0, "HRESULT")
        return INetFwProduct(product)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-get__newenum
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }
}
