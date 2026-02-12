#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceAudioNotificationRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [AudioNotificationRequested](guidancenavigator_audionotificationrequested.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudionotificationrequestedeventargs
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceAudioNotificationRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceAudioNotificationRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceAudioNotificationRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of audio notification that has been requested.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudionotificationrequestedeventargs.audionotification
     * @type {Integer} 
     */
    AudioNotification {
        get => this.get_AudioNotification()
    }

    /**
     * Gets a list of audio files that have been requested to be played.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudionotificationrequestedeventargs.audiofilepaths
     * @type {IVectorView<HSTRING>} 
     */
    AudioFilePaths {
        get => this.get_AudioFilePaths()
    }

    /**
     * Gets the text-based version of the audio notification that has been requested.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudionotificationrequestedeventargs.audiotext
     * @type {HSTRING} 
     */
    AudioText {
        get => this.get_AudioText()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioNotification() {
        if (!this.HasProp("__IGuidanceAudioNotificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceAudioNotificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceAudioNotificationRequestedEventArgs := IGuidanceAudioNotificationRequestedEventArgs(outPtr)
        }

        return this.__IGuidanceAudioNotificationRequestedEventArgs.get_AudioNotification()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AudioFilePaths() {
        if (!this.HasProp("__IGuidanceAudioNotificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceAudioNotificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceAudioNotificationRequestedEventArgs := IGuidanceAudioNotificationRequestedEventArgs(outPtr)
        }

        return this.__IGuidanceAudioNotificationRequestedEventArgs.get_AudioFilePaths()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioText() {
        if (!this.HasProp("__IGuidanceAudioNotificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceAudioNotificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceAudioNotificationRequestedEventArgs := IGuidanceAudioNotificationRequestedEventArgs(outPtr)
        }

        return this.__IGuidanceAudioNotificationRequestedEventArgs.get_AudioText()
    }

;@endregion Instance Methods
}
