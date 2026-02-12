#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintOptionDetails.ahk
#Include .\IPrintPageRangeOptionDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the list of print page range options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintPageRangeOptionDetails extends IInspectable {
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
     * Gets the ID of the print page range option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.optionid
     * @type {HSTRING} 
     */
    OptionId {
        get => this.get_OptionId()
    }

    /**
     * Gets the option type for the print page range option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.optiontype
     * @type {Integer} 
     */
    OptionType {
        get => this.get_OptionType()
    }

    /**
     * Gets or sets the string for an error condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the state for the print page range option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * Gets the enumerated value of the print page range option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets or sets a string for a warning condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.warningtext
     * @type {HSTRING} 
     */
    WarningText {
        get => this.get_WarningText()
        set => this.put_WarningText(value)
    }

    /**
     * Gets or sets a description of the print page range option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.description
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
     * Sets the value for the print page range option.
     * @param {IInspectable} value Value for the print page range option
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printpagerangeoptiondetails.trysetvalue
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
    put_WarningText(value) {
        if (!this.HasProp("__IPrintPageRangeOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptionDetails := IPrintPageRangeOptionDetails(outPtr)
        }

        return this.__IPrintPageRangeOptionDetails.put_WarningText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WarningText() {
        if (!this.HasProp("__IPrintPageRangeOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptionDetails := IPrintPageRangeOptionDetails(outPtr)
        }

        return this.__IPrintPageRangeOptionDetails.get_WarningText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IPrintPageRangeOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptionDetails := IPrintPageRangeOptionDetails(outPtr)
        }

        return this.__IPrintPageRangeOptionDetails.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPrintPageRangeOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintPageRangeOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageRangeOptionDetails := IPrintPageRangeOptionDetails(outPtr)
        }

        return this.__IPrintPageRangeOptionDetails.get_Description()
    }

;@endregion Instance Methods
}
