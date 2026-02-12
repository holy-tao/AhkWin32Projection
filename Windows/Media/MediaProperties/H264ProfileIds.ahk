#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IH264ProfileIdsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for getting H.264 profile ids.
 * @remarks
 * You can set the value of [VideoEncodingProperties.ProfileId](videoencodingproperties_profileid.md) to one of the profile ids provided by this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class H264ProfileIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the H.264 constrained baseline profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.constrainedbaseline
     * @type {Integer} 
     */
    static ConstrainedBaseline {
        get => H264ProfileIds.get_ConstrainedBaseline()
    }

    /**
     * Gets the H.264 baseline profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.baseline
     * @type {Integer} 
     */
    static Baseline {
        get => H264ProfileIds.get_Baseline()
    }

    /**
     * Gets the H.264 extended profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.extended
     * @type {Integer} 
     */
    static Extended {
        get => H264ProfileIds.get_Extended()
    }

    /**
     * Gets the H.264 main profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.main
     * @type {Integer} 
     */
    static Main {
        get => H264ProfileIds.get_Main()
    }

    /**
     * Gets the H.264 high profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.high
     * @type {Integer} 
     */
    static High {
        get => H264ProfileIds.get_High()
    }

    /**
     * Gets the H.264 high 10 profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.high10
     * @type {Integer} 
     */
    static High10 {
        get => H264ProfileIds.get_High10()
    }

    /**
     * Gets the H.264 high 4:2:2 profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.high422
     * @type {Integer} 
     */
    static High422 {
        get => H264ProfileIds.get_High422()
    }

    /**
     * Gets the H.264 high 4:4:4 profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.high444
     * @type {Integer} 
     */
    static High444 {
        get => H264ProfileIds.get_High444()
    }

    /**
     * Gets the H.264 stereo high profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.stereohigh
     * @type {Integer} 
     */
    static StereoHigh {
        get => H264ProfileIds.get_StereoHigh()
    }

    /**
     * Gets the H.264 multiview profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.h264profileids.multiviewhigh
     * @type {Integer} 
     */
    static MultiviewHigh {
        get => H264ProfileIds.get_MultiviewHigh()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_ConstrainedBaseline() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_ConstrainedBaseline()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Baseline() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_Baseline()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Extended() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_Extended()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Main() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_Main()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_High() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_High()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_High10() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_High10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_High422() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_High422()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_High444() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_High444()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_StereoHigh() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_StereoHigh()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MultiviewHigh() {
        if (!H264ProfileIds.HasProp("__IH264ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.H264ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IH264ProfileIdsStatics.IID)
            H264ProfileIds.__IH264ProfileIdsStatics := IH264ProfileIdsStatics(factoryPtr)
        }

        return H264ProfileIds.__IH264ProfileIdsStatics.get_MultiviewHigh()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
