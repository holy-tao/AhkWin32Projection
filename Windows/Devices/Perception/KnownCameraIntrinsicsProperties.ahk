#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownCameraIntrinsicsPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static methods for retrieving intrinsic properties of a camera.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knowncameraintrinsicsproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownCameraIntrinsicsProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string key used to retrieve an array of single-precision, floating-point property values indicating the focal length of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knowncameraintrinsicsproperties.focallength
     * @type {HSTRING} 
     */
    static FocalLength {
        get => KnownCameraIntrinsicsProperties.get_FocalLength()
    }

    /**
     * Gets a string key used to retrieve an array of single-precision, floating-point property values indicating the principal point, relative to the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knowncameraintrinsicsproperties.principalpoint
     * @type {HSTRING} 
     */
    static PrincipalPoint {
        get => KnownCameraIntrinsicsProperties.get_PrincipalPoint()
    }

    /**
     * Gets a string key used to retrieve an array of single-precision, floating-point property values indicating the radial distortion of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knowncameraintrinsicsproperties.radialdistortion
     * @type {HSTRING} 
     */
    static RadialDistortion {
        get => KnownCameraIntrinsicsProperties.get_RadialDistortion()
    }

    /**
     * Gets a string key used to retrieve an array of single-precision, floating-point property values indicating the tangential distortion of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knowncameraintrinsicsproperties.tangentialdistortion
     * @type {HSTRING} 
     */
    static TangentialDistortion {
        get => KnownCameraIntrinsicsProperties.get_TangentialDistortion()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FocalLength() {
        if (!KnownCameraIntrinsicsProperties.HasProp("__IKnownCameraIntrinsicsPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownCameraIntrinsicsProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCameraIntrinsicsPropertiesStatics.IID)
            KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics := IKnownCameraIntrinsicsPropertiesStatics(factoryPtr)
        }

        return KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics.get_FocalLength()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PrincipalPoint() {
        if (!KnownCameraIntrinsicsProperties.HasProp("__IKnownCameraIntrinsicsPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownCameraIntrinsicsProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCameraIntrinsicsPropertiesStatics.IID)
            KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics := IKnownCameraIntrinsicsPropertiesStatics(factoryPtr)
        }

        return KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics.get_PrincipalPoint()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RadialDistortion() {
        if (!KnownCameraIntrinsicsProperties.HasProp("__IKnownCameraIntrinsicsPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownCameraIntrinsicsProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCameraIntrinsicsPropertiesStatics.IID)
            KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics := IKnownCameraIntrinsicsPropertiesStatics(factoryPtr)
        }

        return KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics.get_RadialDistortion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TangentialDistortion() {
        if (!KnownCameraIntrinsicsProperties.HasProp("__IKnownCameraIntrinsicsPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownCameraIntrinsicsProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCameraIntrinsicsPropertiesStatics.IID)
            KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics := IKnownCameraIntrinsicsPropertiesStatics(factoryPtr)
        }

        return KnownCameraIntrinsicsProperties.__IKnownCameraIntrinsicsPropertiesStatics.get_TangentialDistortion()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
