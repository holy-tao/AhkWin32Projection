#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportPrintTicketValidationRequestedEventArgs.ahk
#Include .\IPrintSupportPrintTicketValidationRequestedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info for the [PrintTicketValidationRequested](printsupportextensionsession_printticketvalidationrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintticketvalidationrequestedeventargs
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportPrintTicketValidationRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportPrintTicketValidationRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportPrintTicketValidationRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the print ticket that needs to be validated. The print ticket contains instructions on how the printer should set its various features for a printing task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintticketvalidationrequestedeventargs.printticket
     * @type {WorkflowPrintTicket} 
     */
    PrintTicket {
        get => this.get_PrintTicket()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_PrintTicket() {
        if (!this.HasProp("__IPrintSupportPrintTicketValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketValidationRequestedEventArgs := IPrintSupportPrintTicketValidationRequestedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrintTicketValidationRequestedEventArgs.get_PrintTicket()
    }

    /**
     * Call this method from your [PrintTicketValidationRequested](printsupportextensionsession_printticketvalidationrequested.md) event handler to indicate whether the print ticket has been resolved, has conflicts, or is invalid.
     * @param {Integer} status_ The validation status of the print ticket.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintticketvalidationrequestedeventargs.setprintticketvalidationstatus
     */
    SetPrintTicketValidationStatus(status_) {
        if (!this.HasProp("__IPrintSupportPrintTicketValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketValidationRequestedEventArgs := IPrintSupportPrintTicketValidationRequestedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrintTicketValidationRequestedEventArgs.SetPrintTicketValidationStatus(status_)
    }

    /**
     * Requests that the print ticket validation operation be delayed and gets a deferral object that will be invoked upon completion of the deferred action.
     * @remarks
     * The print ticket validation operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintticketvalidationrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintSupportPrintTicketValidationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketValidationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketValidationRequestedEventArgs := IPrintSupportPrintTicketValidationRequestedEventArgs(outPtr)
        }

        return this.__IPrintSupportPrintTicketValidationRequestedEventArgs.GetDeferral()
    }

    /**
     * 
     * @param {Boolean} showsUI 
     * @returns {HRESULT} 
     */
    SetPrintJobShowsUI(showsUI) {
        if (!this.HasProp("__IPrintSupportPrintTicketValidationRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketValidationRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketValidationRequestedEventArgs2 := IPrintSupportPrintTicketValidationRequestedEventArgs2(outPtr)
        }

        return this.__IPrintSupportPrintTicketValidationRequestedEventArgs2.SetPrintJobShowsUI(showsUI)
    }

;@endregion Instance Methods
}
