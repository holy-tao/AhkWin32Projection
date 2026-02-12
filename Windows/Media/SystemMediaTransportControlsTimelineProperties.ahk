#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMediaTransportControlsTimelineProperties.ahk
#Include ..\..\Guid.ahk

/**
 * Represents timeline properties of the [SystemMediaTransportControls](systemmediatransportcontrols.md). Pass an instance of this class to the [UpdateTimelineProperties](systemmediatransportcontrols_updatetimelineproperties_1933562266.md) method to update the properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolstimelineproperties
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControlsTimelineProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMediaTransportControlsTimelineProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMediaTransportControlsTimelineProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value representing the start time of the currently playing media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolstimelineproperties.starttime
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Gets or sets a value representing the end time of the currently playing media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolstimelineproperties.endtime
     * @type {TimeSpan} 
     */
    EndTime {
        get => this.get_EndTime()
        set => this.put_EndTime(value)
    }

    /**
     * Gets or sets a value indicating the earliest time within the currently playing media item to which the user can seek.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolstimelineproperties.minseektime
     * @type {TimeSpan} 
     */
    MinSeekTime {
        get => this.get_MinSeekTime()
        set => this.put_MinSeekTime(value)
    }

    /**
     * Gets or sets a value indicating the latest time within the currently playing media item to which the user can seek.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolstimelineproperties.maxseektime
     * @type {TimeSpan} 
     */
    MaxSeekTime {
        get => this.get_MaxSeekTime()
        set => this.put_MaxSeekTime(value)
    }

    /**
     * Gets or sets a value representing the current playback position within the currently playing media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolstimelineproperties.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SystemMediaTransportControlsTimelineProperties](systemmediatransportcontrolstimelineproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.SystemMediaTransportControlsTimelineProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTime() {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.get_StartTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.put_StartTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EndTime() {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.get_EndTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_EndTime(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.put_EndTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinSeekTime() {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.get_MinSeekTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MinSeekTime(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.put_MinSeekTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxSeekTime() {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.get_MaxSeekTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MaxSeekTime(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.put_MaxSeekTime(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.get_Position()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__ISystemMediaTransportControlsTimelineProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsTimelineProperties := ISystemMediaTransportControlsTimelineProperties(outPtr)
        }

        return this.__ISystemMediaTransportControlsTimelineProperties.put_Position(value)
    }

;@endregion Instance Methods
}
