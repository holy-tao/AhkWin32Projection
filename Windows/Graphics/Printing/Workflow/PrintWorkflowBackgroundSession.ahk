#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowBackgroundSession.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintWorkflowBackgroundSession.ahk
#Include .\PrintWorkflowBackgroundSetupRequestedEventArgs.ahk
#Include .\PrintWorkflowSubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a single print workflow session that runs in the background.
 * @remarks
 * An instance of this class is acquired from the [PrintWorkflowTriggerDetails](PrintWorkflowTriggerDetails.md) instance that gets passed in with the background task instance.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsession
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowBackgroundSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowBackgroundSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowBackgroundSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of the current print workflow session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsession.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised first in the print workflow background session. This event exposes information about the print job but not the print content itself. Register for this event to do work on a print job configuration before printing.
     * @type {TypedEventHandler<PrintWorkflowBackgroundSession, PrintWorkflowBackgroundSetupRequestedEventArgs>}
    */
    OnSetupRequested {
        get {
            if(!this.HasProp("__OnSetupRequested")){
                this.__OnSetupRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bb5c0591-4b11-511c-8ef3-1822cb71427c}"),
                    PrintWorkflowBackgroundSession,
                    PrintWorkflowBackgroundSetupRequestedEventArgs
                )
                this.__OnSetupRequestedToken := this.add_SetupRequested(this.__OnSetupRequested.iface)
            }
            return this.__OnSetupRequested
        }
    }

    /**
     * Raised when the final XPS print data has become available. This is done after the [SetupRequested](Printworkflowbackgroundsession_setuprequested.md) event and after the optional UI-dependent foreground task is completed.
     * @type {TypedEventHandler<PrintWorkflowBackgroundSession, PrintWorkflowSubmittedEventArgs>}
    */
    OnSubmitted {
        get {
            if(!this.HasProp("__OnSubmitted")){
                this.__OnSubmitted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9ec7b563-5044-5df3-98b5-3a5643fc59fe}"),
                    PrintWorkflowBackgroundSession,
                    PrintWorkflowSubmittedEventArgs
                )
                this.__OnSubmittedToken := this.add_Submitted(this.__OnSubmitted.iface)
            }
            return this.__OnSubmitted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSetupRequestedToken")) {
            this.remove_SetupRequested(this.__OnSetupRequestedToken)
            this.__OnSetupRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSubmittedToken")) {
            this.remove_Submitted(this.__OnSubmittedToken)
            this.__OnSubmitted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowBackgroundSession, PrintWorkflowBackgroundSetupRequestedEventArgs>} setupEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SetupRequested(setupEventHandler) {
        if (!this.HasProp("__IPrintWorkflowBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSession := IPrintWorkflowBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSession.add_SetupRequested(setupEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SetupRequested(token) {
        if (!this.HasProp("__IPrintWorkflowBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSession := IPrintWorkflowBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSession.remove_SetupRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowBackgroundSession, PrintWorkflowSubmittedEventArgs>} submittedEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Submitted(submittedEventHandler) {
        if (!this.HasProp("__IPrintWorkflowBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSession := IPrintWorkflowBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSession.add_Submitted(submittedEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Submitted(token) {
        if (!this.HasProp("__IPrintWorkflowBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSession := IPrintWorkflowBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSession.remove_Submitted(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPrintWorkflowBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSession := IPrintWorkflowBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSession.get_Status()
    }

    /**
     * Starts the print workflow background process. The events of this class are raised in sequential order.
     * @remarks
     * This method should be called once the events of this class have been registered for with the appropriate handlers.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowbackgroundsession.start
     */
    Start() {
        if (!this.HasProp("__IPrintWorkflowBackgroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowBackgroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowBackgroundSession := IPrintWorkflowBackgroundSession(outPtr)
        }

        return this.__IPrintWorkflowBackgroundSession.Start()
    }

;@endregion Instance Methods
}
