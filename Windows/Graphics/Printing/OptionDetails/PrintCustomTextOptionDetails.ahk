#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintOptionDetails.ahk
#Include .\IPrintCustomOptionDetails.ahk
#Include .\IPrintCustomTextOptionDetails.ahk
#Include .\IPrintCustomTextOptionDetails2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a custom print task option.
 * @remarks
 * Here is a code snippet that shows how to retrieve the object:
 * 
 * ```csharp
 * // This code creates a new custom text option. 
 * PrintCustomTextOptionDetails customTextOption =
 *     printDetailedOptions.CreateTextOption("myCustomText", "Custom Options");
 * 
 * // Later in your app, when you want to access the custom text option created above,
 * // but you don't have access to the customTextOption variable that was returned
 * // when it was created, you can get it by looking up the same optionId that
 * // you used to create it. 
 * PrintCustomTextOptionDetails printCustomTextOptionDetails =
 *     (PrintCustomTextOptionDetails)printDetailedOptions.Options["myCustomText"];
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintCustomTextOptionDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintOptionDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintOptionDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.optionid
     * @type {HSTRING} 
     */
    OptionId {
        get => this.get_OptionId()
    }

    /**
     * Gets the option type for the custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.optiontype
     * @type {Integer} 
     */
    OptionType {
        get => this.get_OptionType()
    }

    /**
     * Gets or sets the string for an error condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the state of a custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * Gets or sets the value of a custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets or sets the display name of the custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the maximum number of characters for the display name of the custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.maxcharacters
     * @type {Integer} 
     */
    MaxCharacters {
        get => this.get_MaxCharacters()
        set => this.put_MaxCharacters(value)
    }

    /**
     * Gets or sets a string for a warning condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.warningtext
     * @type {HSTRING} 
     */
    WarningText {
        get => this.get_WarningText()
        set => this.put_WarningText(value)
    }

    /**
     * Gets or sets a description of the print custom text option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
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
    get_OptionId() {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.get_OptionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OptionType() {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.get_OptionType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ErrorText(value) {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.put_ErrorText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorText() {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.get_ErrorText()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_State(value) {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.put_State(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.get_State()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.get_Value()
    }

    /**
     * Sets the value for the custom print task.
     * @param {IInspectable} value Value for the custom print task.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtextoptiondetails.trysetvalue
     */
    TrySetValue(value) {
        if (!this.HasProp("__IPrintOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintOptionDetails := IPrintOptionDetails(outPtr)
        }

        return this.__IPrintOptionDetails.TrySetValue(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPrintCustomOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomOptionDetails := IPrintCustomOptionDetails(outPtr)
        }

        return this.__IPrintCustomOptionDetails.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPrintCustomOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomOptionDetails := IPrintCustomOptionDetails(outPtr)
        }

        return this.__IPrintCustomOptionDetails.get_DisplayName()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxCharacters(value) {
        if (!this.HasProp("__IPrintCustomTextOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomTextOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomTextOptionDetails := IPrintCustomTextOptionDetails(outPtr)
        }

        return this.__IPrintCustomTextOptionDetails.put_MaxCharacters(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxCharacters() {
        if (!this.HasProp("__IPrintCustomTextOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomTextOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomTextOptionDetails := IPrintCustomTextOptionDetails(outPtr)
        }

        return this.__IPrintCustomTextOptionDetails.get_MaxCharacters()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WarningText(value) {
        if (!this.HasProp("__IPrintCustomTextOptionDetails2")) {
            if ((queryResult := this.QueryInterface(IPrintCustomTextOptionDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomTextOptionDetails2 := IPrintCustomTextOptionDetails2(outPtr)
        }

        return this.__IPrintCustomTextOptionDetails2.put_WarningText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WarningText() {
        if (!this.HasProp("__IPrintCustomTextOptionDetails2")) {
            if ((queryResult := this.QueryInterface(IPrintCustomTextOptionDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomTextOptionDetails2 := IPrintCustomTextOptionDetails2(outPtr)
        }

        return this.__IPrintCustomTextOptionDetails2.get_WarningText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IPrintCustomTextOptionDetails2")) {
            if ((queryResult := this.QueryInterface(IPrintCustomTextOptionDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomTextOptionDetails2 := IPrintCustomTextOptionDetails2(outPtr)
        }

        return this.__IPrintCustomTextOptionDetails2.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPrintCustomTextOptionDetails2")) {
            if ((queryResult := this.QueryInterface(IPrintCustomTextOptionDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomTextOptionDetails2 := IPrintCustomTextOptionDetails2(outPtr)
        }

        return this.__IPrintCustomTextOptionDetails2.get_Description()
    }

;@endregion Instance Methods
}
