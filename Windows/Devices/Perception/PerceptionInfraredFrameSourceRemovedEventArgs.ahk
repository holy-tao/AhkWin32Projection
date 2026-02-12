#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionInfraredFrameSourceRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for infrared frame source removed events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourceremovedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionInfraredFrameSourceRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionInfraredFrameSourceRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionInfraredFrameSourceRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the infrared frame source that was removed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourceremovedeventargs.framesource
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
        if (!this.HasProp("__IPerceptionInfraredFrameSourceRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceRemovedEventArgs := IPerceptionInfraredFrameSourceRemovedEventArgs(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceRemovedEventArgs.get_FrameSource()
    }

;@endregion Instance Methods
}
