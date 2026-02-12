#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTranscoder.ahk
#Include .\IMediaTranscoder2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Transcodes audio and video files.
 * @remarks
 * For how-to guidance on transcoding media files, see [Transcode media files](/windows/uwp/audio-video-camera/transcode-media-files).
 * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class MediaTranscoder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTranscoder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTranscoder.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the time interval to trim from the start of the output.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.trimstarttime
     * @type {TimeSpan} 
     */
    TrimStartTime {
        get => this.get_TrimStartTime()
        set => this.put_TrimStartTime(value)
    }

    /**
     * Gets or sets the time interval to trim from the end of the output.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.trimstoptime
     * @type {TimeSpan} 
     */
    TrimStopTime {
        get => this.get_TrimStopTime()
        set => this.put_TrimStopTime(value)
    }

    /**
     * Specifies whether the media transcoder always re-encodes the source.
     * @remarks
     * If this property is **false**, the media transcoder remuxes the source without re-encoding, when possible. If the property is **true**, the media transcoder always re-encodes the source. The default value is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.alwaysreencode
     * @type {Boolean} 
     */
    AlwaysReencode {
        get => this.get_AlwaysReencode()
        set => this.put_AlwaysReencode(value)
    }

    /**
     * Specifies whether hardware acceleration is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.hardwareaccelerationenabled
     * @type {Boolean} 
     */
    HardwareAccelerationEnabled {
        get => this.get_HardwareAccelerationEnabled()
        set => this.put_HardwareAccelerationEnabled(value)
    }

    /**
     * Gets or sets the video processing algorithm which will be used for transcoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.videoprocessingalgorithm
     * @type {Integer} 
     */
    VideoProcessingAlgorithm {
        get => this.get_VideoProcessingAlgorithm()
        set => this.put_VideoProcessingAlgorithm(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [MediaTranscoder](mediatranscoder.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Transcoding.MediaTranscoder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimStartTime(value) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.put_TrimStartTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimStartTime() {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.get_TrimStartTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimStopTime(value) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.put_TrimStopTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimStopTime() {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.get_TrimStopTime()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysReencode(value) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.put_AlwaysReencode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysReencode() {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.get_AlwaysReencode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HardwareAccelerationEnabled(value) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.put_HardwareAccelerationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HardwareAccelerationEnabled() {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.get_HardwareAccelerationEnabled()
    }

    /**
     * Adds the specified audio effect.
     * @param {HSTRING} activatableClassId The identifier of the audio effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.addaudioeffect
     */
    AddAudioEffect(activatableClassId) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.AddAudioEffect(activatableClassId)
    }

    /**
     * Adds the specified audio effect with configuration properties, and indicates whether the effect is required.
     * @param {HSTRING} activatableClassId The identifier of the audio effect.
     * @param {Boolean} effectRequired Indicates whether the audio effect is required.
     * @param {IPropertySet} configuration Configuration properties for the audio effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.addaudioeffect
     */
    AddAudioEffectWithSettings(activatableClassId, effectRequired, configuration) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.AddAudioEffectWithSettings(activatableClassId, effectRequired, configuration)
    }

    /**
     * Adds the specified video effect.
     * @param {HSTRING} activatableClassId The identifier of the video effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.addvideoeffect
     */
    AddVideoEffect(activatableClassId) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.AddVideoEffect(activatableClassId)
    }

    /**
     * Adds the specified video effect with configuration properties and indicates whether the effect is required.
     * @param {HSTRING} activatableClassId The identifier of the video effect.
     * @param {Boolean} effectRequired Indicates whether the video effect is required.
     * @param {IPropertySet} configuration Configuration properties for the video effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.addvideoeffect
     */
    AddVideoEffectWithSettings(activatableClassId, effectRequired, configuration) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.AddVideoEffectWithSettings(activatableClassId, effectRequired, configuration)
    }

    /**
     * Removes all audio and video effects from the transcode session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.cleareffects
     */
    ClearEffects() {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.ClearEffects()
    }

    /**
     * Asynchronously initializes the trancode operation on the specified file and returns a [PrepareTranscodeResult](preparetranscoderesult.md) object which can be used to start the transcode operation.
     * @param {IStorageFile} source The source file.
     * @param {IStorageFile} destination The destination file.
     * @param {MediaEncodingProfile} profile_ The profile to use for the operation.
     * @returns {IAsyncOperation<PrepareTranscodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.preparefiletranscodeasync
     */
    PrepareFileTranscodeAsync(source, destination, profile_) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.PrepareFileTranscodeAsync(source, destination, profile_)
    }

    /**
     * Asynchronously initializes the trancode operation on the specified stream and returns a [PrepareTranscodeResult](preparetranscoderesult.md) object which can be used to start the transcode operation.
     * @remarks
     * The *source* parameter cannot be a [InMemoryRandomAccessStream](../windows.storage.streams/inmemoryrandomaccessstream.md) or other writeable stream.
     * @param {IRandomAccessStream} source The source stream.
     * 
     * *source* cannot be a [InMemoryRandomAccessStream](../windows.storage.streams/inmemoryrandomaccessstream.md) or other writeable stream.
     * @param {IRandomAccessStream} destination The destination stream.
     * @param {MediaEncodingProfile} profile_ The profile to use for the operation.
     * @returns {IAsyncOperation<PrepareTranscodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.preparestreamtranscodeasync
     */
    PrepareStreamTranscodeAsync(source, destination, profile_) {
        if (!this.HasProp("__IMediaTranscoder")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder := IMediaTranscoder(outPtr)
        }

        return this.__IMediaTranscoder.PrepareStreamTranscodeAsync(source, destination, profile_)
    }

    /**
     * Asynchronously initializes the trancode operation on the specified media source and returns a [PrepareTranscodeResult](preparetranscoderesult.md) object which can be used to start the transcode operation.
     * @param {IMediaSource} source The media source to perform the transcode operation on.
     * @param {IRandomAccessStream} destination The destination stream for the transcoded media data.
     * @param {MediaEncodingProfile} profile_ The profile to use for the operation.
     * @returns {IAsyncOperation<PrepareTranscodeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediatranscoder.preparemediastreamsourcetranscodeasync
     */
    PrepareMediaStreamSourceTranscodeAsync(source, destination, profile_) {
        if (!this.HasProp("__IMediaTranscoder2")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder2 := IMediaTranscoder2(outPtr)
        }

        return this.__IMediaTranscoder2.PrepareMediaStreamSourceTranscodeAsync(source, destination, profile_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoProcessingAlgorithm(value) {
        if (!this.HasProp("__IMediaTranscoder2")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder2 := IMediaTranscoder2(outPtr)
        }

        return this.__IMediaTranscoder2.put_VideoProcessingAlgorithm(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoProcessingAlgorithm() {
        if (!this.HasProp("__IMediaTranscoder2")) {
            if ((queryResult := this.QueryInterface(IMediaTranscoder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTranscoder2 := IMediaTranscoder2(outPtr)
        }

        return this.__IMediaTranscoder2.get_VideoProcessingAlgorithm()
    }

;@endregion Instance Methods
}
