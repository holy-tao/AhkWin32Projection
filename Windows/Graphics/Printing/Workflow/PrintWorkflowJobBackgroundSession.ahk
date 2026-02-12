#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowJobBackgroundSession.ahk
#Include .\IPrintWorkflowJobBackgroundSession2.ahk
#Include .\IPrintWorkflowJobBackgroundSession3.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintWorkflowJobBackgroundSession.ahk
#Include .\PrintWorkflowJobStartingEventArgs.ahk
#Include .\PrintWorkflowPdlModificationRequestedEventArgs.ahk
#Include .\PrintWorkflowJobIssueDetectedEventArgs.ahk
#Include .\PrintWorkflowPrinterJobStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a single print workflow job session that runs in the background.
 * @remarks
 * To create a print support workflow, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportWorkflow** in its package manifest that specifies the entry point of a background task. When the background task is activated, the [IBackgroundTask.Run](/uwp/api/windows.applicationmodel.background.ibackgroundtask.run) method receives an [IBackgroundTaskInstance](/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance) object. You can cast the [TriggerDetails](windows.applicationmodel.background.ibackgroundtaskinstance.triggerdetails) property of this object to a [PrintWorkflowJobTriggerDetails](printworkflowjobtriggerdetails.md) object to get more details about the print workflow job session.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobbackgroundsession
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobBackgroundSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowJobBackgroundSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowJobBackgroundSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the current print workflow session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobbackgroundsession.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised when a print job is started by a print workflow app. Your print workflow app can use members of the event args object to skip system rendering or modify the operation in other ways.
     * @type {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowJobStartingEventArgs>}
    */
    OnJobStarting {
        get {
            if(!this.HasProp("__OnJobStarting")){
                this.__OnJobStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{03d7ca7e-089d-5ff2-bae1-46d664f818af}"),
                    PrintWorkflowJobBackgroundSession,
                    PrintWorkflowJobStartingEventArgs
                )
                this.__OnJobStartingToken := this.add_JobStarting(this.__OnJobStarting.iface)
            }
            return this.__OnJobStarting
        }
    }

    /**
     * Raised when a document is sent to the print stack and Windows starts to convert the document to the page description language (PDL) format indicated by the printer. Your print workflow app can use members of the event args object to modify the conversion to the page description language (PDL) format indicated by the printer.
     * @type {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowPdlModificationRequestedEventArgs>}
    */
    OnPdlModificationRequested {
        get {
            if(!this.HasProp("__OnPdlModificationRequested")){
                this.__OnPdlModificationRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c9a3b256-9f44-5cd5-a02e-7d5f52e8bd5d}"),
                    PrintWorkflowJobBackgroundSession,
                    PrintWorkflowPdlModificationRequestedEventArgs
                )
                this.__OnPdlModificationRequestedToken := this.add_PdlModificationRequested(this.__OnPdlModificationRequested.iface)
            }
            return this.__OnPdlModificationRequested
        }
    }

    /**
     * Raised when an error or warning is detected in the the current printer job operation.
     * @remarks
     * In the handler for this event, apps can call [SkipSystemErrorToast](printworkflowjobissuedetectedeventargs_skipsystemerrortoast.md) to suppress the default system toast notification for the issue. This enables apps to launch their own custom toast notification without the user receiving redundant notifications.
     * @type {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowJobIssueDetectedEventArgs>}
    */
    OnJobIssueDetected {
        get {
            if(!this.HasProp("__OnJobIssueDetected")){
                this.__OnJobIssueDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{241e075c-dab5-5dd5-9f31-713910aa28fa}"),
                    PrintWorkflowJobBackgroundSession,
                    PrintWorkflowJobIssueDetectedEventArgs
                )
                this.__OnJobIssueDetectedToken := this.add_JobIssueDetected(this.__OnJobIssueDetected.iface)
            }
            return this.__OnJobIssueDetected
        }
    }

    OnJobStatusChanged {
        get {
            if(!this.HasProp("__OnJobStatusChanged")){
                this.__OnJobStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bb005e25-aa8e-5a3d-aa86-8bd45b0ab3e1}"),
                    PrintWorkflowJobBackgroundSession,
                    PrintWorkflowPrinterJobStatusChangedEventArgs
                )
                this.__OnJobStatusChangedToken := this.add_JobStatusChanged(this.__OnJobStatusChanged.iface)
            }
            return this.__OnJobStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnJobStartingToken")) {
            this.remove_JobStarting(this.__OnJobStartingToken)
            this.__OnJobStarting.iface.Dispose()
        }

        if(this.HasProp("__OnPdlModificationRequestedToken")) {
            this.remove_PdlModificationRequested(this.__OnPdlModificationRequestedToken)
            this.__OnPdlModificationRequested.iface.Dispose()
        }

        if(this.HasProp("__OnJobIssueDetectedToken")) {
            this.remove_JobIssueDetected(this.__OnJobIssueDetectedToken)
            this.__OnJobIssueDetected.iface.Dispose()
        }

        if(this.HasProp("__OnJobStatusChangedToken")) {
            this.remove_JobStatusChanged(this.__OnJobStatusChangedToken)
            this.__OnJobStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession := IPrintWorkflowJobBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowJobStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_JobStarting(handler) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession := IPrintWorkflowJobBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession.add_JobStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_JobStarting(token) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession := IPrintWorkflowJobBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession.remove_JobStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowPdlModificationRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PdlModificationRequested(handler) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession := IPrintWorkflowJobBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession.add_PdlModificationRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PdlModificationRequested(token) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession := IPrintWorkflowJobBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession.remove_PdlModificationRequested(token)
    }

    /**
     * Starts the print workflow job service so it can begin raising events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobbackgroundsession.start
     */
    Start() {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession := IPrintWorkflowJobBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession.Start()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowJobIssueDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_JobIssueDetected(handler) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession2 := IPrintWorkflowJobBackgroundSession2(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession2.add_JobIssueDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_JobIssueDetected(token) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession2 := IPrintWorkflowJobBackgroundSession2(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession2.remove_JobIssueDetected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobBackgroundSession, PrintWorkflowPrinterJobStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_JobStatusChanged(handler) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession3")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession3 := IPrintWorkflowJobBackgroundSession3(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession3.add_JobStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_JobStatusChanged(token) {
        if (!this.HasProp("__IPrintWorkflowJobBackgroundSession3")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobBackgroundSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobBackgroundSession3 := IPrintWorkflowJobBackgroundSession3(outPtr)
        }

        return this.__IPrintWorkflowJobBackgroundSession3.remove_JobStatusChanged(token)
    }

;@endregion Instance Methods
}
