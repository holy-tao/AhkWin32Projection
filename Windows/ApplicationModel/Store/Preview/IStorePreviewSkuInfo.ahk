#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStorePreviewSkuInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePreviewSkuInfo
     * @type {Guid}
     */
    static IID => Guid("{81fd76e2-0b26-48d9-98ce-27461c669d6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductId", "get_SkuId", "get_SkuType", "get_Title", "get_Description", "get_CustomDeveloperData", "get_CurrencyCode", "get_FormattedListPrice", "get_ExtendedData"]

    /**
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * @type {HSTRING} 
     */
    SkuId {
        get => this.get_SkuId()
    }

    /**
     * @type {HSTRING} 
     */
    SkuType {
        get => this.get_SkuType()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {HSTRING} 
     */
    CustomDeveloperData {
        get => this.get_CustomDeveloperData()
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
    FormattedListPrice {
        get => this.get_FormattedListPrice()
    }

    /**
     * @type {HSTRING} 
     */
    ExtendedData {
        get => this.get_ExtendedData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProductId() {
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
    get_SkuId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SkuType() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
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
    get_Description() {
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
    get_CustomDeveloperData() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
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
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedListPrice() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedData() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
