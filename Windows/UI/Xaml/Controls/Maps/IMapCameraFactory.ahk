#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapCamera.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapCameraFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapCameraFactory
     * @type {Guid}
     */
    static IID => Guid("{ea3b0f16-83af-4ace-8e71-10ad9f1e9e7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithLocation", "CreateInstanceWithLocationAndHeading", "CreateInstanceWithLocationHeadingAndPitch", "CreateInstanceWithLocationHeadingPitchRollAndFieldOfView"]

    /**
     * 
     * @param {Geopoint} location_ 
     * @returns {MapCamera} 
     */
    CreateInstanceWithLocation(location_) {
        result := ComCall(6, this, "ptr", location_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} headingInDegrees 
     * @returns {MapCamera} 
     */
    CreateInstanceWithLocationAndHeading(location_, headingInDegrees) {
        result := ComCall(7, this, "ptr", location_, "double", headingInDegrees, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapCamera} 
     */
    CreateInstanceWithLocationHeadingAndPitch(location_, headingInDegrees, pitchInDegrees) {
        result := ComCall(8, this, "ptr", location_, "double", headingInDegrees, "double", pitchInDegrees, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @param {Float} rollInDegrees 
     * @param {Float} fieldOfViewInDegrees 
     * @returns {MapCamera} 
     */
    CreateInstanceWithLocationHeadingPitchRollAndFieldOfView(location_, headingInDegrees, pitchInDegrees, rollInDegrees, fieldOfViewInDegrees) {
        result := ComCall(9, this, "ptr", location_, "double", headingInDegrees, "double", pitchInDegrees, "double", rollInDegrees, "double", fieldOfViewInDegrees, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }
}
