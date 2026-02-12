#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowForegroundSetupRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a [PrintWorkflowForegroundSession.SetupRequested](PrintWorkflowforegroundsession_setuprequested.md) event that was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsetuprequestedeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowForegroundSetupRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowForegroundSetupRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowForegroundSetupRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the source application, print job title, and session ID for this print workflow session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsetuprequestedeventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the print ticket for the current print task.
     * @returns {IAsyncOperation<WorkflowPrintTicket>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsetuprequestedeventargs.getuserprintticketasync
     */
    GetUserPrintTicketAsync() {
        if (!this.HasProp("__IPrintWorkflowForegroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSetupRequestedEventArgs := IPrintWorkflowForegroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowForegroundSetupRequestedEventArgs.GetUserPrintTicketAsync()
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintWorkflowForegroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSetupRequestedEventArgs := IPrintWorkflowForegroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowForegroundSetupRequestedEventArgs.get_Configuration()
    }

    /**
     * Gets a deferral object for managing the work done on the corresponding [PrintWorkflowForegroundSession.SetupRequested](PrintWorkflowforegroundsession_setuprequested.md) event.
     * @remarks
     * A deferral should be used if any asynchronous work is being done in this event handler, so that the next event in the sequence isn't raised until this work is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsetuprequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowForegroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSetupRequestedEventArgs := IPrintWorkflowForegroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowForegroundSetupRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
