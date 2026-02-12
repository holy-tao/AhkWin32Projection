#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePrice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePrice
     * @type {Guid}
     */
    static IID => Guid("{55ba94c4-15f1-407c-8f06-006380f4df0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FormattedBasePrice", "get_FormattedPrice", "get_IsOnSale", "get_SaleEndDate", "get_CurrencyCode", "get_FormattedRecurrencePrice"]

    /**
     * @type {HSTRING} 
     */
    FormattedBasePrice {
        get => this.get_FormattedBasePrice()
    }

    /**
     * @type {HSTRING} 
     */
    FormattedPrice {
        get => this.get_FormattedPrice()
    }

    /**
     * @type {Boolean} 
     */
    IsOnSale {
        get => this.get_IsOnSale()
    }

    /**
     * @type {DateTime} 
     */
    SaleEndDate {
        get => this.get_SaleEndDate()
    }

    /**
     * @type {HSTRING} 
     */
    CurrencyCode {
        get => this.get_CurrencyCode()
    }

    /**
     * @type {HSTRING} 
     */
    FormattedRecurrencePrice {
        get => this.get_FormattedRecurrencePrice()
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
     * @returns {HSTRING} 
     */
    get_FormattedPrice() {
        value := HSTRING()
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
     * @returns {DateTime} 
     */
    get_SaleEndDate() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
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
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedRecurrencePrice() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
