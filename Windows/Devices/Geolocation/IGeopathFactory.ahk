#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Geopath.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeopathFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeopathFactory
     * @type {Guid}
     */
    static IID => Guid("{27bea9c8-c7e7-4359-9b9b-fca3e05ef593}")

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
     * @param {IIterable<BasicGeoposition>} positions 
     * @returns {Geopath} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(positions) {
        result := ComCall(6, this, "ptr", positions, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(value)
    }

    /**
     * 
     * @param {IIterable<BasicGeoposition>} positions 
     * @param {Integer} altitudeReferenceSystem_ 
     * @returns {Geopath} 
     */
    CreateWithAltitudeReference(positions, altitudeReferenceSystem_) {
        result := ComCall(7, this, "ptr", positions, "int", altitudeReferenceSystem_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(value)
    }

    /**
     * 
     * @param {IIterable<BasicGeoposition>} positions 
     * @param {Integer} altitudeReferenceSystem_ 
     * @param {Integer} spatialReferenceId 
     * @returns {Geopath} 
     */
    CreateWithAltitudeReferenceAndSpatialReference(positions, altitudeReferenceSystem_, spatialReferenceId) {
        result := ComCall(8, this, "ptr", positions, "int", altitudeReferenceSystem_, "uint", spatialReferenceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(value)
    }
}
