#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IContextMenuEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the **ContextMenuOpening** event that exists on several text-related UI elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contextmenueventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContextMenuEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContextMenuEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContextMenuEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contextmenueventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the pixel offset of the text cursor horizontal position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contextmenueventargs.cursorleft
     * @type {Float} 
     */
    CursorLeft {
        get => this.get_CursorLeft()
    }

    /**
     * Gets the pixel offset of the text cursor vertical position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contextmenueventargs.cursortop
     * @type {Float} 
     */
    CursorTop {
        get => this.get_CursorTop()
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
    get_Handled() {
        if (!this.HasProp("__IContextMenuEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextMenuEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextMenuEventArgs := IContextMenuEventArgs(outPtr)
        }

        return this.__IContextMenuEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IContextMenuEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextMenuEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextMenuEventArgs := IContextMenuEventArgs(outPtr)
        }

        return this.__IContextMenuEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CursorLeft() {
        if (!this.HasProp("__IContextMenuEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextMenuEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextMenuEventArgs := IContextMenuEventArgs(outPtr)
        }

        return this.__IContextMenuEventArgs.get_CursorLeft()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CursorTop() {
        if (!this.HasProp("__IContextMenuEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextMenuEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextMenuEventArgs := IContextMenuEventArgs(outPtr)
        }

        return this.__IContextMenuEventArgs.get_CursorTop()
    }

;@endregion Instance Methods
}
