#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoTrackSupportInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides support information for a [VideoTrack](videotrack.md). This information includes the status of the video decoder and the status of the [MediaSource](mediasource.md) with which the video track is associated.
 * @remarks
 * If a failure occurs when a [VideoTrack](videotrack.md) is opened, you can get detailed status and failure information by handling the [OpenFailed](videotrack_openfailed.md) event and checking the [SupportInfo](videotrack_supportinfo.md) property of the **VideoTrack** passed into the event as the sender.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotracksupportinfo
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoTrackSupportInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoTrackSupportInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoTrackSupportInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the video decoder that is decoding the [VideoTrack](videotrack.md), including whether the encoding for the video track is fully or partially supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotracksupportinfo.decoderstatus
     * @type {Integer} 
     */
    DecoderStatus {
        get => this.get_DecoderStatus()
    }

    /**
     * Gets the status of the [MediaSource](mediasource.md) with which the [VideoTrack](videotrack.md) is associated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videotracksupportinfo.mediasourcestatus
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
        if (!this.HasProp("__IVideoTrackSupportInfo")) {
            if ((queryResult := this.QueryInterface(IVideoTrackSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrackSupportInfo := IVideoTrackSupportInfo(outPtr)
        }

        return this.__IVideoTrackSupportInfo.get_DecoderStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSourceStatus() {
        if (!this.HasProp("__IVideoTrackSupportInfo")) {
            if ((queryResult := this.QueryInterface(IVideoTrackSupportInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTrackSupportInfo := IVideoTrackSupportInfo(outPtr)
        }

        return this.__IVideoTrackSupportInfo.get_MediaSourceStatus()
    }

;@endregion Instance Methods
}
