#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class ILocalCategoriesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocalCategoriesStatics
     * @type {Guid}
     */
    static IID => Guid("{f49399f5-8261-4321-9974-ef92d49a8dca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BankAndCreditUnions", "get_EatDrink", "get_Hospitals", "get_HotelsAndMotels", "get_All", "get_Parking", "get_SeeDo", "get_Shop"]

    /**
     * @type {HSTRING} 
     */
    BankAndCreditUnions {
        get => this.get_BankAndCreditUnions()
    }

    /**
     * @type {HSTRING} 
     */
    EatDrink {
        get => this.get_EatDrink()
    }

    /**
     * @type {HSTRING} 
     */
    Hospitals {
        get => this.get_Hospitals()
    }

    /**
     * @type {HSTRING} 
     */
    HotelsAndMotels {
        get => this.get_HotelsAndMotels()
    }

    /**
     * @type {HSTRING} 
     */
    All {
        get => this.get_All()
    }

    /**
     * @type {HSTRING} 
     */
    Parking {
        get => this.get_Parking()
    }

    /**
     * @type {HSTRING} 
     */
    SeeDo {
        get => this.get_SeeDo()
    }

    /**
     * @type {HSTRING} 
     */
    Shop {
        get => this.get_Shop()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BankAndCreditUnions() {
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
    get_EatDrink() {
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
    get_Hospitals() {
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
    get_HotelsAndMotels() {
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
    get_All() {
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
    get_Parking() {
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
    get_SeeDo() {
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
    get_Shop() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
