#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportPrinterSelectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PrintSupportExtensionSession.PrinterSelected](/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.printerselected) event, which is raised when the selected printer in the printer dialog is changed to the printer associated with printer support app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportPrinterSelectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportPrinterSelectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportPrinterSelectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that provides information about the source app associated with the [PrintSupportExtensionSession.PrinterSelected](/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.printerselected) event.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.sourceappinfo
     * @type {AppInfo} 
     */
    SourceAppInfo {
        get => this.get_SourceAppInfo()
    }

    /**
     * Gets the PrintTicket associated with the [PrintSupportExtensionSession.PrinterSelected](/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.printerselected) event.
     * @remarks
     * A PrintTicket is a collection of various print related features and their values used to capture the user's intent for a given print job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.printticket
     * @type {WorkflowPrintTicket} 
     */
    PrintTicket {
        get => this.get_PrintTicket()
        set => this.put_PrintTicket(value)
    }

    /**
     * Gets a value indicating the number of features and parameters that can be displayed in the print dialog.
     * @remarks
     * Specify additional features and parameters for the print dialog by calling [SetAdditionalFeatures](/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadditionalfeatures)) and [SetAdditionalParameters](/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadditionalparameters)).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.allowedadditionalfeaturesandparameterscount
     * @type {Integer} 
     */
    AllowedAdditionalFeaturesAndParametersCount {
        get => this.get_AllowedAdditionalFeaturesAndParametersCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_SourceAppInfo() {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.get_SourceAppInfo()
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_PrintTicket() {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.get_PrintTicket()
    }

    /**
     * 
     * @param {WorkflowPrintTicket} value 
     * @returns {HRESULT} 
     */
    put_PrintTicket(value) {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.put_PrintTicket(value)
    }

    /**
     * Specifies additional PrintTicket features to be shown in the print dialog, if not already shown.
     * @param {IIterable<PrintSupportPrintTicketElement>} features An **IEnumerable** collection of [PrintSupportPrintTicketElement](Windows.Graphics.Printing.PrintSupport.PrintSupportPrintTicketElement) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadditionalfeatures
     */
    SetAdditionalFeatures(features) {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.SetAdditionalFeatures(features)
    }

    /**
     * Specifies additional PrintTicket parameters to be shown in the print dialog, if not already shown.
     * @param {IIterable<PrintSupportPrintTicketElement>} parameters An **IEnumerable** collection of [PrintSupportPrintTicketElement](Windows.Graphics.Printing.PrintSupport.PrintSupportPrintTicketElement) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadditionalparameters
     */
    SetAdditionalParameters(parameters) {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.SetAdditionalParameters(parameters)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedAdditionalFeaturesAndParametersCount() {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.get_AllowedAdditionalFeaturesAndParametersCount()
    }

    /**
     * Sets the adaptive card to be shown by the print system in the print dialog in response to the [PrintSupportExtensionSession.PrinterSelected](/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.printerselected) event.
     * @remarks
     * Note that not all Adaptive Card actions and features are supported. For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
     * @param {IAdaptiveCard} adaptiveCard The **AdaptiveCard** object to be shown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadaptivecard
     */
    SetAdaptiveCard(adaptiveCard) {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.SetAdaptiveCard(adaptiveCard)
    }

    /**
     * Informs the system that the app might continue to perform work after the [PrintSupportExtensionSession.PrinterSelected](/uwp/api/windows.graphics.printing.printsupport.printsupportextensionsession.printerselected) event handler returns.
     * @remarks
     * If **PrinterSelected** event handler uses an asynchronous operation, it is possible for the handler to return before the background task has completed its work. As soon as the handler returns, the system might suspend or terminate the background task host process, which could prevent completion of asynchronous operations started by the background task.
     * 
     * To keep the host process from being suspended or terminated while the background task is running, use the **GetDeferral** method to get a background task deferral for each asynchronous operation initiated. Then, when the asynchronous operation is finished, call the [BackgroundTaskDeferral.Complete](/uwp/api/windows.applicationmodel.background.backgroundtaskdeferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintSupportPrinterSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrinterSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrinterSelectedEventArgs := IPrintSupportPrinterSelectedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrinterSelectedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
