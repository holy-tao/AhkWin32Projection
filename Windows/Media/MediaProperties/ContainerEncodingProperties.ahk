#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContainerEncodingProperties.ahk
#Include .\IMediaEncodingProperties.ahk
#Include .\IContainerEncodingProperties2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a media container format.
 * @remarks
 * Media files usually contain at least some of the following elements: 
 * + File headers that describe the number of streams, the format of each stream, and so on.
 * + An index that enables random access to the content.
 * + Metadata that describes the content (for example, the artist or title).
 * 
 * The term *media container* describes the entire package of media data, file headers, indexes, and metadata. The reason for using the term *container* rather than *file* is that some container formats are designed for live broadcast. A container might be generated in real time, without ever being stored as a file.
 * 
 * An early example of a media container is the AVI file format. Other examples include MP4 and Advanced Systems Format (ASF). Containers can be identified by file name extension (for example, ".mp4") or by MIME type.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.containerencodingproperties
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class ContainerEncodingProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContainerEncodingProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContainerEncodingProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets additional format properties for the media container.
     * @remarks
     * For information on working with a property set collection, see [PropertySet](../windows.foundation.collections/propertyset.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.containerencodingproperties.properties
     * @type {MediaPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the format type.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.containerencodingproperties.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the subtype of the media container.
     * @remarks
     * The value can be the string representation of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in canonical form, or one of the predefined values listed in the following table.
     * 
     * | Subtype | GUID |  
     * |--------------|------------|
     * |ASF          |430f6f6e-b6bf-4fc1-a0bd-9ee46eee2afb | 
     * |MP3          |e438b912-83f1-4de6-9e3a-9ffbc6dd24d1 |
     * |MPEG4        |dc6cd05d-b9d0-40ef-bd35-fa622c1ab28a |
     * |AVI          |7edfe8af-402f-4d76-a33c-619fd157d0f1 |
     * |MPEG2        |bfc2dbf9-7bb4-4f8f-afde-e112c44ba882 |
     * |WAVE         |64c3453c-0f26-4741-be63-87bdf8bb935b |
     * |AACADTS      |132fd27d-0f02-43de-a301-38fbbbb3834e |
     * |ADTS         |132fd27d-0f02-43de-a301-38fbbbb3834e |
     * |3GP          |34c50167-4472-4f34-9ea0-c49fbacf037d |
     * |AMR          |025d5ad3-621a-475b-964d-66b1c824f079 |
     * |FLAC         |31344aa3-05a9-42b5-901b-8e9d4257f75e |
     * 
     * 
     * 
     * 
     * > [!WARNING]
     * > The string values returned by the [MediaEncodingSubtypes](mediaencodingsubtypes.md) properties may not use the same letter casing as [AudioEncodingProperties.Subtype](audioencodingproperties_subtype.md), [VideoEncodingProperties.Subtype](videoencodingproperties_subtype.md), ContainerEncodingProperties.Subtype, and [ImageEncodingProperties.Subtype](imediaencodingproperties_subtype.md). For this reason, if you compare the values, you should use a case-insensitive comparison or use hardcoded strings that match the casing returned by the encoding properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.containerencodingproperties.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
        set => this.put_Subtype(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [ContainerEncodingProperties](containerencodingproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.ContainerEncodingProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
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
     * Creates a copy of the **ContainerEncodingProperties** object.
     * @returns {ContainerEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.containerencodingproperties.copy
     */
    Copy() {
        if (!this.HasProp("__IContainerEncodingProperties2")) {
            if ((queryResult := this.QueryInterface(IContainerEncodingProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerEncodingProperties2 := IContainerEncodingProperties2(outPtr)
        }

        return this.__IContainerEncodingProperties2.Copy()
    }

;@endregion Instance Methods
}
