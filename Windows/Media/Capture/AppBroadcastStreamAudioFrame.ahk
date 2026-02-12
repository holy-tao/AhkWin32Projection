#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastStreamAudioFrame.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a frame of audio samples in a broadcast stream.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by calling [AppBroadcastStreamReader.TryGetNextAudioFrame](appbroadcaststreamreader_trygetnextaudioframe_1561983342.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioframe
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamAudioFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastStreamAudioFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastStreamAudioFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that contains metadata about the associated broadcast audio frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioframe.audioheader
     * @type {AppBroadcastStreamAudioHeader} 
     */
    AudioHeader {
        get => this.get_AudioHeader()
    }

    /**
     * Gets the buffer containing the audio samples for the broadcast audio frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioframe.audiobuffer
     * @type {IBuffer} 
     */
    AudioBuffer {
        get => this.get_AudioBuffer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppBroadcastStreamAudioHeader} 
     */
    get_AudioHeader() {
        if (!this.HasProp("__IAppBroadcastStreamAudioFrame")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioFrame := IAppBroadcastStreamAudioFrame(outPtr)
        }

        return this.__IAppBroadcastStreamAudioFrame.get_AudioHeader()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AudioBuffer() {
        if (!this.HasProp("__IAppBroadcastStreamAudioFrame")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioFrame := IAppBroadcastStreamAudioFrame(outPtr)
        }

        return this.__IAppBroadcastStreamAudioFrame.get_AudioBuffer()
    }

;@endregion Instance Methods
}
