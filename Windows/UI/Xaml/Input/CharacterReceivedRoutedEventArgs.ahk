#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ICharacterReceivedRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [UIElement.CharacterReceived](../windows.ui.xaml/uielement_characterreceived.md) routed event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.characterreceivedroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class CharacterReceivedRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICharacterReceivedRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICharacterReceivedRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UTF-16 code unit](/dotnet/api/system.char) for the composed character associated with the [UIElement.CharacterReceived](../windows.ui.xaml/uielement_characterreceived.md) event. 
     * 
     * > [!NOTE]
     * > A composed character is a single visual object derived from a sequence of one or more other characters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.characterreceivedroutedeventargs.character
     * @type {Integer} 
     */
    Character {
        get => this.get_Character()
    }

    /**
     * Gets the status of the physical key that raised the character-received event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.characterreceivedroutedeventargs.keystatus
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.characterreceivedroutedeventargs.handled
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
    get_Character() {
        if (!this.HasProp("__ICharacterReceivedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICharacterReceivedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterReceivedRoutedEventArgs := ICharacterReceivedRoutedEventArgs(outPtr)
        }

        return this.__ICharacterReceivedRoutedEventArgs.get_Character()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__ICharacterReceivedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICharacterReceivedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterReceivedRoutedEventArgs := ICharacterReceivedRoutedEventArgs(outPtr)
        }

        return this.__ICharacterReceivedRoutedEventArgs.get_KeyStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICharacterReceivedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICharacterReceivedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterReceivedRoutedEventArgs := ICharacterReceivedRoutedEventArgs(outPtr)
        }

        return this.__ICharacterReceivedRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICharacterReceivedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICharacterReceivedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterReceivedRoutedEventArgs := ICharacterReceivedRoutedEventArgs(outPtr)
        }

        return this.__ICharacterReceivedRoutedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
