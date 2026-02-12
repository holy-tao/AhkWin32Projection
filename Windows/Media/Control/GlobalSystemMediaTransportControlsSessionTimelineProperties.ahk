#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalSystemMediaTransportControlsSessionTimelineProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the timeline state of the session (Position, seek ranges etc.).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSessionTimelineProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalSystemMediaTransportControlsSessionTimelineProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The starting timestamp of the current media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties.starttime
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * The end timestamp of the current media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties.endtime
     * @type {TimeSpan} 
     */
    EndTime {
        get => this.get_EndTime()
    }

    /**
     * The earliest timestamp at which the current media item can currently seek to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties.minseektime
     * @type {TimeSpan} 
     */
    MinSeekTime {
        get => this.get_MinSeekTime()
    }

    /**
     * The furthest timestamp at which the content can currently seek to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties.maxseektime
     * @type {TimeSpan} 
     */
    MaxSeekTime {
        get => this.get_MaxSeekTime()
    }

    /**
     * The playback position, current as of LastUpdatedTime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The UTC time at which the timeline properties were last updated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessiontimelineproperties.lastupdatedtime
     * @type {DateTime} 
     */
    LastUpdatedTime {
        get => this.get_LastUpdatedTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTime() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionTimelineProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties := IGlobalSystemMediaTransportControlsSessionTimelineProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties.get_StartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EndTime() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionTimelineProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties := IGlobalSystemMediaTransportControlsSessionTimelineProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties.get_EndTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinSeekTime() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionTimelineProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties := IGlobalSystemMediaTransportControlsSessionTimelineProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties.get_MinSeekTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxSeekTime() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionTimelineProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties := IGlobalSystemMediaTransportControlsSessionTimelineProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties.get_MaxSeekTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionTimelineProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties := IGlobalSystemMediaTransportControlsSessionTimelineProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties.get_Position()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdatedTime() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionTimelineProperties")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionTimelineProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties := IGlobalSystemMediaTransportControlsSessionTimelineProperties(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionTimelineProperties.get_LastUpdatedTime()
    }

;@endregion Instance Methods
}
