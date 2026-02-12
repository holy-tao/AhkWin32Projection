#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioStreamDescriptor.ahk
#Include .\IMediaStreamDescriptor.ahk
#Include .\IAudioStreamDescriptor2.ahk
#Include .\IMediaStreamDescriptor2.ahk
#Include .\IAudioStreamDescriptor3.ahk
#Include .\IAudioStreamDescriptorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a description an audio media stream.
 * @remarks
 * When creating a [MediaEncodingProfile](../windows.media.mediaproperties/mediaencodingprofile.md), call [SetAudioTracks](../windows.media.mediaproperties/mediaencodingprofile_setaudiotracks_1151007226.md), passing in one or more **AudioStreamDescriptor** objects to provide information about the audio tracks to be encoded.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class AudioStreamDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioStreamDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioStreamDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [AudioStreamDescriptor](audiostreamdescriptor.md) class using the specified [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md).
     * @param {AudioEncodingProperties} encodingProperties The encoding properties for the audio stream. This includes information such as the sample rate and channel count of the stream.
     * @returns {AudioStreamDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.#ctor
     */
    static Create(encodingProperties) {
        if (!AudioStreamDescriptor.HasProp("__IAudioStreamDescriptorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.AudioStreamDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioStreamDescriptorFactory.IID)
            AudioStreamDescriptor.__IAudioStreamDescriptorFactory := IAudioStreamDescriptorFactory(factoryPtr)
        }

        return AudioStreamDescriptor.__IAudioStreamDescriptorFactory.Create(encodingProperties)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object describing the encoding properties for the audio stream. These properties include the sample rate and channel count of the audio.
     * @remarks
     * The application can change the encoding properties of the audio stream descriptor at any time.
     * 
     * If the media pipeline cannot handle the new encoding properties, a [MediaStreamSource](mediastreamsource.md) will raise the [Closed](mediastreamsource_closed.md) event which provides information regarding the error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.encodingproperties
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets a value indicating whether the stream is currently in use by a [MediaStreamSource](mediastreamsource.md).
     * @remarks
     * [IsSelected](videostreamdescriptor_isselected.md) is **true** if the stream represented by the stream descriptor is currently selected by the media pipeline. For example, if it is currently in use by a [MediaStreamSource](mediastreamsource.md). Otherwise, the value is **false**.
     * 
     * [MediaStreamSource](mediastreamsource.md) only raises the [SampleRequested](mediastreamsource_samplerequested.md) event for streams which are selected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets or sets the name of the stream.
     * @remarks
     * The initial value is an empty string.
     * 
     * The name is a free-form human readable string that describes the stream, for example, “English soundtrack”.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the RFC-1766 language code for the stream.
     * @remarks
     * The initial value is an empty string.
     * 
     * The language is specified using a RFC-1766 language code, for example, “en-US”.
     * 
     * For more info on RFC-1766 language tags, see the [RFC-1766 specification](https://tools.ietf.org/html/rfc1766).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the number of samples inserted at the beginning of the audio stream by the encoder as padding. Use this property to explicitly set the padding size the system will use to implement gapless playback for the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.leadingencoderpadding
     * @type {IReference<Integer>} 
     */
    LeadingEncoderPadding {
        get => this.get_LeadingEncoderPadding()
        set => this.put_LeadingEncoderPadding(value)
    }

    /**
     * Gets or sets the number of samples inserted at the end of the audio stream by the encoder as padding. Use this property to explicitly set the padding size the system will use to implement gapless playback for the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.trailingencoderpadding
     * @type {IReference<Integer>} 
     */
    TrailingEncoderPadding {
        get => this.get_TrailingEncoderPadding()
        set => this.put_TrailingEncoderPadding(value)
    }

    /**
     * Gets or sets an app-defined label that identifies an audio stream in a [MediaEncodingProfile](/uwp/api/Windows.Media.MediaProperties.MediaEncodingProfile) that contains multiple streams.
     * @remarks
     * The label for each stream in a single **MediaEncodingProfile** must be unique. Calling [SetAudioTracks](/uwp/api/windows.media.mediaproperties.mediaencodingprofile#Windows_Media_MediaProperties_MediaEncodingProfile_SetAudioTracks_Windows_Foundation_Collections_IIterable_Windows_Media_Core_AudioStreamDescriptor__) to add a stream descriptor containing a duplicate label will result in an invalid argument error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_EncodingProperties() {
        if (!this.HasProp("__IAudioStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IAudioStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStreamDescriptor := IAudioStreamDescriptor(outPtr)
        }

        return this.__IAudioStreamDescriptor.get_EncodingProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.get_IsSelected()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.put_Language(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.get_Language()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_LeadingEncoderPadding(value) {
        if (!this.HasProp("__IAudioStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IAudioStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStreamDescriptor2 := IAudioStreamDescriptor2(outPtr)
        }

        return this.__IAudioStreamDescriptor2.put_LeadingEncoderPadding(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LeadingEncoderPadding() {
        if (!this.HasProp("__IAudioStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IAudioStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStreamDescriptor2 := IAudioStreamDescriptor2(outPtr)
        }

        return this.__IAudioStreamDescriptor2.get_LeadingEncoderPadding()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_TrailingEncoderPadding(value) {
        if (!this.HasProp("__IAudioStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IAudioStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStreamDescriptor2 := IAudioStreamDescriptor2(outPtr)
        }

        return this.__IAudioStreamDescriptor2.put_TrailingEncoderPadding(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TrailingEncoderPadding() {
        if (!this.HasProp("__IAudioStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IAudioStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStreamDescriptor2 := IAudioStreamDescriptor2(outPtr)
        }

        return this.__IAudioStreamDescriptor2.get_TrailingEncoderPadding()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IMediaStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor2 := IMediaStreamDescriptor2(outPtr)
        }

        return this.__IMediaStreamDescriptor2.put_Label(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IMediaStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor2 := IMediaStreamDescriptor2(outPtr)
        }

        return this.__IMediaStreamDescriptor2.get_Label()
    }

    /**
     * Creates a copy of the [AudioStreamDescriptor](audiostreamdescriptor.md).
     * @returns {AudioStreamDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.audiostreamdescriptor.copy
     */
    Copy() {
        if (!this.HasProp("__IAudioStreamDescriptor3")) {
            if ((queryResult := this.QueryInterface(IAudioStreamDescriptor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioStreamDescriptor3 := IAudioStreamDescriptor3(outPtr)
        }

        return this.__IAudioStreamDescriptor3.Copy()
    }

;@endregion Instance Methods
}
