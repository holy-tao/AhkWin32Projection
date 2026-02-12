#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintCustomItemDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Allows apps to add a collection of enumerable options to the app print experience.
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
 * 
 * // printCustomItemDetails is available in the Items list from the
 * // PrintCustomItemsListOptionDetails object.
 * var printCustomItemDetails = printCustomItemListOptionDetails.Items;
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemdetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintCustomItemDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintCustomItemDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintCustomItemDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the custom print task option item.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemdetails.itemid
     * @type {HSTRING} 
     */
    ItemId {
        get => this.get_ItemId()
    }

    /**
     * Gets or sets the display name of the custom print task option item.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printcustomitemdetails.itemdisplayname
     * @type {HSTRING} 
     */
    ItemDisplayName {
        get => this.get_ItemDisplayName()
        set => this.put_ItemDisplayName(value)
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
    get_ItemId() {
        if (!this.HasProp("__IPrintCustomItemDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemDetails := IPrintCustomItemDetails(outPtr)
        }

        return this.__IPrintCustomItemDetails.get_ItemId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ItemDisplayName(value) {
        if (!this.HasProp("__IPrintCustomItemDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemDetails := IPrintCustomItemDetails(outPtr)
        }

        return this.__IPrintCustomItemDetails.put_ItemDisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ItemDisplayName() {
        if (!this.HasProp("__IPrintCustomItemDetails")) {
            if ((queryResult := this.QueryInterface(IPrintCustomItemDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintCustomItemDetails := IPrintCustomItemDetails(outPtr)
        }

        return this.__IPrintCustomItemDetails.get_ItemDisplayName()
    }

;@endregion Instance Methods
}
