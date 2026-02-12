#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geocircle.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeocircleFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocircleFactory
     * @type {Guid}
     */
    static IID => Guid("{afd6531f-72b1-4f7d-87cc-4ed4c9849c05}")

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
     * @param {Float} radius 
     * @returns {Geocircle} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(position, radius) {
        result := ComCall(6, this, "ptr", position, "double", radius, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geocircle(value)
    }

    /**
     * 
     * @param {BasicGeoposition} position 
     * @param {Float} radius 
     * @param {Integer} altitudeReferenceSystem_ 
     * @returns {Geocircle} 
     */
    CreateWithAltitudeReferenceSystem(position, radius, altitudeReferenceSystem_) {
        result := ComCall(7, this, "ptr", position, "double", radius, "int", altitudeReferenceSystem_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geocircle(value)
    }

    /**
     * 
     * @param {BasicGeoposition} position 
     * @param {Float} radius 
     * @param {Integer} altitudeReferenceSystem_ 
     * @param {Integer} spatialReferenceId 
     * @returns {Geocircle} 
     */
    CreateWithAltitudeReferenceSystemAndSpatialReferenceId(position, radius, altitudeReferenceSystem_, spatialReferenceId) {
        result := ComCall(8, this, "ptr", position, "double", radius, "int", altitudeReferenceSystem_, "uint", spatialReferenceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geocircle(value)
    }
}
