#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioTrackSupportInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides support information for an [AudioTrack](audiotrack.md). This information includes the status of the audio decoder, information about any audio degradation applied by the decoder, and the status of the [MediaSource](mediasource.md) with which the audio track is associated.
 * @remarks
 * If a failure occurs when an [AudioTrack](audiotrack.md) is opened, you can get detailed status and failure information by handling the [OpenFailed](audiotrack_openfailed.md) event and checking the [SupportInfo](audiotrack_supportinfo.md) property of the **AudioTrack** passed into the event as the sender.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotracksupportinfo
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class AudioTrackSupportInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioTrackSupportInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioTrackSupportInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the audio decoder that is decoding the [AudioTrack](audiotrack.md), including whether the encoding for the audio track is fully or partially supported and whether the decoder will degrade the audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotracksupportinfo.decoderstatus
     * @type {Integer} 
     */
    DecoderStatus {
        get => this.get_DecoderStatus()
    }

    /**
     * Gets a value indicating the type of degradation, if any, that is applied to the [AudioTrack](audiotrack.md) by the audio decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotracksupportinfo.degradation
     * @type {Integer} 
     */
    Degradation {
        get => this.get_Degradation()
    }

    /**
     * Gets a value indicating the reason that the audio decoder is degrading the [AudioTrack](audiotrackopenfailedeventargs.md), if the audio is degraded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotracksupportinfo.degradationreason
     * @type {Integer} 
     */
    DegradationReason {
        get => this.get_DegradationReason()
    }

    /**
     * Gets the status of the [MediaSource](mediasource.md) with which the [AudioTrack](audiotrack.md) is associated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiotracksupportinfo.mediasourcestatus
     * @type {Integer} 
     */
    MediaSourceStatus {
        get => this.get_MediaSourceStatus()
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
    get_DecoderStatus() {
        if (!this.HasProp("__IAudioTrackSupportInfo")) {
            if ((queryResult := this.QueryInterface(IAudioTrackSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrackSupportInfo := IAudioTrackSupportInfo(outPtr)
        }

        return this.__IAudioTrackSupportInfo.get_DecoderStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Degradation() {
        if (!this.HasProp("__IAudioTrackSupportInfo")) {
            if ((queryResult := this.QueryInterface(IAudioTrackSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrackSupportInfo := IAudioTrackSupportInfo(outPtr)
        }

        return this.__IAudioTrackSupportInfo.get_Degradation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DegradationReason() {
        if (!this.HasProp("__IAudioTrackSupportInfo")) {
            if ((queryResult := this.QueryInterface(IAudioTrackSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrackSupportInfo := IAudioTrackSupportInfo(outPtr)
        }

        return this.__IAudioTrackSupportInfo.get_DegradationReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSourceStatus() {
        if (!this.HasProp("__IAudioTrackSupportInfo")) {
            if ((queryResult := this.QueryInterface(IAudioTrackSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioTrackSupportInfo := IAudioTrackSupportInfo(outPtr)
        }

        return this.__IAudioTrackSupportInfo.get_MediaSourceStatus()
    }

;@endregion Instance Methods
}
