#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedMetadataEncodingProperties.ahk
#Include .\IMediaEncodingProperties.ahk
#Include .\ITimedMetadataEncodingPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the encoding properties of a timed metadata stream. Timed metadata streams are used to encode data that is neither audio or video. For example, a media file may contain a video stream and a timed metadata stream containing GPS coordinates correlated to the video.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class TimedMetadataEncodingProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedMetadataEncodingProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedMetadataEncodingProperties.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [TimedMetadataEncodingProperties](timedmetadataencodingproperties.md) for the Presentation Graphic Stream (PGS) format.
     * @returns {TimedMetadataEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.createpgs
     */
    static CreatePgs() {
        if (!TimedMetadataEncodingProperties.HasProp("__ITimedMetadataEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.TimedMetadataEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedMetadataEncodingPropertiesStatics.IID)
            TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics := ITimedMetadataEncodingPropertiesStatics(factoryPtr)
        }

        return TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics.CreatePgs()
    }

    /**
     * Creates an instance of [TimedMetadataEncodingProperties](timedmetadataencodingproperties.md) for the SubRip Text (SRT) format.
     * @returns {TimedMetadataEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.createsrt
     */
    static CreateSrt() {
        if (!TimedMetadataEncodingProperties.HasProp("__ITimedMetadataEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.TimedMetadataEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedMetadataEncodingPropertiesStatics.IID)
            TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics := ITimedMetadataEncodingPropertiesStatics(factoryPtr)
        }

        return TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics.CreateSrt()
    }

    /**
     * Creates an instance of [TimedMetadataEncodingProperties](timedmetadataencodingproperties.md) for the SubStation Alpha Text (SSA) format.
     * @param {Integer} formatUserData_length 
     * @param {Pointer<Integer>} formatUserData Format-defined user data.  For more information, see [SubstationAlpha](https://en.wikipedia.org/wiki/SubStation_Alpha).
     * @returns {TimedMetadataEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.createssa
     */
    static CreateSsa(formatUserData_length, formatUserData) {
        if (!TimedMetadataEncodingProperties.HasProp("__ITimedMetadataEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.TimedMetadataEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedMetadataEncodingPropertiesStatics.IID)
            TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics := ITimedMetadataEncodingPropertiesStatics(factoryPtr)
        }

        return TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics.CreateSsa(formatUserData_length, formatUserData)
    }

    /**
     * Creates an instance of [TimedMetadataEncodingProperties](timedmetadataencodingproperties.md) for the VobSub format.
     * @param {Integer} formatUserData_length 
     * @param {Pointer<Integer>} formatUserData Format-defined user data. For more information, see [DirectVobSub](https://en.wikipedia.org/wiki/DirectVobSub).
     * @returns {TimedMetadataEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.createvobsub
     */
    static CreateVobSub(formatUserData_length, formatUserData) {
        if (!TimedMetadataEncodingProperties.HasProp("__ITimedMetadataEncodingPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.TimedMetadataEncodingProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimedMetadataEncodingPropertiesStatics.IID)
            TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics := ITimedMetadataEncodingPropertiesStatics(factoryPtr)
        }

        return TimedMetadataEncodingProperties.__ITimedMetadataEncodingPropertiesStatics.CreateVobSub(formatUserData_length, formatUserData)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets additional format properties for the timed metadata stream.
     * @remarks
     * For information on working with a property set collection, see [PropertySet](../windows.foundation.collections/propertyset.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.properties
     * @type {MediaPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets a string specifying the format type of the typed metadata.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a string specifying the format subtype of the typed metadata.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
        set => this.put_Subtype(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [TimedMetadataEncodingProperties](timedmetadataencodingproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.TimedMetadataEncodingProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Sets information about the metadata encoding that is specific to the format type.
     * @remarks
     * For MP4 files, the format specific data is stored in the SampleDescription box (stsd).
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value A byte array containing format-specific encoding information.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.setformatuserdata
     */
    SetFormatUserData(value_length, value) {
        if (!this.HasProp("__ITimedMetadataEncodingProperties")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataEncodingProperties := ITimedMetadataEncodingProperties(outPtr)
        }

        return this.__ITimedMetadataEncodingProperties.SetFormatUserData(value_length, value)
    }

    /**
     * Gets information about the metadata encoding that is specific to the format type.
     * @remarks
     * For MP4 files, the format specific data is stored in the SampleDescription box (stsd).
     * @param {Pointer<Byte>} value A byte array containing format-specific encoding information.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.getformatuserdata
     */
    GetFormatUserData(value) {
        if (!this.HasProp("__ITimedMetadataEncodingProperties")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataEncodingProperties := ITimedMetadataEncodingProperties(outPtr)
        }

        return this.__ITimedMetadataEncodingProperties.GetFormatUserData(value)
    }

    /**
     * Creates a copy of the **TimedMetadataEncodingProperties** object.
     * @returns {TimedMetadataEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.timedmetadataencodingproperties.copy
     */
    Copy() {
        if (!this.HasProp("__ITimedMetadataEncodingProperties")) {
            if ((queryResult := this.QueryInterface(ITimedMetadataEncodingProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedMetadataEncodingProperties := ITimedMetadataEncodingProperties(outPtr)
        }

        return this.__ITimedMetadataEncodingProperties.Copy()
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

;@endregion Instance Methods
}
