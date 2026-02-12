#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapScene.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapSceneStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapSceneStatics
     * @type {Guid}
     */
    static IID => Guid("{03e4ad6c-86ec-44d9-9597-fb75b7deba0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromBoundingBox", "CreateFromBoundingBoxWithHeadingAndPitch", "CreateFromCamera", "CreateFromLocation", "CreateFromLocationWithHeadingAndPitch", "CreateFromLocationAndRadius", "CreateFromLocationAndRadiusWithHeadingAndPitch", "CreateFromLocations", "CreateFromLocationsWithHeadingAndPitch"]

    /**
     * 
     * @param {GeoboundingBox} bounds 
     * @returns {MapScene} 
     */
    CreateFromBoundingBox(bounds) {
        result := ComCall(6, this, "ptr", bounds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {GeoboundingBox} bounds 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     */
    CreateFromBoundingBoxWithHeadingAndPitch(bounds, headingInDegrees, pitchInDegrees) {
        result := ComCall(7, this, "ptr", bounds, "double", headingInDegrees, "double", pitchInDegrees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {MapCamera} camera 
     * @returns {MapScene} 
     */
    CreateFromCamera(camera) {
        result := ComCall(8, this, "ptr", camera, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @returns {MapScene} 
     */
    CreateFromLocation(location_) {
        result := ComCall(9, this, "ptr", location_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     */
    CreateFromLocationWithHeadingAndPitch(location_, headingInDegrees, pitchInDegrees) {
        result := ComCall(10, this, "ptr", location_, "double", headingInDegrees, "double", pitchInDegrees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} radiusInMeters 
     * @returns {MapScene} 
     */
    CreateFromLocationAndRadius(location_, radiusInMeters) {
        result := ComCall(11, this, "ptr", location_, "double", radiusInMeters, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Float} radiusInMeters 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     */
    CreateFromLocationAndRadiusWithHeadingAndPitch(location_, radiusInMeters, headingInDegrees, pitchInDegrees) {
        result := ComCall(12, this, "ptr", location_, "double", radiusInMeters, "double", headingInDegrees, "double", pitchInDegrees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} locations 
     * @returns {MapScene} 
     */
    CreateFromLocations(locations) {
        result := ComCall(13, this, "ptr", locations, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }

    /**
     * 
     * @param {IIterable<Geopoint>} locations 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     */
    CreateFromLocationsWithHeadingAndPitch(locations, headingInDegrees, pitchInDegrees) {
        result := ComCall(14, this, "ptr", locations, "double", headingInDegrees, "double", pitchInDegrees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(result_)
    }
}
