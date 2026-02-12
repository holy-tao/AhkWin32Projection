#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowSubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a [PrintWorkflowBackgroundSession.Submitted](PrintWorkflowbackgroundsession_submitted.md) event that was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowSubmittedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowSubmittedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowSubmittedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the current print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedeventargs.operation
     * @type {PrintWorkflowSubmittedOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowSubmittedOperation} 
     */
    get_Operation() {
        if (!this.HasProp("__IPrintWorkflowSubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSubmittedEventArgs := IPrintWorkflowSubmittedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowSubmittedEventArgs.get_Operation()
    }

    /**
     * Gets a reference to the target document for outputting the edited print job.
     * @param {WorkflowPrintTicket} jobPrintTicket The print ticket specifying printer configuration options. If no printer options were specified for this print job, use **null**.
     * @returns {PrintWorkflowTarget} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedeventargs.gettarget
     */
    GetTarget(jobPrintTicket) {
        if (!this.HasProp("__IPrintWorkflowSubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSubmittedEventArgs := IPrintWorkflowSubmittedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowSubmittedEventArgs.GetTarget(jobPrintTicket)
    }

    /**
     * Gets a deferral object for managing the work done on the corresponding [PrintWorkflowBackgroundSession.Submitted](PrintWorkflowbackgroundsession_submitted.md) event.
     * @remarks
     * A deferral should be used if any asynchronous work is being done in this event handler, so that the next event in the sequence isn't raised until this work is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowSubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSubmittedEventArgs := IPrintWorkflowSubmittedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowSubmittedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
