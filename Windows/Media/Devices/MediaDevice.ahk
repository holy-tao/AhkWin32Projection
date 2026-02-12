#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods used to select devices for capturing and rendering audio, and for capturing video.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevice
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class MediaDevice extends IInspectable {
;@region Static Methods
    /**
     * Returns the identifier string of a device for capturing audio.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevice.getaudiocaptureselector
     */
    static GetAudioCaptureSelector() {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.GetAudioCaptureSelector()
    }

    /**
     * Returns the identifier string of a device for rendering audio.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevice.getaudiorenderselector
     */
    static GetAudioRenderSelector() {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.GetAudioRenderSelector()
    }

    /**
     * Returns the identifier string of a device for capturing video.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevice.getvideocaptureselector
     */
    static GetVideoCaptureSelector() {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.GetVideoCaptureSelector()
    }

    /**
     * Returns the identifier string of the default device for capturing audio in the specified role.
     * @param {Integer} role The specified audio device role (console, media, or communications).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevice.getdefaultaudiocaptureid
     */
    static GetDefaultAudioCaptureId(role) {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.GetDefaultAudioCaptureId(role)
    }

    /**
     * Returns the identifier string of the default device for rendering audio in the specified role.
     * @param {Integer} role The specified audio device role (console, media, or communications).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediadevice.getdefaultaudiorenderid
     */
    static GetDefaultAudioRenderId(role) {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.GetDefaultAudioRenderId(role)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, DefaultAudioCaptureDeviceChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_DefaultAudioCaptureDeviceChanged(handler) {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.add_DefaultAudioCaptureDeviceChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_DefaultAudioCaptureDeviceChanged(cookie) {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.remove_DefaultAudioCaptureDeviceChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, DefaultAudioRenderDeviceChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_DefaultAudioRenderDeviceChanged(handler) {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.add_DefaultAudioRenderDeviceChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_DefaultAudioRenderDeviceChanged(cookie) {
        if (!MediaDevice.HasProp("__IMediaDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.MediaDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaDeviceStatics.IID)
            MediaDevice.__IMediaDeviceStatics := IMediaDeviceStatics(factoryPtr)
        }

        return MediaDevice.__IMediaDeviceStatics.remove_DefaultAudioRenderDeviceChanged(cookie)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
