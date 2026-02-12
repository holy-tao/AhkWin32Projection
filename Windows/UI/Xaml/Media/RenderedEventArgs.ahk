#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRenderedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [Rendered](compositiontarget_rendered.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.renderedeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RenderedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRenderedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRenderedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the duration of the time it took to render the most recent frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.renderedeventargs.frameduration
     * @type {TimeSpan} 
     */
    FrameDuration {
        get => this.get_FrameDuration()
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
    get_FrameDuration() {
        if (!this.HasProp("__IRenderedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRenderedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderedEventArgs := IRenderedEventArgs(outPtr)
        }

        return this.__IRenderedEventArgs.get_FrameDuration()
    }

;@endregion Instance Methods
}
