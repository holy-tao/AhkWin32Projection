#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IInputScope.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information related to the data provided by an input method.
 * @remarks
 * > [!NOTE]
 * > An input method (or Input Method Editor (IME)) specifies how data, such as keyboard strokes, mouse movements, or speech dictation is recognized as input. This provides users with the ability to specify characters and symbols that are not displayed on their input devices. For example, languages that have more graphemes (a unit of text displayed as a single character) than there are keys on the keyboard.
 * 
 * The input scope indicates the expected input so that the XAML framework can display an appropriately formatted touch keyboard (or Soft Input Panel (SIP)). The input scope does not perform any validation, and does not prevent the user from providing any input through a hardware keyboard or otherwise.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inputscope
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class InputScope extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputScope

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputScope.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection of valid [InputScopeName](inputscopename.md) items that are relevant to this [InputScope](inputscope.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inputscope.names
     * @type {IVector<InputScopeName>} 
     */
    Names {
        get => this.get_Names()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [InputScope](inputscope.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.InputScope")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<InputScopeName>} 
     */
    get_Names() {
        if (!this.HasProp("__IInputScope")) {
            if ((queryResult := this.QueryInterface(IInputScope.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputScope := IInputScope(outPtr)
        }

        return this.__IInputScope.get_Names()
    }

;@endregion Instance Methods
}
