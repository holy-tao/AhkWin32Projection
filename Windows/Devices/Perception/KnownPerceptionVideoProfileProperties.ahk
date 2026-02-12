#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionVideoProfilePropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties of a video profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoprofileproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionVideoProfileProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string key used to retrieve an enumeration property indicating the bitmap pixel format.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoprofileproperties.bitmappixelformat
     * @type {HSTRING} 
     */
    static BitmapPixelFormat {
        get => KnownPerceptionVideoProfileProperties.get_BitmapPixelFormat()
    }

    /**
     * Gets a string key used to retrieve an enumeration property indicating the bitmap alpha mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoprofileproperties.bitmapalphamode
     * @type {HSTRING} 
     */
    static BitmapAlphaMode {
        get => KnownPerceptionVideoProfileProperties.get_BitmapAlphaMode()
    }

    /**
     * Gets a string key used to retrieve a 32-bit unsigned integer property indicating the frame width, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoprofileproperties.width
     * @type {HSTRING} 
     */
    static Width {
        get => KnownPerceptionVideoProfileProperties.get_Width()
    }

    /**
     * Gets a string key used to retrieve a 32-bit unsigned integer property indicating the frame height, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoprofileproperties.height
     * @type {HSTRING} 
     */
    static Height {
        get => KnownPerceptionVideoProfileProperties.get_Height()
    }

    /**
     * Gets a string key used to retrieve a TimeSpan property indicating the time duration of each frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionvideoprofileproperties.frameduration
     * @type {HSTRING} 
     */
    static FrameDuration {
        get => KnownPerceptionVideoProfileProperties.get_FrameDuration()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BitmapPixelFormat() {
        if (!KnownPerceptionVideoProfileProperties.HasProp("__IKnownPerceptionVideoProfilePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoProfilePropertiesStatics.IID)
            KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics := IKnownPerceptionVideoProfilePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics.get_BitmapPixelFormat()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BitmapAlphaMode() {
        if (!KnownPerceptionVideoProfileProperties.HasProp("__IKnownPerceptionVideoProfilePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoProfilePropertiesStatics.IID)
            KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics := IKnownPerceptionVideoProfilePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics.get_BitmapAlphaMode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Width() {
        if (!KnownPerceptionVideoProfileProperties.HasProp("__IKnownPerceptionVideoProfilePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoProfilePropertiesStatics.IID)
            KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics := IKnownPerceptionVideoProfilePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics.get_Width()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Height() {
        if (!KnownPerceptionVideoProfileProperties.HasProp("__IKnownPerceptionVideoProfilePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoProfilePropertiesStatics.IID)
            KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics := IKnownPerceptionVideoProfilePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics.get_Height()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FrameDuration() {
        if (!KnownPerceptionVideoProfileProperties.HasProp("__IKnownPerceptionVideoProfilePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionVideoProfilePropertiesStatics.IID)
            KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics := IKnownPerceptionVideoProfilePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionVideoProfileProperties.__IKnownPerceptionVideoProfilePropertiesStatics.get_FrameDuration()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
