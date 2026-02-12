#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class IProductListing extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProductListing
     * @type {Guid}
     */
    static IID => Guid("{45a7d6ad-c750-4d9c-947c-b00dcbf9e9c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductId", "get_FormattedPrice", "get_Name"]

    /**
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * @type {HSTRING} 
     */
    FormattedPrice {
        get => this.get_FormattedPrice()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
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
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
