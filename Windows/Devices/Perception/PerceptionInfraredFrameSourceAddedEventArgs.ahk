#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionInfraredFrameSourceAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for infrared frame source added events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourceaddedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionInfraredFrameSourceAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionInfraredFrameSourceAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionInfraredFrameSourceAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the infrared frame source that was added.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourceaddedeventargs.framesource
     * @type {PerceptionInfraredFrameSource} 
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
     * @returns {PerceptionInfraredFrameSource} 
     */
    get_FrameSource() {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceAddedEventArgs := IPerceptionInfraredFrameSourceAddedEventArgs(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceAddedEventArgs.get_FrameSource()
    }

;@endregion Instance Methods
}
