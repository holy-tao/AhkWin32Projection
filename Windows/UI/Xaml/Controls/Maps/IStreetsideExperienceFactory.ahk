#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\StreetsideExperience.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IStreetsideExperienceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreetsideExperienceFactory
     * @type {Guid}
     */
    static IID => Guid("{7a5bcf3c-649e-4342-9995-68a6cf5961a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithPanorama", "CreateInstanceWithPanoramaHeadingPitchAndFieldOfView"]

    /**
     * 
     * @param {StreetsidePanorama} panorama 
     * @returns {StreetsideExperience} 
     */
    CreateInstanceWithPanorama(panorama) {
        result := ComCall(6, this, "ptr", panorama, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreetsideExperience(value)
    }

    /**
     * 
     * @param {StreetsidePanorama} panorama 
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @param {Float} fieldOfViewInDegrees 
     * @returns {StreetsideExperience} 
     */
    CreateInstanceWithPanoramaHeadingPitchAndFieldOfView(panorama, headingInDegrees, pitchInDegrees, fieldOfViewInDegrees) {
        result := ComCall(7, this, "ptr", panorama, "double", headingInDegrees, "double", pitchInDegrees, "double", fieldOfViewInDegrees, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreetsideExperience(value)
    }
}
