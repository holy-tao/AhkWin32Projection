#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GeoboundingBox.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeoboundingBoxFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeoboundingBoxFactory
     * @type {Guid}
     */
    static IID => Guid("{4dfba589-0411-4abc-b3b5-5bbccb57d98c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithAltitudeReference", "CreateWithAltitudeReferenceAndSpatialReference"]

    /**
     * Create Extended Stored Procedures
     * @param {BasicGeoposition} northwestCorner 
     * @param {BasicGeoposition} southeastCorner 
     * @returns {GeoboundingBox} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(northwestCorner, southeastCorner) {
        result := ComCall(6, this, "ptr", northwestCorner, "ptr", southeastCorner, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }

    /**
     * 
     * @param {BasicGeoposition} northwestCorner 
     * @param {BasicGeoposition} southeastCorner 
     * @param {Integer} altitudeReferenceSystem_ 
     * @returns {GeoboundingBox} 
     */
    CreateWithAltitudeReference(northwestCorner, southeastCorner, altitudeReferenceSystem_) {
        result := ComCall(7, this, "ptr", northwestCorner, "ptr", southeastCorner, "int", altitudeReferenceSystem_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }

    /**
     * 
     * @param {BasicGeoposition} northwestCorner 
     * @param {BasicGeoposition} southeastCorner 
     * @param {Integer} altitudeReferenceSystem_ 
     * @param {Integer} spatialReferenceId 
     * @returns {GeoboundingBox} 
     */
    CreateWithAltitudeReferenceAndSpatialReference(northwestCorner, southeastCorner, altitudeReferenceSystem_, spatialReferenceId) {
        result := ComCall(8, this, "ptr", northwestCorner, "ptr", southeastCorner, "int", altitudeReferenceSystem_, "uint", spatialReferenceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }
}
