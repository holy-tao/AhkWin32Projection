#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWorkflowPrintTicketValidationResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of a print ticket validation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticketvalidationresult
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class WorkflowPrintTicketValidationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWorkflowPrintTicketValidationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWorkflowPrintTicketValidationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the print ticket was found to be valid.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticketvalidationresult.validated
     * @type {Boolean} 
     */
    Validated {
        get => this.get_Validated()
    }

    /**
     * Gets the error report (if an error occurred) relating to the ticket validation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticketvalidationresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Validated() {
        if (!this.HasProp("__IWorkflowPrintTicketValidationResult")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicketValidationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicketValidationResult := IWorkflowPrintTicketValidationResult(outPtr)
        }

        return this.__IWorkflowPrintTicketValidationResult.get_Validated()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWorkflowPrintTicketValidationResult")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicketValidationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicketValidationResult := IWorkflowPrintTicketValidationResult(outPtr)
        }

        return this.__IWorkflowPrintTicketValidationResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
