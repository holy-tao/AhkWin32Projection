#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionVideoFrameSourcePropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties of video frame sources.
 * @remarks
 * The properties provided by these static methods are used as keys for controlling properties on the following classes:
 * 
 * + PerceptionColorFrameSource
 * + PerceptionDepthFrameSource
 * + PerceptionInfraredFrameSource
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoframesourceproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionVideoFrameSourceProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string key used to retrieve the current video profile property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoframesourceproperties.videoprofile
     * @type {HSTRING} 
     */
    static VideoProfile {
        get => KnownPerceptionVideoFrameSourceProperties.get_VideoProfile()
    }

    /**
     * Gets a string key used to retrieve the supported video profiles property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoframesourceproperties.supportedvideoprofiles
     * @type {HSTRING} 
     */
    static SupportedVideoProfiles {
        get => KnownPerceptionVideoFrameSourceProperties.get_SupportedVideoProfiles()
    }

    /**
     * Gets a string key used to retrieve a boolean property indicating the supported video profiles that are currently available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoframesourceproperties.availablevideoprofiles
     * @type {HSTRING} 
     */
    static AvailableVideoProfiles {
        get => KnownPerceptionVideoFrameSourceProperties.get_AvailableVideoProfiles()
    }

    /**
     * Gets a string key used to retrieve a boolean property indicating whether or not the video frame source is providing mirrored video frames.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoframesourceproperties.ismirrored
     * @type {HSTRING} 
     */
    static IsMirrored {
        get => KnownPerceptionVideoFrameSourceProperties.get_IsMirrored()
    }

    /**
     * Gets a string key used to retrieve a CameraIntrinsics property defining the physical properties of the camera device. The CameraIntrinsics object also provides convenience methods for sensor-related geometry, including camera space to image space projections.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoframesourceproperties.cameraintrinsics
     * @type {HSTRING} 
     */
    static CameraIntrinsics {
        get => KnownPerceptionVideoFrameSourceProperties.get_CameraIntrinsics()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoProfile() {
        if (!KnownPerceptionVideoFrameSourceProperties.HasProp("__IKnownPerceptionVideoFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoFrameSourcePropertiesStatics.IID)
            KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics := IKnownPerceptionVideoFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics.get_VideoProfile()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SupportedVideoProfiles() {
        if (!KnownPerceptionVideoFrameSourceProperties.HasProp("__IKnownPerceptionVideoFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoFrameSourcePropertiesStatics.IID)
            KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics := IKnownPerceptionVideoFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics.get_SupportedVideoProfiles()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AvailableVideoProfiles() {
        if (!KnownPerceptionVideoFrameSourceProperties.HasProp("__IKnownPerceptionVideoFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoFrameSourcePropertiesStatics.IID)
            KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics := IKnownPerceptionVideoFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics.get_AvailableVideoProfiles()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IsMirrored() {
        if (!KnownPerceptionVideoFrameSourceProperties.HasProp("__IKnownPerceptionVideoFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoFrameSourcePropertiesStatics.IID)
            KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics := IKnownPerceptionVideoFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics.get_IsMirrored()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CameraIntrinsics() {
        if (!KnownPerceptionVideoFrameSourceProperties.HasProp("__IKnownPerceptionVideoFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoFrameSourcePropertiesStatics.IID)
            KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics := IKnownPerceptionVideoFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoFrameSourceProperties.__IKnownPerceptionVideoFrameSourcePropertiesStatics.get_CameraIntrinsics()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
