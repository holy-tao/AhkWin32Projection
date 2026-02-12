#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataCue.ahk
#Include .\IMediaCue.ahk
#Include .\IDataCue2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a data cue that can be included in a [TimedMetadataTrack](timedmetadatatrack.md).
 * @remarks
 * A **DataCue** can be added to a [TimedMetadataTrack](timedmetadatatrack.md) with the [AddCue](timedmetadatatrack_addcue_1989081881.md) method. When the cue's start time is reached, the [CueEntered](timedmetadatatrack_cueentered.md) event is raised and you can use the [MediaCueEventArgs](mediacueeventargs.md) passed into the handler to get a copy of the **DataCue**. The [Data](datacue_data.md) property of **DataCue** is an [IBuffer](../windows.storage.streams/ibuffer.md) that can contain any type of data. If you want to display text when the cue is encountered, the [TimedTextCue](timedtextcue.md) class is provided for this scenario.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.datacue
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class DataCue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataCue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataCue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data associated with the cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.datacue.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets the start time of the cue.
     * @remarks
     * When a cue's start time is reached, the [TimedMetadataTrack.CueEntered](timedmetadatatrack_cueentered.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.datacue.starttime
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets or sets the duration of the cue.
     * @remarks
     * At the end of a cue's duration, the [TimedMetadataTrack.CueExited](timedmetadatatrack_cueexited.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.datacue.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets the identifier for the data cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.datacue.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets the collection of custom properties associated with the data cue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.datacue.properties
     * @type {PropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DataCue](datacue.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.DataCue")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IDataCue")) {
            if ((queryResult := this.QueryInterface(IDataCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataCue := IDataCue(outPtr)
        }

        return this.__IDataCue.put_Data(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IDataCue")) {
            if ((queryResult := this.QueryInterface(IDataCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataCue := IDataCue(outPtr)
        }

        return this.__IDataCue.get_Data()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.put_StartTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTime() {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.get_StartTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.put_Duration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.get_Duration()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IMediaCue")) {
            if ((queryResult := this.QueryInterface(IMediaCue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCue := IMediaCue(outPtr)
        }

        return this.__IMediaCue.get_Id()
    }

    /**
     * 
     * @returns {PropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IDataCue2")) {
            if ((queryResult := this.QueryInterface(IDataCue2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataCue2 := IDataCue2(outPtr)
        }

        return this.__IDataCue2.get_Properties()
    }

;@endregion Instance Methods
}
