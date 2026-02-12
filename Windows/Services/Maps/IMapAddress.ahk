#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapAddress extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapAddress
     * @type {Guid}
     */
    static IID => Guid("{cfa7a973-a3b4-4494-b3ff-cba94db69699}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BuildingName", "get_BuildingFloor", "get_BuildingRoom", "get_BuildingWing", "get_StreetNumber", "get_Street", "get_Neighborhood", "get_District", "get_Town", "get_Region", "get_RegionCode", "get_Country", "get_CountryCode", "get_PostCode", "get_Continent"]

    /**
     * @type {HSTRING} 
     */
    BuildingName {
        get => this.get_BuildingName()
    }

    /**
     * @type {HSTRING} 
     */
    BuildingFloor {
        get => this.get_BuildingFloor()
    }

    /**
     * @type {HSTRING} 
     */
    BuildingRoom {
        get => this.get_BuildingRoom()
    }

    /**
     * @type {HSTRING} 
     */
    BuildingWing {
        get => this.get_BuildingWing()
    }

    /**
     * @type {HSTRING} 
     */
    StreetNumber {
        get => this.get_StreetNumber()
    }

    /**
     * @type {HSTRING} 
     */
    Street {
        get => this.get_Street()
    }

    /**
     * @type {HSTRING} 
     */
    Neighborhood {
        get => this.get_Neighborhood()
    }

    /**
     * @type {HSTRING} 
     */
    District {
        get => this.get_District()
    }

    /**
     * @type {HSTRING} 
     */
    Town {
        get => this.get_Town()
    }

    /**
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
    }

    /**
     * @type {HSTRING} 
     */
    RegionCode {
        get => this.get_RegionCode()
    }

    /**
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
    }

    /**
     * @type {HSTRING} 
     */
    CountryCode {
        get => this.get_CountryCode()
    }

    /**
     * @type {HSTRING} 
     */
    PostCode {
        get => this.get_PostCode()
    }

    /**
     * @type {HSTRING} 
     */
    Continent {
        get => this.get_Continent()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BuildingName() {
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
    get_BuildingFloor() {
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
    get_BuildingRoom() {
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
    get_BuildingWing() {
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
    get_StreetNumber() {
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
    get_Street() {
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
    get_Neighborhood() {
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
    get_District() {
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
    get_Town() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Region() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RegionCode() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CountryCode() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostCode() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Continent() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
