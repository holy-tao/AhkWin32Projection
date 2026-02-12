#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IKeyboardAccelerator.ahk
#Include .\IKeyboardAcceleratorStatics.ahk
#Include .\IKeyboardAcceleratorFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\KeyboardAccelerator.ahk
#Include .\KeyboardAcceleratorInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a keyboard shortcut (or accelerator) that lets a user perform an action using the keyboard instead of navigating the app UI (directly or through access keys).
  * 
  * Accelerators are typically assigned to buttons or menu items.
 * @remarks
 * An accelerator key can be a single key, such as F1 - F12 and Esc, or a combination of keys (Ctrl + Shift + B, or Ctrl C) that invoke a command. They differ from access keys (mnemonics), which are typically modified with the Alt key and simply activate a command or control.
 * 
 * An accelerator can be executed even if the element associated with the accelerator is not visible. For example, an item in the [SecondaryCommands](../windows.ui.xaml.controls/commandbar_secondarycommands.md) collection of the [CommandBar](../windows.ui.xaml.controls/commandbar.md) can be invoked using an accelerator without expanding the overflow menu and displaying the element.
 * 
 * By default, an accelerator has global scope. However, you can constrain scope using [ScopeOwner](keyboardaccelerator_scopeowner.md) or disable an accelerator completely using [IsEnabled](keyboardaccelerator_isenabled.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class KeyboardAccelerator extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyboardAccelerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyboardAccelerator.IID

    /**
     * Identifies the [Key](keyboardaccelerator_key.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.keyproperty
     * @type {DependencyProperty} 
     */
    static KeyProperty {
        get => KeyboardAccelerator.get_KeyProperty()
    }

    /**
     * Identifies the [Modifiers](keyboardaccelerator_modifiers.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.modifiersproperty
     * @type {DependencyProperty} 
     */
    static ModifiersProperty {
        get => KeyboardAccelerator.get_ModifiersProperty()
    }

    /**
     * Identifies the [IsEnabled](keyboardaccelerator_isenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.isenabledproperty
     * @type {DependencyProperty} 
     */
    static IsEnabledProperty {
        get => KeyboardAccelerator.get_IsEnabledProperty()
    }

    /**
     * Identifies the [ScopeOwner](keyboardaccelerator_scopeowner.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.scopeownerproperty
     * @type {DependencyProperty} 
     */
    static ScopeOwnerProperty {
        get => KeyboardAccelerator.get_ScopeOwnerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyProperty() {
        if (!KeyboardAccelerator.HasProp("__IKeyboardAcceleratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.KeyboardAccelerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyboardAcceleratorStatics.IID)
            KeyboardAccelerator.__IKeyboardAcceleratorStatics := IKeyboardAcceleratorStatics(factoryPtr)
        }

        return KeyboardAccelerator.__IKeyboardAcceleratorStatics.get_KeyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ModifiersProperty() {
        if (!KeyboardAccelerator.HasProp("__IKeyboardAcceleratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.KeyboardAccelerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyboardAcceleratorStatics.IID)
            KeyboardAccelerator.__IKeyboardAcceleratorStatics := IKeyboardAcceleratorStatics(factoryPtr)
        }

        return KeyboardAccelerator.__IKeyboardAcceleratorStatics.get_ModifiersProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsEnabledProperty() {
        if (!KeyboardAccelerator.HasProp("__IKeyboardAcceleratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.KeyboardAccelerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyboardAcceleratorStatics.IID)
            KeyboardAccelerator.__IKeyboardAcceleratorStatics := IKeyboardAcceleratorStatics(factoryPtr)
        }

        return KeyboardAccelerator.__IKeyboardAcceleratorStatics.get_IsEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScopeOwnerProperty() {
        if (!KeyboardAccelerator.HasProp("__IKeyboardAcceleratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.KeyboardAccelerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyboardAcceleratorStatics.IID)
            KeyboardAccelerator.__IKeyboardAcceleratorStatics := IKeyboardAcceleratorStatics(factoryPtr)
        }

        return KeyboardAccelerator.__IKeyboardAcceleratorStatics.get_ScopeOwnerProperty()
    }

    /**
     * 
     * @returns {KeyboardAccelerator} 
     */
    static CreateInstance() {
        if (!KeyboardAccelerator.HasProp("__IKeyboardAcceleratorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.KeyboardAccelerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyboardAcceleratorFactory.IID)
            KeyboardAccelerator.__IKeyboardAcceleratorFactory := IKeyboardAcceleratorFactory(factoryPtr)
        }

        return KeyboardAccelerator.__IKeyboardAcceleratorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the virtual key (used in conjunction with one or more modifier keys) for a keyboard shortcut (accelerator).
     * 
     * A keyboard shortcut is invoked when the modifier keys associated with the shortcut are pressed and then the non-modifier key is pressed at the same time. For example, Ctrl+C for copy and Ctrl+S for save.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.key
     * @type {Integer} 
     */
    Key {
        get => this.get_Key()
        set => this.put_Key(value)
    }

    /**
     * Gets or sets the virtual key used to modify another keypress for a keyboard shortcut (accelerator).
     * 
     * A keyboard shortcut is invoked when the modifier keys associated with the shortcut are pressed and then the non-modifier key is pressed at the same time. For example, Ctrl+C for copy and Ctrl+S for save.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.modifiers
     * @type {Integer} 
     */
    Modifiers {
        get => this.get_Modifiers()
        set => this.put_Modifiers(value)
    }

    /**
     * Gets or sets whether a keyboard shortcut (accelerator) is available to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets the scope (or target) of the keyboard accelerator.
     * @remarks
     * By default, an accelerator has global scope. However, you can constrain scope using ScopeOwner or disable an accelerator completely using [IsEnabled](keyboardaccelerator_isenabled.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardaccelerator.scopeowner
     * @type {DependencyObject} 
     */
    ScopeOwner {
        get => this.get_ScopeOwner()
        set => this.put_ScopeOwner(value)
    }

    /**
     * Occurs when the key combination for this [KeyboardAccelerator](keyboardaccelerator.md) is pressed.
     * @remarks
     * Handle this event to override the default [KeyboardAccelerator](keyboardaccelerator.md) behavior.
     * @type {TypedEventHandler<KeyboardAccelerator, KeyboardAcceleratorInvokedEventArgs>}
    */
    OnInvoked {
        get {
            if(!this.HasProp("__OnInvoked")){
                this.__OnInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f763f3ae-b1eb-5592-a091-d508f32b0b2c}"),
                    KeyboardAccelerator,
                    KeyboardAcceleratorInvokedEventArgs
                )
                this.__OnInvokedToken := this.add_Invoked(this.__OnInvoked.iface)
            }
            return this.__OnInvoked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInvokedToken")) {
            this.remove_Invoked(this.__OnInvokedToken)
            this.__OnInvoked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Key() {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.get_Key()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Key(value) {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.put_Key(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Modifiers() {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.get_Modifiers()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Modifiers(value) {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.put_Modifiers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ScopeOwner() {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.get_ScopeOwner()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ScopeOwner(value) {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.put_ScopeOwner(value)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardAccelerator, KeyboardAcceleratorInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Invoked(handler) {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.add_Invoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Invoked(token) {
        if (!this.HasProp("__IKeyboardAccelerator")) {
            if ((queryResult := this.QueryInterface(IKeyboardAccelerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardAccelerator := IKeyboardAccelerator(outPtr)
        }

        return this.__IKeyboardAccelerator.remove_Invoked(token)
    }

;@endregion Instance Methods
}
