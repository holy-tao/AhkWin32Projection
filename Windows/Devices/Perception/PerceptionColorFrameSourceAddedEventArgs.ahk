#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionColorFrameSourceAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for color frame source added events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourceaddedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionColorFrameSourceAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionColorFrameSourceAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionColorFrameSourceAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the color frame source that was added.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourceaddedeventargs.framesource
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
        if (!this.HasProp("__IPerceptionColorFrameSourceAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceAddedEventArgs := IPerceptionColorFrameSourceAddedEventArgs(outPtr)
        }

        return this.__IPerceptionColorFrameSourceAddedEventArgs.get_FrameSource()
    }

;@endregion Instance Methods
}
