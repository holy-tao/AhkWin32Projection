#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioEncodingProperties.ahk
#Include .\IMediaEncodingProperties.ahk
#Include .\IAudioEncodingPropertiesWithFormatUserData.ahk
#Include .\IAudioEncodingProperties2.ahk
#Include .\IAudioEncodingProperties3.ahk
#Include .\IAudioEncodingPropertiesStatics.ahk
#Include .\IAudioEncodingPropertiesStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the encoding properties of an audio stream.
 * @remarks
 * The encoding quality **Auto** is a special preset that fills in the proper settings based on the current camera settings. Settings that are manually modified are ignored. For example, if you create a preset profile using one of the static create methods, such as [CreateWav](mediaencodingprofile_createwav_1267537239.md), and specify **Auto** as the encoding quality, any changes you make to the properties will be overwritten with values based on the current camera settings.
 * 
 * > [!NOTE]
 * > It is possible to create an **AudioEncodingProperties** that is not supported on a particular device. For example, you may successfully call [CreateMp3](audioencodingproperties_createmp3_946859991.md), but if an mp3 encoder is not present on the device, attempting to encode audio with the properties returned from this method will fail. For a list of the codecs present by default for each device family, see [Supported codecs.](/windows/uwp/audio-video-camera/supported-codecs).
 * 
 * For how-to guidance for setting the encoding properties for captured audio, see [Basic photo, video, and audio capture with MediaCapture](/windows/uwp/audio-video-camera/basic-photo-video-and-audio-capture-with-mediacapture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class AudioEncodingProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioEncodingProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioEncodingProperties.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for Advanced Audio Coding (AAC) audio.
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitrate The audio bit rate.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createaac
     */
    static CreateAac(sampleRate, channelCount, bitrate) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics := IAudioEncodingPropertiesStatics(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics.CreateAac(sampleRate, channelCount, bitrate)
    }

    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for Advanced Audio Coding (AAC) audio in Audio Data Transport Stream (ADTS) format.
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitrate The audio bit rate.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createaacadts
     */
    static CreateAacAdts(sampleRate, channelCount, bitrate) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics := IAudioEncodingPropertiesStatics(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics.CreateAacAdts(sampleRate, channelCount, bitrate)
    }

    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for MPEG Audio Layer-3 (MP3) audio.
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitrate The audio bit rate.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createmp3
     */
    static CreateMp3(sampleRate, channelCount, bitrate) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics := IAudioEncodingPropertiesStatics(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics.CreateMp3(sampleRate, channelCount, bitrate)
    }

    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for Pulse Code Modulation (PCM) audio.
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitsPerSample The audio bit depth.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createpcm
     */
    static CreatePcm(sampleRate, channelCount, bitsPerSample) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics := IAudioEncodingPropertiesStatics(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics.CreatePcm(sampleRate, channelCount, bitsPerSample)
    }

    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for Windows Media Audio (WMA).
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitrate The audio bit rate.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createwma
     */
    static CreateWma(sampleRate, channelCount, bitrate) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics := IAudioEncodingPropertiesStatics(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics.CreateWma(sampleRate, channelCount, bitrate)
    }

    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for Apple Lossless Audio Codec (ALAC) audio.
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitsPerSample The number of bits per sample.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createalac
     */
    static CreateAlac(sampleRate, channelCount, bitsPerSample) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics2.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics2 := IAudioEncodingPropertiesStatics2(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics2.CreateAlac(sampleRate, channelCount, bitsPerSample)
    }

    /**
     * Creates an instance of [AudioEncodingProperties](audioencodingproperties.md) for Free Lossless Audio Codec (FLAC) audio.
     * @param {Integer} sampleRate The audio sampling rate.
     * @param {Integer} channelCount The number of audio channels.
     * @param {Integer} bitsPerSample The number of bits per sample.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.createflac
     */
    static CreateFlac(sampleRate, channelCount, bitsPerSample) {
        if (!AudioEncodingProperties.HasProp("__IAudioEncodingPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEncodingPropertiesStatics2.IID)
            AudioEncodingProperties.__IAudioEncodingPropertiesStatics2 := IAudioEncodingPropertiesStatics2(factoryPtr)
        }

        return AudioEncodingProperties.__IAudioEncodingPropertiesStatics2.CreateFlac(sampleRate, channelCount, bitsPerSample)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the audio bit rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.bitrate
     * @type {Integer} 
     */
    Bitrate {
        get => this.get_Bitrate()
        set => this.put_Bitrate(value)
    }

    /**
     * Gets or sets the number of audio channels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.channelcount
     * @type {Integer} 
     */
    ChannelCount {
        get => this.get_ChannelCount()
        set => this.put_ChannelCount(value)
    }

    /**
     * Gets or sets audio sampling rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.samplerate
     * @type {Integer} 
     */
    SampleRate {
        get => this.get_SampleRate()
        set => this.put_SampleRate(value)
    }

    /**
     * Gets or sets the number of bits per audio sample.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.bitspersample
     * @type {Integer} 
     */
    BitsPerSample {
        get => this.get_BitsPerSample()
        set => this.put_BitsPerSample(value)
    }

    /**
     * Gets additional format properties for the audio stream.
     * @remarks
     * For information on working with a property set collection, see [PropertySet](../windows.foundation.collections/propertyset.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.properties
     * @type {MediaPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the format type.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the subtype of the format.
     * @remarks
     * The value can be the string representation of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in canonical form, or one of the predefined values listed in the following table.<table>
     *    <tr><th>Value</th><th>Description</th></tr>
     *    <tr><td>"AAC"</td><td>Advanced Audio Coding (AAC). The stream can contain either raw AAC data or AAC data in an Audio Data Transport Stream (ADTS) stream.</td></tr>
     *    <tr><td>"AC3"</td><td>Dolby Digital audio (AC-3).</td></tr>
     *    <tr><td>"AACADTS"</td><td>Advanced Audio Coding (AAC) audio in Audio Data Transport Stream (ADTS) format.</td></tr>
     *    <tr><td>"AACHDCP"</td><td>AAC in High-Bandwidth Digital Content Protection (HDCP) format.</td></tr>
     *    <tr><td>"AC3"</td><td>Dolby AC3</td></tr>
     *    <tr><td>"AC3SPDIF"</td><td>Dolby AC-3 audio over Sony/Philips Digital Interface (S/PDIF).</td></tr>
     *    <tr><td>"AC3HDCP"</td><td>Dolby AC-3 in High-Bandwidth Digital Content Protection (HDCP) format.</td></tr>
     *    <tr><td>"ADTS"</td><td>Audio Data Transport Stream</td></tr>
     *    <tr><td>"ALAC"</td><td>Apple Lossless Audio Codec</td></tr>
     *    <tr><td>"AMRNB"</td><td>Adaptive Multi-Rate audio codec (AMR-NB)</td></tr>
     *    <tr><td>"AWRWB"</td><td>Adaptive Multi-Rate Wideband audio codec (AMR-WB)</td></tr>
     *    <tr><td>"DTS"</td><td>Digital Theater Systems (DTS)</td></tr>
     *    <tr><td>"EAC3"</td><td>Dolby Digital Plus audio (E-AC-3).</td></tr>
     *    <tr><td>"FLAC"</td><td>Free Lossless Audio Codec</td></tr>
     *    <tr><td>"Float"</td><td>Uncompressed 32-bit float PCM audio.</td></tr>
     *    <tr><td>"MP3"</td><td>MPEG Audio Layer-3 (MP3).</td></tr>
     *    <tr><td>"MPEG"</td><td>MPEG-1 audio payload.</td></tr>
     *    <tr><td>"OPUS"</td><td>Opus</td></tr>
     *    <tr><td>"PCM"</td><td>Uncompressed 16-bit PCM audio.</td></tr>
     *    <tr><td>"WMA8"</td><td>Windows Media Audio 8 codec, Windows Media Audio 9 codec, or Windows Media Audio 9.1 codec.</td></tr>
     *    <tr><td>"WMA9"</td><td>Windows Media Audio 9 Professional codec or Windows Media Audio 9.1 Professional codec.</td></tr>
     *    <tr><td>"Vorbis"</td><td>Vorbis codec</td></tr>
     * </table>
     * 
     * > [!WARNING]
     * > The string values returned by the [MediaEncodingSubtypes](mediaencodingsubtypes.md) properties may not use the same letter casing as AudioEncodingProperties.Subtype, [VideoEncodingProperties.Subtype](videoencodingproperties_subtype.md), [ContainerEncodingProperties.Subtype](containerencodingproperties_subtype.md), and [ImageEncodingProperties.Subtype](imageencodingproperties_subtype.md). For this reason, if you compare the values, you should use a case-insensitive comparison or use hardcoded strings that match the casing returned by the encoding properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
        set => this.put_Subtype(value)
    }

    /**
     * Gets a value indicating whether the audio is encoded with spatial audio information.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.isspatial
     * @type {Boolean} 
     */
    IsSpatial {
        get => this.get_IsSpatial()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [AudioEncodingProperties](audioencodingproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.AudioEncodingProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Bitrate(value) {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.put_Bitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bitrate() {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.get_Bitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ChannelCount(value) {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.put_ChannelCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChannelCount() {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.get_ChannelCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SampleRate(value) {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.put_SampleRate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SampleRate() {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.get_SampleRate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BitsPerSample(value) {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.put_BitsPerSample(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerSample() {
        if (!this.HasProp("__IAudioEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties := IAudioEncodingProperties(outPtr)
        }

        return this.__IAudioEncodingProperties.get_BitsPerSample()
    }

    /**
     * 
     * @returns {MediaPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Type()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtype(value) {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.put_Subtype(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtype() {
        if (!this.HasProp("__IMediaEncodingProperties")) {
            if ((queryResult := this.QueryInterface(IMediaEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaEncodingProperties := IMediaEncodingProperties(outPtr)
        }

        return this.__IMediaEncodingProperties.get_Subtype()
    }

    /**
     * Sets the media format user data.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The media data to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.setformatuserdata
     */
    SetFormatUserData(value_length, value) {
        if (!this.HasProp("__IAudioEncodingPropertiesWithFormatUserData")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingPropertiesWithFormatUserData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingPropertiesWithFormatUserData := IAudioEncodingPropertiesWithFormatUserData(outPtr)
        }

        return this.__IAudioEncodingPropertiesWithFormatUserData.SetFormatUserData(value_length, value)
    }

    /**
     * Gets the media format user data.
     * @param {Pointer<Byte>} value Receives the media format data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.getformatuserdata
     */
    GetFormatUserData(value) {
        if (!this.HasProp("__IAudioEncodingPropertiesWithFormatUserData")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingPropertiesWithFormatUserData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingPropertiesWithFormatUserData := IAudioEncodingPropertiesWithFormatUserData(outPtr)
        }

        return this.__IAudioEncodingPropertiesWithFormatUserData.GetFormatUserData(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSpatial() {
        if (!this.HasProp("__IAudioEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties2 := IAudioEncodingProperties2(outPtr)
        }

        return this.__IAudioEncodingProperties2.get_IsSpatial()
    }

    /**
     * Creates a copy of the **AudioEncodingProperties** object.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingproperties.copy
     */
    Copy() {
        if (!this.HasProp("__IAudioEncodingProperties3")) {
            if ((queryResult := this.QueryInterface(IAudioEncodingProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEncodingProperties3 := IAudioEncodingProperties3(outPtr)
        }

        return this.__IAudioEncodingProperties3.Copy()
    }

;@endregion Instance Methods
}
