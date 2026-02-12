#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverStreamControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object which encapsulates functionality for controlling properties of the audio and video streams.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstreamcontrol
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverStreamControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverStreamControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverStreamControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies whether the Miracast Transmitter should mute the audio stream. The default value is false.
     * @remarks
     * If the Miracast Receiver app does not want to receive the audio stream, for example, because audio playback is muted, then it can set the MuteAudio property to true.
     * This will request the Miracast Transmitter to stop transmitting audio data, which can save network bandwidth and extend battery life. 
     * Not all Miracast Transmitters suppport this request, so the app should not assume that audio data will cease to be transmitted.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstreamcontrol.muteaudio
     * @type {Boolean} 
     */
    MuteAudio {
        get => this.get_MuteAudio()
        set => this.put_MuteAudio(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns an object representing the current settings for the video stream.
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [GetVideoStreamSettingsAsync](miracastreceiverstreamcontrol_getvideostreamsettingsasync_709470693.md).
     * @returns {MiracastReceiverVideoStreamSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstreamcontrol.getvideostreamsettings
     */
    GetVideoStreamSettings() {
        if (!this.HasProp("__IMiracastReceiverStreamControl")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStreamControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStreamControl := IMiracastReceiverStreamControl(outPtr)
        }

        return this.__IMiracastReceiverStreamControl.GetVideoStreamSettings()
    }

    /**
     * Returns an object representing the current settings for the video stream.
     * @returns {IAsyncOperation<MiracastReceiverVideoStreamSettings>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstreamcontrol.getvideostreamsettingsasync
     */
    GetVideoStreamSettingsAsync() {
        if (!this.HasProp("__IMiracastReceiverStreamControl")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStreamControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStreamControl := IMiracastReceiverStreamControl(outPtr)
        }

        return this.__IMiracastReceiverStreamControl.GetVideoStreamSettingsAsync()
    }

    /**
     * Suggests an appropriate width, height and bitrate to the Miracast Transmitter.
     * @remarks
     * An app can call this API when the [MediaPlayerElement](/uwp/api/Windows.UI.Xaml.Controls.MediaPlayerElement) associated with the Miracast content changes. By default, Miracast tries to use a 1920x1080 resolution, or a 4k resolution if supported by the hardware. By asking the transmitter to use a lower resolution, it might be possible to reduce the network bandwidth used. 
     * 
     * The settings passed into the method are suggestions that the transmitter may or may not adopt. To find out the actual values chosen by the receiver, call [GetVideoStreamSettings](miracastreceiverstreamcontrol_getvideostreamsettings_412448218.md).
     * 
     * 
     * This function accesses member variables without locking, so it should be invoked on the UI thread in a call to [CoreDispatcher.RunAsync](/uwp/api/windows.ui.core.coredispatcher.runasync)
     * @param {MiracastReceiverVideoStreamSettings} settings A [MiracastReceiverVideoStreamSettings](miracastreceivervideostreamsettings.md) object representing the suggested settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstreamcontrol.suggestvideostreamsettings
     */
    SuggestVideoStreamSettings(settings) {
        if (!this.HasProp("__IMiracastReceiverStreamControl")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStreamControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStreamControl := IMiracastReceiverStreamControl(outPtr)
        }

        return this.__IMiracastReceiverStreamControl.SuggestVideoStreamSettings(settings)
    }

    /**
     * Asynchronously suggests an appropriate width, height and bitrate to the Miracast Transmitter.
     * @remarks
     * An app can call this API when the [MediaPlayerElement](/uwp/api/Windows.UI.Xaml.Controls.MediaPlayerElement) associated with the Miracast content changes. By default, Miracast tries to use a 1920x1080 resolution, or a 4k resolution if supported by the hardware. By asking the transmitter to use a lower resolution, it might be possible to reduce the network bandwidth used. 
     * 
     * The settings passed into the method are suggestions that the transmitter may or may not adopt. To find out the actual values chosen by the receiver, call [GetVideoStreamSettingsAsync](miracastreceiverstreamcontrol_getvideostreamsettingsasync_709470693.md).
     * 
     * 
     * This function accesses member variables without locking, so it should be invoked on the UI thread in a call to [CoreDispatcher.RunAsync](/uwp/api/windows.ui.core.coredispatcher.runasync)
     * @param {MiracastReceiverVideoStreamSettings} settings A [MiracastReceiverVideoStreamSettings](miracastreceivervideostreamsettings.md) object representing the suggested settings.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstreamcontrol.suggestvideostreamsettingsasync
     */
    SuggestVideoStreamSettingsAsync(settings) {
        if (!this.HasProp("__IMiracastReceiverStreamControl")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStreamControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStreamControl := IMiracastReceiverStreamControl(outPtr)
        }

        return this.__IMiracastReceiverStreamControl.SuggestVideoStreamSettingsAsync(settings)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MuteAudio() {
        if (!this.HasProp("__IMiracastReceiverStreamControl")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStreamControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStreamControl := IMiracastReceiverStreamControl(outPtr)
        }

        return this.__IMiracastReceiverStreamControl.get_MuteAudio()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MuteAudio(value) {
        if (!this.HasProp("__IMiracastReceiverStreamControl")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStreamControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStreamControl := IMiracastReceiverStreamControl(outPtr)
        }

        return this.__IMiracastReceiverStreamControl.put_MuteAudio(value)
    }

;@endregion Instance Methods
}
