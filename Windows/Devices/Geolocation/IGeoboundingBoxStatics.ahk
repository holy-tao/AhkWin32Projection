#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GeoboundingBox.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeoboundingBoxStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeoboundingBoxStatics
     * @type {Guid}
     */
    static IID => Guid("{67b80708-e61a-4cd0-841b-93233792b5ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCompute", "TryComputeWithAltitudeReference", "TryComputeWithAltitudeReferenceAndSpatialReference"]

    /**
     * 
     * @param {IIterable<BasicGeoposition>} positions 
     * @returns {GeoboundingBox} 
     */
    TryCompute(positions) {
        result := ComCall(6, this, "ptr", positions, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }

    /**
     * 
     * @param {IIterable<BasicGeoposition>} positions 
     * @param {Integer} altitudeRefSystem 
     * @returns {GeoboundingBox} 
     */
    TryComputeWithAltitudeReference(positions, altitudeRefSystem) {
        result := ComCall(7, this, "ptr", positions, "int", altitudeRefSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }

    /**
     * 
     * @param {IIterable<BasicGeoposition>} positions 
     * @param {Integer} altitudeRefSystem 
     * @param {Integer} spatialReferenceId 
     * @returns {GeoboundingBox} 
     */
    TryComputeWithAltitudeReferenceAndSpatialReference(positions, altitudeRefSystem, spatialReferenceId) {
        result := ComCall(8, this, "ptr", positions, "int", altitudeRefSystem, "uint", spatialReferenceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }
}
