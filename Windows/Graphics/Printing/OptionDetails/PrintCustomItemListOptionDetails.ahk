#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintOptionDetails.ahk
#Include .\IPrintCustomOptionDetails.ahk
#Include .\IPrintItemListOptionDetails.ahk
#Include .\IPrintCustomItemListOptionDetails.ahk
#Include .\IPrintCustomItemListOptionDetails2.ahk
#Include .\IPrintCustomItemListOptionDetails3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a list of the custom print task option items.
 * @remarks
 * Here is a code snippet that shows how to retrieve the object:
 * 
 * ```csharp
 * // Create a new list option.
 * // This code creates a new item list option that will be shown to the user.
 * PrintCustomItemListOptionDetails pageFormat = 
 *     printDetailedOptions.CreateItemListOption("PageContent", "Pictures");
 * pageFormat.AddItem("PicturesText", "Pictures and text");
 * pageFormat.AddItem("PicturesOnly", "Pictures only");
 * pageFormat.AddItem("TextOnly", "Text only");
 * 
 * // Add the custom option to the option list.
 * printDetailedOptions.DisplayedOptions.Add("PageContent");
 * 
 * // Later in your app, when you want to access the list created above,
 * // but you don't have access to the pageFormat variable that was returned
 * // when the list was created, you can get it by looking up the same
 * // optionId that you used to create the list.
 * PrintCustomItemListOptionDetails printCustomItemListOptionDetails =
 *     (PrintCustomItemListOptionDetails)printDetailedOptions.Options["PageContent"];
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintCustomItemListOptionDetails extends IInspectable {
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
     * Gets the ID of a custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.optionid
     * @type {HSTRING} 
     */
    OptionId {
        get => this.get_OptionId()
    }

    /**
     * Gets the option type for a custom print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.optiontype
     * @type {Integer} 
     */
    OptionType {
        get => this.get_OptionType()
    }

    /**
     * Gets or sets the string for an error condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the state of the list of custom print task option items.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * Gets or sets the value of the list of custom print tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets or sets the display name of an item in the list of custom print task options.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets an item from the list of custom print tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.items
     * @type {IVectorView<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets a string for a warning condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.warningtext
     * @type {HSTRING} 
     */
    WarningText {
        get => this.get_WarningText()
        set => this.put_WarningText(value)
    }

    /**
     * Gets or sets the description for the print custom item list option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.description
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
     * Sets the value for the item ID or the display name of the custom item.
     * @remarks
     * To set the default value for a custom dropdown list of options, set the value explicitly. Otherwise, the adding order will be used.
     * @param {IInspectable} value Value for the item ID or the display name of the custom item.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.trysetvalue
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
     * Sets the ID or display name of an item in the list of custom print task options.
     * @param {HSTRING} itemId The ID of the option item.
     * @param {HSTRING} displayName The display name of the option item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.additem
     */
    AddItem(itemId, displayName) {
        if (!this.HasProp("__IPrintCustomItemListOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemListOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemListOptionDetails := IPrintCustomItemListOptionDetails(outPtr)
        }

        return this.__IPrintCustomItemListOptionDetails.AddItem(itemId, displayName)
    }

    /**
     * Sets the item ID, display name, description, or icon in the list of custom print item options.
     * @param {HSTRING} itemId The ID of the option item.
     * @param {HSTRING} displayName The display name of the option item.
     * @param {HSTRING} description The description of the option item.
     * @param {IRandomAccessStreamWithContentType} icon The icon used by the option item. The icon needs to be in the SVG file format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemlistoptiondetails.additem
     */
    AddItem1(itemId, displayName, description, icon) {
        if (!this.HasProp("__IPrintCustomItemListOptionDetails2")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemListOptionDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemListOptionDetails2 := IPrintCustomItemListOptionDetails2(outPtr)
        }

        return this.__IPrintCustomItemListOptionDetails2.AddItem(itemId, displayName, description, icon)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WarningText(value) {
        if (!this.HasProp("__IPrintCustomItemListOptionDetails3")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemListOptionDetails3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemListOptionDetails3 := IPrintCustomItemListOptionDetails3(outPtr)
        }

        return this.__IPrintCustomItemListOptionDetails3.put_WarningText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WarningText() {
        if (!this.HasProp("__IPrintCustomItemListOptionDetails3")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemListOptionDetails3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemListOptionDetails3 := IPrintCustomItemListOptionDetails3(outPtr)
        }

        return this.__IPrintCustomItemListOptionDetails3.get_WarningText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IPrintCustomItemListOptionDetails3")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemListOptionDetails3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemListOptionDetails3 := IPrintCustomItemListOptionDetails3(outPtr)
        }

        return this.__IPrintCustomItemListOptionDetails3.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPrintCustomItemListOptionDetails3")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemListOptionDetails3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemListOptionDetails3 := IPrintCustomItemListOptionDetails3(outPtr)
        }

        return this.__IPrintCustomItemListOptionDetails3.get_Description()
    }

;@endregion Instance Methods
}
