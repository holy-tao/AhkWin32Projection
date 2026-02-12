#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessKeyboardAcceleratorEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ProcessKeyboardAccelerators](../windows.ui.xaml/uielement_processkeyboardaccelerators.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.processkeyboardacceleratoreventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ProcessKeyboardAcceleratorEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessKeyboardAcceleratorEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessKeyboardAcceleratorEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the virtual key (used in conjunction with one or more modifier keys) for a keyboard shortcut (accelerator).
     * 
     * A keyboard shortcut is invoked when the modifier keys asssociated with the shortcut are pressed and then the non-modifier key is pressed at the same time. For example, Ctrl+C for copy and Ctrl+S for save.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.processkeyboardacceleratoreventargs.key
     * @type {Integer} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * Gets the virtual key used to modify another keypress for a keyboard shortcut (accelerator). 
     * 
     * A keyboard shortcut is invoked when the modifier keys asssociated with the shortcut are pressed and then the non-modifier key is pressed at the same time. For example, Ctrl+C for copy and Ctrl+S for save.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.processkeyboardacceleratoreventargs.modifiers
     * @type {Integer} 
     */
    Modifiers {
        get => this.get_Modifiers()
    }

    /**
     * Gets or sets a value that marks the event as handled.
     * @remarks
     * The keyboard accelerator event bubbles from the element that has the focus to the root Window element. If the event isn't handled, the framework looks for other accelerators outside of the bubbling path using a table of global accelerators. All accelerators are registered as global unless scoped using [ScopeOwner](keyboardaccelerator_scopeowner.md).
     * 
     * Scoped accelerators are invoked only if focus is inside a specific scope. For example, in a Grid that contains many controls, the accelerator can be associated with a control scoped to the Grid (the Grid is the [ScopeOwner](keyboardaccelerator_scopeowner.md)). In this case, the root element is the Grid.
     * 
     * If two accelerators are defined with the same key combination, the first accelerator found in the table is invoked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.processkeyboardacceleratoreventargs.handled
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
     * @returns {Integer} 
     */
    get_Key() {
        if (!this.HasProp("__IProcessKeyboardAcceleratorEventArgs")) {
            if ((queryResult := this.QueryInterface(IProcessKeyboardAcceleratorEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessKeyboardAcceleratorEventArgs := IProcessKeyboardAcceleratorEventArgs(outPtr)
        }

        return this.__IProcessKeyboardAcceleratorEventArgs.get_Key()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Modifiers() {
        if (!this.HasProp("__IProcessKeyboardAcceleratorEventArgs")) {
            if ((queryResult := this.QueryInterface(IProcessKeyboardAcceleratorEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessKeyboardAcceleratorEventArgs := IProcessKeyboardAcceleratorEventArgs(outPtr)
        }

        return this.__IProcessKeyboardAcceleratorEventArgs.get_Modifiers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IProcessKeyboardAcceleratorEventArgs")) {
            if ((queryResult := this.QueryInterface(IProcessKeyboardAcceleratorEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessKeyboardAcceleratorEventArgs := IProcessKeyboardAcceleratorEventArgs(outPtr)
        }

        return this.__IProcessKeyboardAcceleratorEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IProcessKeyboardAcceleratorEventArgs")) {
            if ((queryResult := this.QueryInterface(IProcessKeyboardAcceleratorEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessKeyboardAcceleratorEventArgs := IProcessKeyboardAcceleratorEventArgs(outPtr)
        }

        return this.__IProcessKeyboardAcceleratorEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
