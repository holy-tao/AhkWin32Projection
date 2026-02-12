#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVisibilityChangedEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the arguments returned by the event fired when a [CoreWindow](corewindow.md) instance's visibility changes.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.visibilitychangedeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class VisibilityChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisibilityChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisibilityChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the window is visible or not.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.visibilitychangedeventargs.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * Gets or sets a value indicating whether the [VisibilityChanged](corewindow_visibilitychanged.md) event was handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.visibilitychangedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__IVisibilityChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisibilityChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisibilityChangedEventArgs := IVisibilityChangedEventArgs(outPtr)
        }

        return this.__IVisibilityChangedEventArgs.get_Visible()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
