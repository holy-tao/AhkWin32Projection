#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * ICivicAddressReport represents a location report that contains information in the form of a street address.
 * @remarks
 * Note that any property value can be <b>NULL</b> if the value is not available.
 * @see https://learn.microsoft.com/windows/win32/api//content/locationapi/nn-locationapi-icivicaddressreport
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class ICivicAddress extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICivicAddress
     * @type {Guid}
     */
    static IID => Guid("{a8567a1a-64f4-4d48-bcea-f6b008eca34c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Country", "get_State", "get_City", "get_PostalCode", "get_Timestamp"]

    /**
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
    }

    /**
     * @type {HSTRING} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
    }

    /**
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
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
    get_State() {
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
    get_City() {
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
    get_PostalCode() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
