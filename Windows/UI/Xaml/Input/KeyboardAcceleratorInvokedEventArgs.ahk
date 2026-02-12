#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyboardAcceleratorInvokedEventArgs.ahk
#Include .\IKeyboardAcceleratorInvokedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [Invoked](keyboardaccelerator_invoked.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardacceleratorinvokedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class KeyboardAcceleratorInvokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyboardAcceleratorInvokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyboardAcceleratorInvokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the event as handled.
     * @remarks
     * The keyboard accelerator event bubbles from the element that has the focus to the root Window element. If the event isn't handled, the framework looks for other accelerators outside of the bubbling path using a table of global accelerators. All accelerators are registered as global unless scoped using [ScopeOwner](keyboardaccelerator_scopeowner.md).
     * 
     * Scoped accelerators are invoked only if focus is inside a specific scope. For example, in a Grid that contains many controls, the accelerator can be associated with a control scoped to the Grid (the Grid is the [ScopeOwner](keyboardaccelerator_scopeowner.md)). In this case, the root element is the Grid.
     * 
     * If two accelerators are defined with the same key combination, the first accelerator found in the table is invoked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardacceleratorinvokedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the object associated with the [keyboard shortcut (or accelerator)](keyboardaccelerator.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardacceleratorinvokedeventargs.element
     * @type {DependencyObject} 
     */
    Element {
        get => this.get_Element()
    }

    /**
     * Gets the [keyboard shortcut (or accelerator)](keyboardaccelerator.md) object associated with the [Invoked](keyboardaccelerator_invoked.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardacceleratorinvokedeventargs.keyboardaccelerator
     * @type {KeyboardAccelerator} 
     */
    KeyboardAccelerator {
        get => this.get_KeyboardAccelerator()
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
        if (!this.HasProp("__IKeyboardAcceleratorInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyboardAcceleratorInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAcceleratorInvokedEventArgs := IKeyboardAcceleratorInvokedEventArgs(outPtr)
        }

        return this.__IKeyboardAcceleratorInvokedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IKeyboardAcceleratorInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyboardAcceleratorInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAcceleratorInvokedEventArgs := IKeyboardAcceleratorInvokedEventArgs(outPtr)
        }

        return this.__IKeyboardAcceleratorInvokedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_Element() {
        if (!this.HasProp("__IKeyboardAcceleratorInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyboardAcceleratorInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAcceleratorInvokedEventArgs := IKeyboardAcceleratorInvokedEventArgs(outPtr)
        }

        return this.__IKeyboardAcceleratorInvokedEventArgs.get_Element()
    }

    /**
     * 
     * @returns {KeyboardAccelerator} 
     */
    get_KeyboardAccelerator() {
        if (!this.HasProp("__IKeyboardAcceleratorInvokedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IKeyboardAcceleratorInvokedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAcceleratorInvokedEventArgs2 := IKeyboardAcceleratorInvokedEventArgs2(outPtr)
        }

        return this.__IKeyboardAcceleratorInvokedEventArgs2.get_KeyboardAccelerator()
    }

;@endregion Instance Methods
}
