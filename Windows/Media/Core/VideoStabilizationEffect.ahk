#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoStabilizationEffect.ahk
#Include ..\IMediaExtension.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\VideoStabilizationEffect.ahk
#Include .\VideoStabilizationEffectEnabledChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an effect that stabilizes a video stream.
 * @remarks
 * Get an instance of this class by passing a [VideoStabilizationEffectDefinition](videostabilizationeffectdefinition.md) object into [MediaCapture.AddVideoEffectAsync](../windows.media.capture/mediacapture_addvideoeffectasync_1410216019.md) or [MediaTranscoder.AddVideoEffect](../windows.media.transcoding/mediatranscoder_addvideoeffect_205953283.md).
 * 
 * For how-to guidance for using the **VideoStabilizationEffect**, see [Effects for video capture](/windows/uwp/audio-video-camera/effects-for-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffect
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoStabilizationEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoStabilizationEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoStabilizationEffect.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether video stabilization is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffect.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Occurs when the value of the [VideoStabilizationEffect.Enabled](videostabilizationeffect_enabled.md) property changes.
     * @type {TypedEventHandler<VideoStabilizationEffect, VideoStabilizationEffectEnabledChangedEventArgs>}
    */
    OnEnabledChanged {
        get {
            if(!this.HasProp("__OnEnabledChanged")){
                this.__OnEnabledChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{897592e2-bfcc-5f16-8834-2c9c4f20559b}"),
                    VideoStabilizationEffect,
                    VideoStabilizationEffectEnabledChangedEventArgs
                )
                this.__OnEnabledChangedToken := this.add_EnabledChanged(this.__OnEnabledChanged.iface)
            }
            return this.__OnEnabledChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnEnabledChangedToken")) {
            this.remove_EnabledChanged(this.__OnEnabledChangedToken)
            this.__OnEnabledChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IVideoStabilizationEffect")) {
            if ((queryResult := this.QueryInterface(IVideoStabilizationEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStabilizationEffect := IVideoStabilizationEffect(outPtr)
        }

        return this.__IVideoStabilizationEffect.put_Enabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IVideoStabilizationEffect")) {
            if ((queryResult := this.QueryInterface(IVideoStabilizationEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStabilizationEffect := IVideoStabilizationEffect(outPtr)
        }

        return this.__IVideoStabilizationEffect.get_Enabled()
    }

    /**
     * 
     * @param {TypedEventHandler<VideoStabilizationEffect, VideoStabilizationEffectEnabledChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnabledChanged(handler) {
        if (!this.HasProp("__IVideoStabilizationEffect")) {
            if ((queryResult := this.QueryInterface(IVideoStabilizationEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStabilizationEffect := IVideoStabilizationEffect(outPtr)
        }

        return this.__IVideoStabilizationEffect.add_EnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_EnabledChanged(cookie) {
        if (!this.HasProp("__IVideoStabilizationEffect")) {
            if ((queryResult := this.QueryInterface(IVideoStabilizationEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStabilizationEffect := IVideoStabilizationEffect(outPtr)
        }

        return this.__IVideoStabilizationEffect.remove_EnabledChanged(cookie)
    }

    /**
     * Gets the recommended video stream configuration for video stabilization, given the specified video device controller and encoding properties.
     * @param {VideoDeviceController} controller The video device controller.
     * @param {VideoEncodingProperties} desiredProperties The encoding properties.
     * @returns {VideoStreamConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffect.getrecommendedstreamconfiguration
     */
    GetRecommendedStreamConfiguration(controller, desiredProperties) {
        if (!this.HasProp("__IVideoStabilizationEffect")) {
            if ((queryResult := this.QueryInterface(IVideoStabilizationEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStabilizationEffect := IVideoStabilizationEffect(outPtr)
        }

        return this.__IVideoStabilizationEffect.GetRecommendedStreamConfiguration(controller, desiredProperties)
    }

    /**
     * Sets properties on the [IMediaExtension](../windows.media/imediaextension.md).
     * @remarks
     * This method is inherited from the [IMediaExtension](../windows.media/imediaextension.md) interface and is not intended to be used from your code. Instead, set the properties of the [VideoStabilizationEffect](videostabilizationeffect.md) directly.
     * @param {IPropertySet} configuration The property set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffect.setproperties
     */
    SetProperties(configuration) {
        if (!this.HasProp("__IMediaExtension")) {
            if ((queryResult := this.QueryInterface(IMediaExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtension := IMediaExtension(outPtr)
        }

        return this.__IMediaExtension.SetProperties(configuration)
    }

;@endregion Instance Methods
}
