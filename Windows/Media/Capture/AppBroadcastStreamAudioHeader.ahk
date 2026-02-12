#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastStreamAudioHeader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides metadata about a broadcast audio frame.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by accessing the [AudioHeader](appbroadcaststreamaudioframe_audioheader.md) property of an [AppBroadcastStreamAudioFrame](appbroadcaststreamaudioframe.md) object obtained from a call to [AppBroadcastStreamReader.TryGetNextAudioFrame](appbroadcaststreamreader_trygetnextaudioframe_1561983342.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioheader
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamAudioHeader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastStreamAudioHeader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastStreamAudioHeader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a time stamp indicating the system time at which the audio frame was captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioheader.absolutetimestamp
     * @type {DateTime} 
     */
    AbsoluteTimestamp {
        get => this.get_AbsoluteTimestamp()
    }

    /**
     * Gets a time stamp indicating the relative time within the audio stream at which the audio frame was captured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioheader.relativetimestamp
     * @type {TimeSpan} 
     */
    RelativeTimestamp {
        get => this.get_RelativeTimestamp()
    }

    /**
     * Gets a value indicating the duration of the audio frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioheader.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets a value indicating whether the audio frame contains a discontinuity in the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioheader.hasdiscontinuity
     * @type {Boolean} 
     */
    HasDiscontinuity {
        get => this.get_HasDiscontinuity()
    }

    /**
     * Gets a value that identifies the audio frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamaudioheader.frameid
     * @type {Integer} 
     */
    FrameId {
        get => this.get_FrameId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_AbsoluteTimestamp() {
        if (!this.HasProp("__IAppBroadcastStreamAudioHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioHeader := IAppBroadcastStreamAudioHeader(outPtr)
        }

        return this.__IAppBroadcastStreamAudioHeader.get_AbsoluteTimestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RelativeTimestamp() {
        if (!this.HasProp("__IAppBroadcastStreamAudioHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioHeader := IAppBroadcastStreamAudioHeader(outPtr)
        }

        return this.__IAppBroadcastStreamAudioHeader.get_RelativeTimestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppBroadcastStreamAudioHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioHeader := IAppBroadcastStreamAudioHeader(outPtr)
        }

        return this.__IAppBroadcastStreamAudioHeader.get_Duration()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasDiscontinuity() {
        if (!this.HasProp("__IAppBroadcastStreamAudioHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioHeader := IAppBroadcastStreamAudioHeader(outPtr)
        }

        return this.__IAppBroadcastStreamAudioHeader.get_HasDiscontinuity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameId() {
        if (!this.HasProp("__IAppBroadcastStreamAudioHeader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamAudioHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamAudioHeader := IAppBroadcastStreamAudioHeader(outPtr)
        }

        return this.__IAppBroadcastStreamAudioHeader.get_FrameId()
    }

;@endregion Instance Methods
}
