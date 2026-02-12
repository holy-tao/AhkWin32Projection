#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintOptionDetails.ahk
#Include .\IPrintItemListOptionDetails.ahk
#Include .\IPrintCollationOptionDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the list of print collation options.
 * @remarks
 * Here is a code snippet that shows how to retrieve the object:
 * 
 * ```csharp
 * //  Retrieve the advanced Print Task Options.
 * PrintTaskOptionDetails printDetailedOptions = PrintTaskOptionDetails.GetFromPrintTaskOptions(printTask.Options);
 * 
 * // Get the object.
 * PrintCollationOptionDetails printCollationOptionDetails =
 *      (PrintCollationOptionDetails)printDetailedOptions.Options[StandardPrintTaskOptions.Collation];
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintCollationOptionDetails extends IInspectable {
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
     * Gets the ID of the print collation option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.optionid
     * @type {HSTRING} 
     */
    OptionId {
        get => this.get_OptionId()
    }

    /**
     * Gets the option type for the print collation option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.optiontype
     * @type {Integer} 
     */
    OptionType {
        get => this.get_OptionType()
    }

    /**
     * Gets or sets the string for an error condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the state of the print collation option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * Gets or sets the enumerated value of the print collation option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the list of items for the print collation option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.items
     * @type {IVectorView<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets a string for a warning condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.warningtext
     * @type {HSTRING} 
     */
    WarningText {
        get => this.get_WarningText()
        set => this.put_WarningText(value)
    }

    /**
     * Gets or sets the description of the print collation option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.description
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
     * Sets the value for the print collation option.
     * @param {IInspectable} value Value for the print collation option.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcollationoptiondetails.trysetvalue
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
     * @returns {IVectorView<IInspectable>} 
     */
    get_Items() {
        if (!this.HasProp("__IPrintItemListOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintItemListOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintItemListOptionDetails := IPrintItemListOptionDetails(outPtr)
        }

        return this.__IPrintItemListOptionDetails.get_Items()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WarningText(value) {
        if (!this.HasProp("__IPrintCollationOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCollationOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCollationOptionDetails := IPrintCollationOptionDetails(outPtr)
        }

        return this.__IPrintCollationOptionDetails.put_WarningText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WarningText() {
        if (!this.HasProp("__IPrintCollationOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCollationOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCollationOptionDetails := IPrintCollationOptionDetails(outPtr)
        }

        return this.__IPrintCollationOptionDetails.get_WarningText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IPrintCollationOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCollationOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCollationOptionDetails := IPrintCollationOptionDetails(outPtr)
        }

        return this.__IPrintCollationOptionDetails.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPrintCollationOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCollationOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCollationOptionDetails := IPrintCollationOptionDetails(outPtr)
        }

        return this.__IPrintCollationOptionDetails.get_Description()
    }

;@endregion Instance Methods
}
