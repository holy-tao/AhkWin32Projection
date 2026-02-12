#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class IProductListing2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProductListing2
     * @type {Guid}
     */
    static IID => Guid("{f89e290f-73fe-494d-a939-08a9b2495abe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FormattedBasePrice", "get_SaleEndDate", "get_IsOnSale", "get_CurrencyCode"]

    /**
     * @type {HSTRING} 
     */
    FormattedBasePrice {
        get => this.get_FormattedBasePrice()
    }

    /**
     * @type {DateTime} 
     */
    SaleEndDate {
        get => this.get_SaleEndDate()
    }

    /**
     * @type {Boolean} 
     */
    IsOnSale {
        get => this.get_IsOnSale()
    }

    /**
     * @type {HSTRING} 
     */
    CurrencyCode {
        get => this.get_CurrencyCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedBasePrice() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_SaleEndDate() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnSale() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrencyCode() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
