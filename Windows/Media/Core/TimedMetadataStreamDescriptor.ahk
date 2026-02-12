#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedMetadataStreamDescriptor.ahk
#Include .\IMediaStreamDescriptor2.ahk
#Include .\IMediaStreamDescriptor.ahk
#Include .\ITimedMetadataStreamDescriptorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a description a timed metada media stream.
 * @remarks
 * This object is the parallel to [VideoStreamDescriptor](videostreamdescriptor.md) and [AudioStreamDescriptor](audiostreamdescriptor.md), but is used for streams that contain arbitrary data. An example usage of this type of stream would be to encode a stream of GPS coordinates that are captured simulataneously with a video stream.
 * 
 * When creating a [MediaEncodingProfile](../windows.media.mediaproperties/mediaencodingprofile.md), call [SetVideoTracks](../windows.media.mediaproperties/mediaencodingprofile_setvideotracks_1424215491.md), passing in one or more **VideoStreamDescriptor** objects to provide information about the video tracks to be encoded.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedMetadataStreamDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedMetadataStreamDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedMetadataStreamDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [TimedMetadataStreamDescriptor](timedmetadatastreamdescriptor.md) class using the specified [TimedMetadataEncodingProperties](../windows.media.mediaproperties/timedmetadataencodingproperties.md).
     * @param {TimedMetadataEncodingProperties} encodingProperties The encoding properties for the timed metadata stream.
     * @returns {TimedMetadataStreamDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.#ctor
     */
    static Create(encodingProperties) {
        if (!TimedMetadataStreamDescriptor.HasProp("__ITimedMetadataStreamDescriptorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedMetadataStreamDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedMetadataStreamDescriptorFactory.IID)
            TimedMetadataStreamDescriptor.__ITimedMetadataStreamDescriptorFactory := ITimedMetadataStreamDescriptorFactory(factoryPtr)
        }

        return TimedMetadataStreamDescriptor.__ITimedMetadataStreamDescriptorFactory.Create(encodingProperties)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object describing the encoding properties for the timed metadata stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.encodingproperties
     * @type {TimedMetadataEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets or sets an app-defined label that identifies a timed metadata stream in a [MediaEncodingProfile](/uwp/api/Windows.Media.MediaProperties.MediaEncodingProfile) that contains multiple streams.
     * @remarks
     * The label for each stream in a single **MediaEncodingProfile** must be unique. Calling [SetTimedMetadataTracks](../windows.media.mediaproperties/mediaencodingprofile_settimedmetadatatracks_484361839.md) to add a stream descriptor containing a duplicate label will result in an invalid argument error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets a value indicating whether the stream is currently in use by a [MediaStreamSource](mediastreamsource.md).
     * @remarks
     * [IsSelected](videostreamdescriptor_isselected.md) is **true** if the stream represented by the stream descriptor is currently selected by the media pipeline. For example, if it is currently in use by a [MediaStreamSource](mediastreamsource.md). Otherwise, the value is **false**.
     * 
     * [MediaStreamSource](mediastreamsource.md) only raises the [SampleRequested](mediastreamsource_samplerequested.md) event for streams which are selected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.isselected
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
     * The name is a free-form human readable string that describes the stream, for example, “GPS data”.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.name
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimedMetadataEncodingProperties} 
     */
    get_EncodingProperties() {
        if (!this.HasProp("__ITimedMetadataStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataStreamDescriptor := ITimedMetadataStreamDescriptor(outPtr)
        }

        return this.__ITimedMetadataStreamDescriptor.get_EncodingProperties()
    }

    /**
     * Creates a copy of the [TimedMetadataStreamDescriptor](timedmetadatastreamdescriptor.md).
     * @returns {TimedMetadataStreamDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedmetadatastreamdescriptor.copy
     */
    Copy() {
        if (!this.HasProp("__ITimedMetadataStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataStreamDescriptor := ITimedMetadataStreamDescriptor(outPtr)
        }

        return this.__ITimedMetadataStreamDescriptor.Copy()
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

;@endregion Instance Methods
}
