#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionInfraredFrameArrivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a infrared frame arrived event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframearrivedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionInfraredFrameArrivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionInfraredFrameArrivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionInfraredFrameArrivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the relative time of this frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframearrivedeventargs.relativetime
     * @type {TimeSpan} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
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
    get_RelativeTime() {
        if (!this.HasProp("__IPerceptionInfraredFrameArrivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameArrivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameArrivedEventArgs := IPerceptionInfraredFrameArrivedEventArgs(outPtr)
        }

        return this.__IPerceptionInfraredFrameArrivedEventArgs.get_RelativeTime()
    }

    /**
     * Attempts to open the infrared frame that has arrived.
     * @remarks
     * Existing frames should be closed before opening new frames. If an app has three or more frames still open when this method is called, TryOpenFrame will fail.
     * @returns {PerceptionInfraredFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframearrivedeventargs.tryopenframe
     */
    TryOpenFrame() {
        if (!this.HasProp("__IPerceptionInfraredFrameArrivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameArrivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameArrivedEventArgs := IPerceptionInfraredFrameArrivedEventArgs(outPtr)
        }

        return this.__IPerceptionInfraredFrameArrivedEventArgs.TryOpenFrame()
    }

;@endregion Instance Methods
}
