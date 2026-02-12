#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the AppWindow.Closed event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowclosedeventargs
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowClosedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowClosedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowClosedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates how the closing of the app window was initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowclosedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IAppWindowClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppWindowClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowClosedEventArgs := IAppWindowClosedEventArgs(outPtr)
        }

        return this.__IAppWindowClosedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
