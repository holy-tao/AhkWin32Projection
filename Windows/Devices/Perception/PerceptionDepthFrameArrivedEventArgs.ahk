#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionDepthFrameArrivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a depth frame arrived event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframearrivedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionDepthFrameArrivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionDepthFrameArrivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionDepthFrameArrivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the relative time of this frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframearrivedeventargs.relativetime
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
        if (!this.HasProp("__IPerceptionDepthFrameArrivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameArrivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameArrivedEventArgs := IPerceptionDepthFrameArrivedEventArgs(outPtr)
        }

        return this.__IPerceptionDepthFrameArrivedEventArgs.get_RelativeTime()
    }

    /**
     * Attempts to open the depth frame that has arrived. Existing frames should be closed before opening new frames. If an app has three or more frames still open when this method is called, TryOpenFrame will fail.
     * @returns {PerceptionDepthFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframearrivedeventargs.tryopenframe
     */
    TryOpenFrame() {
        if (!this.HasProp("__IPerceptionDepthFrameArrivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameArrivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameArrivedEventArgs := IPerceptionDepthFrameArrivedEventArgs(outPtr)
        }

        return this.__IPerceptionDepthFrameArrivedEventArgs.TryOpenFrame()
    }

;@endregion Instance Methods
}
