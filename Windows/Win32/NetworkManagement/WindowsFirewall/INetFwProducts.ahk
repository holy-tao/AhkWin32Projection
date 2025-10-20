#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-get_count
     */
    get_Count(count) {
        result := ComCall(7, this, "int*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetFwProduct} product 
     * @param {Pointer<IUnknown>} registration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-register
     */
    Register(product, registration) {
        result := ComCall(8, this, "ptr", product, "ptr*", registration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<INetFwProduct>} product 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-item
     */
    Item(index, product) {
        result := ComCall(9, this, "int", index, "ptr*", product, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-get__newenum
     */
    get__NewEnum(newEnum) {
        result := ComCall(10, this, "ptr*", newEnum, "HRESULT")
        return result
    }
}
