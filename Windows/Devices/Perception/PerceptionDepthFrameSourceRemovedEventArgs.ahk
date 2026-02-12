#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionDepthFrameSourceRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for depth frame source removed events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframesourceremovedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionDepthFrameSourceRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionDepthFrameSourceRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionDepthFrameSourceRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the depth frame source that was removed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframesourceremovedeventargs.framesource
     * @type {PerceptionDepthFrameSource} 
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
     * @returns {PerceptionDepthFrameSource} 
     */
    get_FrameSource() {
        if (!this.HasProp("__IPerceptionDepthFrameSourceRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceRemovedEventArgs := IPerceptionDepthFrameSourceRemovedEventArgs(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceRemovedEventArgs.get_FrameSource()
    }

;@endregion Instance Methods
}
