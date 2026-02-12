#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskOptionDetails.ahk
#Include ..\IPrintTaskOptionsCore.ahk
#Include ..\IPrintTaskOptionsCoreUIConfiguration.ahk
#Include .\IPrintTaskOptionDetails2.ahk
#Include .\IPrintTaskOptionDetailsStatic.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintTaskOptionDetails.ahk
#Include .\PrintTaskOptionChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * A collection of events, methods and properties for advanced print tasks.
 * @remarks
 * You can use **PrintTaskOptionDetails** to retrieve information about the available options for a print task and to add custom options to the print experience.
 * 
 * Here is a code snippet that shows how to retrieve the advanced options for a print task and then set the order in which they will be displayed in the print window of the app.
 * 
 * ```csharp
 * //  Retrieve the advanced Print Task Options.
 * PrintTaskOptionDetails printDetailedOptions = PrintTaskOptionDetails.GetFromPrintTaskOptions(printTask.Options);
 * 
 * // Choose the printer options to be shown.
 * // The order in which the options are appended determines the order in which they appear in the UI
 * printDetailedOptions.DisplayedOptions.Clear();
 * 
 * printDetailedOptions.DisplayedOptions.Add(StandardPrintTaskOptions.Copies);
 * printDetailedOptions.DisplayedOptions.Add(StandardPrintTaskOptions.Orientation);
 * printDetailedOptions.DisplayedOptions.Add(StandardPrintTaskOptions.ColorMode);
 * ```
 * 
 * For more information on this and other printing scenarios, see [Printing](/windows/uwp/devices-sensors/print-from-your-app) on the Windows Dev Center.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintTaskOptionDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskOptionDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskOptionDetails.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Used to retrieve the available options for a print task.
     * @param {PrintTaskOptions} printTaskOptions_ Pointer to a **PrintTaskOptions** object.
     * @returns {PrintTaskOptionDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.getfromprinttaskoptions
     */
    static GetFromPrintTaskOptions(printTaskOptions_) {
        if (!PrintTaskOptionDetails.HasProp("__IPrintTaskOptionDetailsStatic")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.OptionDetails.PrintTaskOptionDetails")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintTaskOptionDetailsStatic.IID)
            PrintTaskOptionDetails.__IPrintTaskOptionDetailsStatic := IPrintTaskOptionDetailsStatic(factoryPtr)
        }

        return PrintTaskOptionDetails.__IPrintTaskOptionDetailsStatic.GetFromPrintTaskOptions(printTaskOptions_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of options for the advanced print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.options
     * @type {IMapView<HSTRING, IPrintOptionDetails>} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets the list of print task options that are currently displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.displayedoptions
     * @type {IVector<HSTRING>} 
     */
    DisplayedOptions {
        get => this.get_DisplayedOptions()
    }

    /**
     * Raised when any one of the advanced print task options is changed.
     * @type {TypedEventHandler<PrintTaskOptionDetails, PrintTaskOptionChangedEventArgs>}
    */
    OnOptionChanged {
        get {
            if(!this.HasProp("__OnOptionChanged")){
                this.__OnOptionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1b1f456b-8821-592e-b4a7-9b4c3712518e}"),
                    PrintTaskOptionDetails,
                    PrintTaskOptionChangedEventArgs
                )
                this.__OnOptionChangedToken := this.add_OptionChanged(this.__OnOptionChanged.iface)
            }
            return this.__OnOptionChanged
        }
    }

    /**
     * Raised when the print system begins a validation pass on the current state of the print ticket.
     * @type {TypedEventHandler<PrintTaskOptionDetails, IInspectable>}
    */
    OnBeginValidation {
        get {
            if(!this.HasProp("__OnBeginValidation")){
                this.__OnBeginValidation := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5c88455c-5b59-557c-8064-5e4f3d59a8ec}"),
                    PrintTaskOptionDetails,
                    IInspectable
                )
                this.__OnBeginValidationToken := this.add_BeginValidation(this.__OnBeginValidation.iface)
            }
            return this.__OnBeginValidation
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOptionChangedToken")) {
            this.remove_OptionChanged(this.__OnOptionChangedToken)
            this.__OnOptionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBeginValidationToken")) {
            this.remove_BeginValidation(this.__OnBeginValidationToken)
            this.__OnBeginValidation.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IPrintOptionDetails>} 
     */
    get_Options() {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.get_Options()
    }

    /**
     * Creates a custom list of items that allow the user to choose the page format.
     * @param {HSTRING} optionId The ID for the custom item.
     * @param {HSTRING} displayName The display name for the custom item.
     * @returns {PrintCustomItemListOptionDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.createitemlistoption
     */
    CreateItemListOption(optionId, displayName) {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.CreateItemListOption(optionId, displayName)
    }

    /**
     * Creates a [CustomPrintTaskOptionText](printcustomtextoptiondetails.md) object to handle the display name and other parameters of the advanced print task option item.
     * @param {HSTRING} optionId The ID of the print task option.
     * @param {HSTRING} displayName The display name of the print task option.
     * @returns {PrintCustomTextOptionDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.createtextoption
     */
    CreateTextOption(optionId, displayName) {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.CreateTextOption(optionId, displayName)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTaskOptionDetails, PrintTaskOptionChangedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_OptionChanged(eventHandler) {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.add_OptionChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_OptionChanged(eventCookie) {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.remove_OptionChanged(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTaskOptionDetails, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_BeginValidation(eventHandler) {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.add_BeginValidation(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_BeginValidation(eventCookie) {
        if (!this.HasProp("__IPrintTaskOptionDetails")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails := IPrintTaskOptionDetails(outPtr)
        }

        return this.__IPrintTaskOptionDetails.remove_BeginValidation(eventCookie)
    }

    /**
     * Returns a **PrintPageDescription** object for the referenced page number.
     * @param {Integer} jobPageNumber The page number.
     * @returns {PrintPageDescription} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.getpagedescription
     */
    GetPageDescription(jobPageNumber) {
        if (!this.HasProp("__IPrintTaskOptionsCore")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCore := IPrintTaskOptionsCore(outPtr)
        }

        return this.__IPrintTaskOptionsCore.GetPageDescription(jobPageNumber)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DisplayedOptions() {
        if (!this.HasProp("__IPrintTaskOptionsCoreUIConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionsCoreUIConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionsCoreUIConfiguration := IPrintTaskOptionsCoreUIConfiguration(outPtr)
        }

        return this.__IPrintTaskOptionsCoreUIConfiguration.get_DisplayedOptions()
    }

    /**
     * Creates a [PrintCustomToggleOptionDetails](printcustomtoggleoptiondetails.md) object to handle the display name and other parameters of the advanced print task option item.
     * @param {HSTRING} optionId The ID of the print task option.
     * @param {HSTRING} displayName The display name of the print task option.
     * @returns {PrintCustomToggleOptionDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printtaskoptiondetails.createtoggleoption
     */
    CreateToggleOption(optionId, displayName) {
        if (!this.HasProp("__IPrintTaskOptionDetails2")) {
            if ((queryResult := this.QueryInterface(IPrintTaskOptionDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskOptionDetails2 := IPrintTaskOptionDetails2(outPtr)
        }

        return this.__IPrintTaskOptionDetails2.CreateToggleOption(optionId, displayName)
    }

;@endregion Instance Methods
}
