#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IInputScopeName.ahk
#Include .\IInputScopeNameFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Identifies a particular named input scope that is relevant to an overall [InputScope](inputscope.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inputscopename
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class InputScopeName extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputScopeName

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputScopeName.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [InputScopeName](inputscopename.md) class, using an input name based on the [InputScopeNameValue](inputscopenamevalue.md) enumeration.
     * @param {Integer} nameValue An input name based on the [InputScopeNameValue](inputscopenamevalue.md) enumeration.
     * @returns {InputScopeName} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inputscopename.#ctor
     */
    static CreateInstance(nameValue) {
        if (!InputScopeName.HasProp("__IInputScopeNameFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.InputScopeName")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInputScopeNameFactory.IID)
            InputScopeName.__IInputScopeNameFactory := IInputScopeNameFactory(factoryPtr)
        }

        return InputScopeName.__IInputScopeNameFactory.CreateInstance(nameValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the specific input scope name value for this [InputScopeName](inputscopename.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inputscopename.namevalue
     * @type {Integer} 
     */
    NameValue {
        get => this.get_NameValue()
        set => this.put_NameValue(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [InputScopeName](inputscopename.md) class with no initial value.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.InputScopeName")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NameValue() {
        if (!this.HasProp("__IInputScopeName")) {
            if ((queryResult := this.QueryInterface(IInputScopeName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputScopeName := IInputScopeName(outPtr)
        }

        return this.__IInputScopeName.get_NameValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NameValue(value) {
        if (!this.HasProp("__IInputScopeName")) {
            if ((queryResult := this.QueryInterface(IInputScopeName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputScopeName := IInputScopeName(outPtr)
        }

        return this.__IInputScopeName.put_NameValue(value)
    }

;@endregion Instance Methods
}
