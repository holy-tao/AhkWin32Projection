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
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(7, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwProduct>} product 
     * @param {Pointer<IUnknown>} registration 
     * @returns {HRESULT} 
     */
    Register(product, registration) {
        result := ComCall(8, this, "ptr", product, "ptr", registration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<INetFwProduct>} product 
     * @returns {HRESULT} 
     */
    Item(index, product) {
        result := ComCall(9, this, "int", index, "ptr", product, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(newEnum) {
        result := ComCall(10, this, "ptr", newEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
