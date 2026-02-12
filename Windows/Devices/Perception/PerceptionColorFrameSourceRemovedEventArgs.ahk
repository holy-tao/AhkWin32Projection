#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionColorFrameSourceRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for color frame source added events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourceremovedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionColorFrameSourceRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionColorFrameSourceRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionColorFrameSourceRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the color frame source that was removed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourceremovedeventargs.framesource
     * @type {PerceptionColorFrameSource} 
     */
    FrameSource {
        get => this.get_FrameSource()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PerceptionColorFrameSource} 
     */
    get_FrameSource() {
        if (!this.HasProp("__IPerceptionColorFrameSourceRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceRemovedEventArgs := IPerceptionColorFrameSourceRemovedEventArgs(outPtr)
        }

        return this.__IPerceptionColorFrameSourceRemovedEventArgs.get_FrameSource()
    }

;@endregion Instance Methods
}
