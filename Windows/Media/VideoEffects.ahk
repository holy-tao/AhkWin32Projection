#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoEffectsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides video-related effects.
 * @remarks
 * For information in using the effects when capturing video, see [Effects for video capture](/windows/uwp/audio-video-camera/effects-for-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.videoeffects
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class VideoEffects extends IInspectable {
;@region Static Properties
    /**
     * Represents a video stabilization effect which can be used on a video object to reduce the shakiness in the video.
     * @remarks
     * While the **VideoStabilization** property is accessible on Windows Phone 8.1, the video stabilization effect itself is not supported on this platform. The effect is supported on Windows 10 Mobile and later.
     * @see https://learn.microsoft.com/uwp/api/windows.media.videoeffects.videostabilization
     * @type {HSTRING} 
     */
    static VideoStabilization {
        get => VideoEffects.get_VideoStabilization()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoStabilization() {
        if (!VideoEffects.HasProp("__IVideoEffectsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.VideoEffects")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEffectsStatics.IID)
            VideoEffects.__IVideoEffectsStatics := IVideoEffectsStatics(factoryPtr)
        }

        return VideoEffects.__IVideoEffectsStatics.get_VideoStabilization()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
