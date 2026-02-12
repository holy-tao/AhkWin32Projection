#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [OnWindowCreated](application_onwindowcreated_1983609380.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.windowcreatedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class WindowCreatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowCreatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowCreatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the window that was created.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.windowcreatedeventargs.window
     * @type {Window} 
     */
    Window {
        get => this.get_Window()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Window} 
     */
    get_Window() {
        if (!this.HasProp("__IWindowCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowCreatedEventArgs := IWindowCreatedEventArgs(outPtr)
        }

        return this.__IWindowCreatedEventArgs.get_Window()
    }

;@endregion Instance Methods
}
