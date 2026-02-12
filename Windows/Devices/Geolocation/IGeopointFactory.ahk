#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geopoint.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeopointFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeopointFactory
     * @type {Guid}
     */
    static IID => Guid("{db6b8d33-76bd-4e30-8af7-a844dc37b7a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithAltitudeReferenceSystem", "CreateWithAltitudeReferenceSystemAndSpatialReferenceId"]

    /**
     * Create Extended Stored Procedures
     * @param {BasicGeoposition} position 
     * @returns {Geopoint} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(position) {
        result := ComCall(6, this, "ptr", position, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @param {BasicGeoposition} position 
     * @param {Integer} altitudeReferenceSystem_ 
     * @returns {Geopoint} 
     */
    CreateWithAltitudeReferenceSystem(position, altitudeReferenceSystem_) {
        result := ComCall(7, this, "ptr", position, "int", altitudeReferenceSystem_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @param {BasicGeoposition} position 
     * @param {Integer} altitudeReferenceSystem_ 
     * @param {Integer} spatialReferenceId 
     * @returns {Geopoint} 
     */
    CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, altitudeReferenceSystem_, spatialReferenceId) {
        result := ComCall(8, this, "ptr", position, "int", altitudeReferenceSystem_, "uint", spatialReferenceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }
}
