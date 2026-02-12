#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrepareTranscodeResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an asynchronous media transcode deferral operation which can be used to start the transcode operation.
 * @remarks
 * This object is not instantiated directly. It is returned in a call to [prepareFileTranscodeAsync](mediatranscoder_preparefiletranscodeasync_704917623.md), [prepareStreamTranscodeAsync](mediatranscoder_preparestreamtranscodeasync_318469178.md), and [PrepareMediaStreamSourceTranscodeAsync](mediatranscoder_preparemediastreamsourcetranscodeasync_1018386378.md).
 * 
 * For how-to guidance on transcoding media files, see [Transcode media files](/windows/uwp/audio-video-camera/transcode-media-files).
 * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.preparetranscoderesult
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class PrepareTranscodeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrepareTranscodeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrepareTranscodeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the trancode operation can be performed successfully.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.preparetranscoderesult.cantranscode
     * @type {Boolean} 
     */
    CanTranscode {
        get => this.get_CanTranscode()
    }

    /**
     * Specifies the reason for the transcode failure.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.preparetranscoderesult.failurereason
     * @type {Integer} 
     */
    FailureReason {
        get => this.get_FailureReason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTranscode() {
        if (!this.HasProp("__IPrepareTranscodeResult")) {
            if ((queryResult := this.QueryInterface(IPrepareTranscodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrepareTranscodeResult := IPrepareTranscodeResult(outPtr)
        }

        return this.__IPrepareTranscodeResult.get_CanTranscode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FailureReason() {
        if (!this.HasProp("__IPrepareTranscodeResult")) {
            if ((queryResult := this.QueryInterface(IPrepareTranscodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrepareTranscodeResult := IPrepareTranscodeResult(outPtr)
        }

        return this.__IPrepareTranscodeResult.get_FailureReason()
    }

    /**
     * Creates an object to perform an asynchronous media transcode operation on media data.
     * @returns {IAsyncActionWithProgress<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.preparetranscoderesult.transcodeasync
     */
    TranscodeAsync() {
        if (!this.HasProp("__IPrepareTranscodeResult")) {
            if ((queryResult := this.QueryInterface(IPrepareTranscodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrepareTranscodeResult := IPrepareTranscodeResult(outPtr)
        }

        return this.__IPrepareTranscodeResult.TranscodeAsync()
    }

;@endregion Instance Methods
}
