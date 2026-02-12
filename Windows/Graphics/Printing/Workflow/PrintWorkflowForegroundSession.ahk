#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowForegroundSession.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintWorkflowForegroundSession.ahk
#Include .\PrintWorkflowForegroundSetupRequestedEventArgs.ahk
#Include .\PrintWorkflowXpsDataAvailableEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a single print workflow session that runs in the foreground.
 * @remarks
 * An instance of this class is acquired from the [PrintWorkflowUIActivatedEventArgs](PrintWorkflowUIActivatedEventArgs.md) instance that gets passed in with foreground task activation.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsession
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowForegroundSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowForegroundSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowForegroundSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of the current print workflow session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsession.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised first in the print workflow foreground session. This event exposes information about the print job but not the print content itself. Register for this event to do UI-dependent work on the print job before printing.
     * @type {TypedEventHandler<PrintWorkflowForegroundSession, PrintWorkflowForegroundSetupRequestedEventArgs>}
    */
    OnSetupRequested {
        get {
            if(!this.HasProp("__OnSetupRequested")){
                this.__OnSetupRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d85b48f0-960b-5f65-98b1-5f9b09feb2f6}"),
                    PrintWorkflowForegroundSession,
                    PrintWorkflowForegroundSetupRequestedEventArgs
                )
                this.__OnSetupRequestedToken := this.add_SetupRequested(this.__OnSetupRequested.iface)
            }
            return this.__OnSetupRequested
        }
    }

    /**
     * Raised when the XPS print data is available to be read. This is done after the [SetupRequested](Printworkflowforegroundsession_setuprequested.md) event is raised. Register for this event to do UI-dependent work that requires displaying the print content.
     * @type {TypedEventHandler<PrintWorkflowForegroundSession, PrintWorkflowXpsDataAvailableEventArgs>}
    */
    OnXpsDataAvailable {
        get {
            if(!this.HasProp("__OnXpsDataAvailable")){
                this.__OnXpsDataAvailable := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6d38ab29-2bb3-5849-80cd-ece13a589d13}"),
                    PrintWorkflowForegroundSession,
                    PrintWorkflowXpsDataAvailableEventArgs
                )
                this.__OnXpsDataAvailableToken := this.add_XpsDataAvailable(this.__OnXpsDataAvailable.iface)
            }
            return this.__OnXpsDataAvailable
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

        if(this.HasProp("__OnXpsDataAvailableToken")) {
            this.remove_XpsDataAvailable(this.__OnXpsDataAvailableToken)
            this.__OnXpsDataAvailable.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowForegroundSession, PrintWorkflowForegroundSetupRequestedEventArgs>} setupEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SetupRequested(setupEventHandler) {
        if (!this.HasProp("__IPrintWorkflowForegroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSession := IPrintWorkflowForegroundSession(outPtr)
        }

        return this.__IPrintWorkflowForegroundSession.add_SetupRequested(setupEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SetupRequested(token) {
        if (!this.HasProp("__IPrintWorkflowForegroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSession := IPrintWorkflowForegroundSession(outPtr)
        }

        return this.__IPrintWorkflowForegroundSession.remove_SetupRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowForegroundSession, PrintWorkflowXpsDataAvailableEventArgs>} xpsDataAvailableEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_XpsDataAvailable(xpsDataAvailableEventHandler) {
        if (!this.HasProp("__IPrintWorkflowForegroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSession := IPrintWorkflowForegroundSession(outPtr)
        }

        return this.__IPrintWorkflowForegroundSession.add_XpsDataAvailable(xpsDataAvailableEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_XpsDataAvailable(token) {
        if (!this.HasProp("__IPrintWorkflowForegroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSession := IPrintWorkflowForegroundSession(outPtr)
        }

        return this.__IPrintWorkflowForegroundSession.remove_XpsDataAvailable(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPrintWorkflowForegroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSession := IPrintWorkflowForegroundSession(outPtr)
        }

        return this.__IPrintWorkflowForegroundSession.get_Status()
    }

    /**
     * Starts the print workflow foreground process. The events of this class are raised in sequential order.
     * @remarks
     * This method should be called once the events of this class have been registered for by the appropriate handlers.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowforegroundsession.start
     */
    Start() {
        if (!this.HasProp("__IPrintWorkflowForegroundSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowForegroundSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowForegroundSession := IPrintWorkflowForegroundSession(outPtr)
        }

        return this.__IPrintWorkflowForegroundSession.Start()
    }

;@endregion Instance Methods
}
