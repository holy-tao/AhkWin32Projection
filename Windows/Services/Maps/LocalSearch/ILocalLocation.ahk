#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\MapAddress.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class ILocalLocation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocalLocation
     * @type {Guid}
     */
    static IID => Guid("{bb0fe9ab-4502-4f2c-94a9-0d60de0e2163}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "get_Identifier", "get_Description", "get_DisplayName", "get_Point", "get_PhoneNumber", "get_DataAttribution"]

    /**
     * @type {MapAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {HSTRING} 
     */
    Identifier {
        get => this.get_Identifier()
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
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {Geopoint} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * @type {HSTRING} 
     */
    DataAttribution {
        get => this.get_DataAttribution()
    }

    /**
     * 
     * @returns {MapAddress} 
     */
    get_Address() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Identifier() {
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
    get_Description() {
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
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Point() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
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
    get_DataAttribution() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
