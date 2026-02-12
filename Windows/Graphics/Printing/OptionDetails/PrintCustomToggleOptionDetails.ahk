#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintOptionDetails.ahk
#Include .\IPrintCustomOptionDetails.ahk
#Include .\IPrintCustomToggleOptionDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the list of print custom toggle options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintCustomToggleOptionDetails extends IInspectable {
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
     * Gets the ID of the print custom toggle option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.optionid
     * @type {HSTRING} 
     */
    OptionId {
        get => this.get_OptionId()
    }

    /**
     * Gets the option type for the print custom toggle option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.optiontype
     * @type {Integer} 
     */
    OptionType {
        get => this.get_OptionType()
    }

    /**
     * Gets or sets the string for an error condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the state of the print custom toggle option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * Gets or sets the enumerated value of the print custom toggle option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets or sets the display name for the print custom toggle option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets a string for a warning condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.warningtext
     * @type {HSTRING} 
     */
    WarningText {
        get => this.get_WarningText()
        set => this.put_WarningText(value)
    }

    /**
     * Gets or sets the description of the print custom toggle option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.description
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
     * Sets the value for the print custom toggle option.
     * @param {IInspectable} value Value of the print custom toggle.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomtoggleoptiondetails.trysetvalue
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
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WarningText(value) {
        if (!this.HasProp("__IPrintCustomToggleOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomToggleOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomToggleOptionDetails := IPrintCustomToggleOptionDetails(outPtr)
        }

        return this.__IPrintCustomToggleOptionDetails.put_WarningText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WarningText() {
        if (!this.HasProp("__IPrintCustomToggleOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomToggleOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomToggleOptionDetails := IPrintCustomToggleOptionDetails(outPtr)
        }

        return this.__IPrintCustomToggleOptionDetails.get_WarningText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IPrintCustomToggleOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomToggleOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomToggleOptionDetails := IPrintCustomToggleOptionDetails(outPtr)
        }

        return this.__IPrintCustomToggleOptionDetails.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPrintCustomToggleOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomToggleOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomToggleOptionDetails := IPrintCustomToggleOptionDetails(outPtr)
        }

        return this.__IPrintCustomToggleOptionDetails.get_Description()
    }

;@endregion Instance Methods
}
