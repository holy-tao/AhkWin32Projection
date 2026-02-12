#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAudioFormatSubtypeStatics2.ahk
#Include .\ISpatialAudioFormatSubtypeStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Helper class to retrieve the GUIDs for known spatial audio formats.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class SpatialAudioFormatSubtype extends IInspectable {
;@region Static Properties
    /**
     * GUID for DTSHeadphoneX.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.dtsxforhometheater
     * @type {HSTRING} 
     */
    static DTSXForHomeTheater {
        get => SpatialAudioFormatSubtype.get_DTSXForHomeTheater()
    }

    /**
     * GUID for WindowsSonic.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.windowssonic
     * @type {HSTRING} 
     */
    static WindowsSonic {
        get => SpatialAudioFormatSubtype.get_WindowsSonic()
    }

    /**
     * GUID for DolbyAtmosForHeadphones.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.dolbyatmosforheadphones
     * @type {HSTRING} 
     */
    static DolbyAtmosForHeadphones {
        get => SpatialAudioFormatSubtype.get_DolbyAtmosForHeadphones()
    }

    /**
     * GUID for DolbyAtmosForHomeTheater.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.dolbyatmosforhometheater
     * @type {HSTRING} 
     */
    static DolbyAtmosForHomeTheater {
        get => SpatialAudioFormatSubtype.get_DolbyAtmosForHomeTheater()
    }

    /**
     * GUID for DolbyAtmosForSpeakers.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.dolbyatmosforspeakers
     * @type {HSTRING} 
     */
    static DolbyAtmosForSpeakers {
        get => SpatialAudioFormatSubtype.get_DolbyAtmosForSpeakers()
    }

    /**
     * GUID for DTSHeadphoneX.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.dtsheadphonex
     * @type {HSTRING} 
     */
    static DTSHeadphoneX {
        get => SpatialAudioFormatSubtype.get_DTSHeadphoneX()
    }

    /**
     * GUID for DTSXUltra.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatsubtype.dtsxultra
     * @type {HSTRING} 
     */
    static DTSXUltra {
        get => SpatialAudioFormatSubtype.get_DTSXUltra()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DTSXForHomeTheater() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics2.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics2 := ISpatialAudioFormatSubtypeStatics2(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics2.get_DTSXForHomeTheater()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WindowsSonic() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics := ISpatialAudioFormatSubtypeStatics(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics.get_WindowsSonic()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DolbyAtmosForHeadphones() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics := ISpatialAudioFormatSubtypeStatics(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics.get_DolbyAtmosForHeadphones()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DolbyAtmosForHomeTheater() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics := ISpatialAudioFormatSubtypeStatics(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics.get_DolbyAtmosForHomeTheater()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DolbyAtmosForSpeakers() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics := ISpatialAudioFormatSubtypeStatics(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics.get_DolbyAtmosForSpeakers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DTSHeadphoneX() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics := ISpatialAudioFormatSubtypeStatics(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics.get_DTSHeadphoneX()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DTSXUltra() {
        if (!SpatialAudioFormatSubtype.HasProp("__ISpatialAudioFormatSubtypeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatSubtype")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatSubtypeStatics.IID)
            SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics := ISpatialAudioFormatSubtypeStatics(factoryPtr)
        }

        return SpatialAudioFormatSubtype.__ISpatialAudioFormatSubtypeStatics.get_DTSXUltra()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
