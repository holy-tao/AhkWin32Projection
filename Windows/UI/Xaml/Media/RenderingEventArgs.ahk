#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRenderingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [Rendering](compositiontarget_rendering.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.renderingeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RenderingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRenderingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRenderingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time when the frame rendered, for timing purposes
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.renderingeventargs.renderingtime
     * @type {TimeSpan} 
     */
    RenderingTime {
        get => this.get_RenderingTime()
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
    get_RenderingTime() {
        if (!this.HasProp("__IRenderingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRenderingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderingEventArgs := IRenderingEventArgs(outPtr)
        }

        return this.__IRenderingEventArgs.get_RenderingTime()
    }

;@endregion Instance Methods
}
