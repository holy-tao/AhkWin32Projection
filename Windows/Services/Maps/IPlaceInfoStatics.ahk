#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PlaceInfo.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IPlaceInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaceInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{82b9ff71-6cd0-48a4-afd9-5ed82097936b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithGeopointAndOptions", "CreateFromIdentifier", "CreateFromIdentifierWithOptions", "CreateFromMapLocation", "get_IsShowSupported"]

    /**
     * @type {Boolean} 
     */
    IsShowSupported {
        get => this.get_IsShowSupported()
    }

    /**
     * Create Extended Stored Procedures
     * @param {Geopoint} referencePoint 
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(referencePoint) {
        result := ComCall(6, this, "ptr", referencePoint, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }

    /**
     * Create Extended Stored Procedures
     * @param {Geopoint} referencePoint 
     * @param {PlaceInfoCreateOptions} options 
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithGeopointAndOptions(referencePoint, options) {
        result := ComCall(7, this, "ptr", referencePoint, "ptr", options, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }

    /**
     * 
     * @param {HSTRING} identifier 
     * @returns {PlaceInfo} 
     */
    CreateFromIdentifier(identifier) {
        if(identifier is String) {
            pin := HSTRING.Create(identifier)
            identifier := pin.Value
        }
        identifier := identifier is Win32Handle ? NumGet(identifier, "ptr") : identifier

        result := ComCall(8, this, "ptr", identifier, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }

    /**
     * 
     * @param {HSTRING} identifier 
     * @param {Geopoint} defaultPoint 
     * @param {PlaceInfoCreateOptions} options 
     * @returns {PlaceInfo} 
     */
    CreateFromIdentifierWithOptions(identifier, defaultPoint, options) {
        if(identifier is String) {
            pin := HSTRING.Create(identifier)
            identifier := pin.Value
        }
        identifier := identifier is Win32Handle ? NumGet(identifier, "ptr") : identifier

        result := ComCall(9, this, "ptr", identifier, "ptr", defaultPoint, "ptr", options, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }

    /**
     * 
     * @param {MapLocation} location_ 
     * @returns {PlaceInfo} 
     */
    CreateFromMapLocation(location_) {
        result := ComCall(10, this, "ptr", location_, "ptr*", &resultValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaceInfo(resultValue)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShowSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
