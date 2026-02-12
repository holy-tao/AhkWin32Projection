#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardPinPolicy.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of personal identification number (PIN) rules on a Trusted Platform Module (TPM) virtual smart card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardPinPolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardPinPolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardPinPolicy.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the minimum character length for a personal identification number (PIN) on a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * The lowest allowed minimum character length is 4.
     * 
     * The highest allowed minimum character length is 127.
     * 
     * The default minimum character length is 8.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy.minlength
     * @type {Integer} 
     */
    MinLength {
        get => this.get_MinLength()
        set => this.put_MinLength(value)
    }

    /**
     * Gets or sets the maximum character length for a personal identification number (PIN) on a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * The lowest allowed maximum character length is 4.
     * 
     * The highest allowed maximum character length is 127.
     * 
     * The default maximum character length is 127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy.maxlength
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * Gets or sets whether uppercase letter characters are allowed for a personal identification number (PIN) on a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * The default value is to allow uppercase letter characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy.uppercaseletters
     * @type {Integer} 
     */
    UppercaseLetters {
        get => this.get_UppercaseLetters()
        set => this.put_UppercaseLetters(value)
    }

    /**
     * Gets or sets whether lowercase letter characters are allowed for a personal identification number (PIN) on a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * The default value is to allow lowercase letter characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy.lowercaseletters
     * @type {Integer} 
     */
    LowercaseLetters {
        get => this.get_LowercaseLetters()
        set => this.put_LowercaseLetters(value)
    }

    /**
     * Gets or sets whether number characters are allowed for a personal identification number (PIN) on a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * The default value is to allow number characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy.digits
     * @type {Integer} 
     */
    Digits {
        get => this.get_Digits()
        set => this.put_Digits(value)
    }

    /**
     * Gets or sets whether special characters are allowed for a personal identification number (PIN) on a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * Special characters are defined here as the following set of printable ASCII characters: ! " # $ % &amp; ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ \ ] ^ _ ` { | } ~
     * 
     * The default value is to allow special characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinpolicy.specialcharacters
     * @type {Integer} 
     */
    SpecialCharacters {
        get => this.get_SpecialCharacters()
        set => this.put_SpecialCharacters(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of a set of personal identification number (PIN) rules on a Trusted Platform Module (TPM) virtual smart card.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardPinPolicy")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinLength() {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.get_MinLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinLength(value) {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.put_MinLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.get_MaxLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLength(value) {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.put_MaxLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UppercaseLetters() {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.get_UppercaseLetters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UppercaseLetters(value) {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.put_UppercaseLetters(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowercaseLetters() {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.get_LowercaseLetters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LowercaseLetters(value) {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.put_LowercaseLetters(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Digits() {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.get_Digits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Digits(value) {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.put_Digits(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SpecialCharacters() {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.get_SpecialCharacters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SpecialCharacters(value) {
        if (!this.HasProp("__ISmartCardPinPolicy")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinPolicy := ISmartCardPinPolicy(outPtr)
        }

        return this.__ISmartCardPinPolicy.put_SpecialCharacters(value)
    }

;@endregion Instance Methods
}
