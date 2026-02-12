#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IComboBoxTextSubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data when the user enters custom text into the ComboBox.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.comboboxtextsubmittedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ComboBoxTextSubmittedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBoxTextSubmittedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBoxTextSubmittedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the custom text value entered by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.comboboxtextsubmittedeventargs.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets or sets whether the TextSubmitted event was handled or not. If **true**, the framework will not automatically update the selected item of the ComboBox to the new value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.comboboxtextsubmittedeventargs.handled
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
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IComboBoxTextSubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IComboBoxTextSubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTextSubmittedEventArgs := IComboBoxTextSubmittedEventArgs(outPtr)
        }

        return this.__IComboBoxTextSubmittedEventArgs.get_Text()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IComboBoxTextSubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IComboBoxTextSubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTextSubmittedEventArgs := IComboBoxTextSubmittedEventArgs(outPtr)
        }

        return this.__IComboBoxTextSubmittedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IComboBoxTextSubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IComboBoxTextSubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxTextSubmittedEventArgs := IComboBoxTextSubmittedEventArgs(outPtr)
        }

        return this.__IComboBoxTextSubmittedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
