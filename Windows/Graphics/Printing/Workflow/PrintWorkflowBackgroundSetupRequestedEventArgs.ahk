#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowBackgroundSetupRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a [PrintWorkflowBackgroundSession.SetupRequested](PrintWorkflowbackgroundsession_setuprequested.md) event that was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsetuprequestedeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowBackgroundSetupRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowBackgroundSetupRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowBackgroundSetupRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the source application, print job title, and session ID for this print workflow session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsetuprequestedeventargs.configuration
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
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsetuprequestedeventargs.getuserprintticketasync
     */
    GetUserPrintTicketAsync() {
        if (!this.HasProp("__IPrintWorkflowBackgroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSetupRequestedEventArgs := IPrintWorkflowBackgroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSetupRequestedEventArgs.GetUserPrintTicketAsync()
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintWorkflowBackgroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSetupRequestedEventArgs := IPrintWorkflowBackgroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSetupRequestedEventArgs.get_Configuration()
    }

    /**
     * Registers this print workflow session as requiring a UI. This will cause the corresponding foreground task to be activated before the [PrintWorkflowBackgroundSession.Submitted](PrintWorkflowbackgroundsession_submitted.md) event is raised by the background task.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsetuprequestedeventargs.setrequiresui
     */
    SetRequiresUI() {
        if (!this.HasProp("__IPrintWorkflowBackgroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSetupRequestedEventArgs := IPrintWorkflowBackgroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSetupRequestedEventArgs.SetRequiresUI()
    }

    /**
     * Gets a deferral object for managing the work done on the corresponding [PrintWorkflowBackgroundSession.SetupRequested](PrintWorkflowbackgroundsession_setuprequested.md) event.
     * @remarks
     * A deferral should be used if any asynchronous work is being done in this event handler, so that the next event in the sequence isn't raised until this work is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsetuprequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowBackgroundSetupRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSetupRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSetupRequestedEventArgs := IPrintWorkflowBackgroundSetupRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSetupRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
