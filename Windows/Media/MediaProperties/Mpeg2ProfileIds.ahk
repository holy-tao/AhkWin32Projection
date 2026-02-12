#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMpeg2ProfileIdsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for getting MPEG-2 profile ids.
 * @remarks
 * You can set the value of [VideoEncodingProperties.ProfileId](videoencodingproperties_profileid.md) to one of the profile ids provided by this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mpeg2profileids
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class Mpeg2ProfileIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the MPEG-2 simple profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mpeg2profileids.simple
     * @type {Integer} 
     */
    static Simple {
        get => Mpeg2ProfileIds.get_Simple()
    }

    /**
     * Gets the MPEG-2 main profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mpeg2profileids.main
     * @type {Integer} 
     */
    static Main {
        get => Mpeg2ProfileIds.get_Main()
    }

    /**
     * Gets the MPEG-2 signal to noise ratio scalable profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mpeg2profileids.signalnoiseratioscalable
     * @type {Integer} 
     */
    static SignalNoiseRatioScalable {
        get => Mpeg2ProfileIds.get_SignalNoiseRatioScalable()
    }

    /**
     * Gets the MPEG-2 spatially scalable profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mpeg2profileids.spatiallyscalable
     * @type {Integer} 
     */
    static SpatiallyScalable {
        get => Mpeg2ProfileIds.get_SpatiallyScalable()
    }

    /**
     * Gets the MPEG-2 high profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mpeg2profileids.high
     * @type {Integer} 
     */
    static High {
        get => Mpeg2ProfileIds.get_High()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Simple() {
        if (!Mpeg2ProfileIds.HasProp("__IMpeg2ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Mpeg2ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMpeg2ProfileIdsStatics.IID)
            Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics := IMpeg2ProfileIdsStatics(factoryPtr)
        }

        return Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics.get_Simple()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Main() {
        if (!Mpeg2ProfileIds.HasProp("__IMpeg2ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Mpeg2ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMpeg2ProfileIdsStatics.IID)
            Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics := IMpeg2ProfileIdsStatics(factoryPtr)
        }

        return Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics.get_Main()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SignalNoiseRatioScalable() {
        if (!Mpeg2ProfileIds.HasProp("__IMpeg2ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Mpeg2ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMpeg2ProfileIdsStatics.IID)
            Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics := IMpeg2ProfileIdsStatics(factoryPtr)
        }

        return Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics.get_SignalNoiseRatioScalable()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SpatiallyScalable() {
        if (!Mpeg2ProfileIds.HasProp("__IMpeg2ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Mpeg2ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMpeg2ProfileIdsStatics.IID)
            Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics := IMpeg2ProfileIdsStatics(factoryPtr)
        }

        return Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics.get_SpatiallyScalable()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_High() {
        if (!Mpeg2ProfileIds.HasProp("__IMpeg2ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Mpeg2ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMpeg2ProfileIdsStatics.IID)
            Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics := IMpeg2ProfileIdsStatics(factoryPtr)
        }

        return Mpeg2ProfileIds.__IMpeg2ProfileIdsStatics.get_High()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
