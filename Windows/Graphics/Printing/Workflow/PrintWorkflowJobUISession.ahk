#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowJobUISession.ahk
#Include .\IPrintWorkflowJobUISession2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintWorkflowJobUISession.ahk
#Include .\PrintWorkflowPdlDataAvailableEventArgs.ahk
#Include .\PrintWorkflowJobNotificationEventArgs.ahk
#Include .\PrintWorkflowVirtualPrinterUIEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a session of the print support workflow UI.
 * @remarks
 * To create a print support workflow UI extension, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportJobUI** in its package manifest. When the app is activated, the `OnActivated` method receives a [PrintWorkflowJobActivatedEventArgs](printworkflowjobactivatedeventargs.md) object that provides access to information about the print support workflow UI session. The [Session](printworkflowjobactivatedeventargs_session.md) property of that object returns a **PrintWorkflowJobUISession** object.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobuisession
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobUISession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowJobUISession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowJobUISession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the current print support workflow UI session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobuisession.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised when the background process invokes the print support workflow UI when modifying page description language (PDL) data.
     * @type {TypedEventHandler<PrintWorkflowJobUISession, PrintWorkflowPdlDataAvailableEventArgs>}
    */
    OnPdlDataAvailable {
        get {
            if(!this.HasProp("__OnPdlDataAvailable")){
                this.__OnPdlDataAvailable := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5a185747-96bc-50ea-8d97-5a7d9e1c93ef}"),
                    PrintWorkflowJobUISession,
                    PrintWorkflowPdlDataAvailableEventArgs
                )
                this.__OnPdlDataAvailableToken := this.add_PdlDataAvailable(this.__OnPdlDataAvailable.iface)
            }
            return this.__OnPdlDataAvailable
        }
    }

    /**
     * Raised when a user clicks a job notification toast.
     * @type {TypedEventHandler<PrintWorkflowJobUISession, PrintWorkflowJobNotificationEventArgs>}
    */
    OnJobNotification {
        get {
            if(!this.HasProp("__OnJobNotification")){
                this.__OnJobNotification := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{91a4746d-7840-5f88-97d6-ee39c5afb6e0}"),
                    PrintWorkflowJobUISession,
                    PrintWorkflowJobNotificationEventArgs
                )
                this.__OnJobNotificationToken := this.add_JobNotification(this.__OnJobNotification.iface)
            }
            return this.__OnJobNotification
        }
    }

    /**
     * Raised when a virtual printer endpoint background process invokes the print support workflow UI when data is available.
     * @type {TypedEventHandler<PrintWorkflowJobUISession, PrintWorkflowVirtualPrinterUIEventArgs>}
    */
    OnVirtualPrinterUIDataAvailable {
        get {
            if(!this.HasProp("__OnVirtualPrinterUIDataAvailable")){
                this.__OnVirtualPrinterUIDataAvailable := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8174fe97-12e1-5d8a-b02d-783dbd7e92a5}"),
                    PrintWorkflowJobUISession,
                    PrintWorkflowVirtualPrinterUIEventArgs
                )
                this.__OnVirtualPrinterUIDataAvailableToken := this.add_VirtualPrinterUIDataAvailable(this.__OnVirtualPrinterUIDataAvailable.iface)
            }
            return this.__OnVirtualPrinterUIDataAvailable
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPdlDataAvailableToken")) {
            this.remove_PdlDataAvailable(this.__OnPdlDataAvailableToken)
            this.__OnPdlDataAvailable.iface.Dispose()
        }

        if(this.HasProp("__OnJobNotificationToken")) {
            this.remove_JobNotification(this.__OnJobNotificationToken)
            this.__OnJobNotification.iface.Dispose()
        }

        if(this.HasProp("__OnVirtualPrinterUIDataAvailableToken")) {
            this.remove_VirtualPrinterUIDataAvailable(this.__OnVirtualPrinterUIDataAvailableToken)
            this.__OnVirtualPrinterUIDataAvailable.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPrintWorkflowJobUISession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession := IPrintWorkflowJobUISession(outPtr)
        }

        return this.__IPrintWorkflowJobUISession.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobUISession, PrintWorkflowPdlDataAvailableEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PdlDataAvailable(handler) {
        if (!this.HasProp("__IPrintWorkflowJobUISession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession := IPrintWorkflowJobUISession(outPtr)
        }

        return this.__IPrintWorkflowJobUISession.add_PdlDataAvailable(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PdlDataAvailable(token) {
        if (!this.HasProp("__IPrintWorkflowJobUISession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession := IPrintWorkflowJobUISession(outPtr)
        }

        return this.__IPrintWorkflowJobUISession.remove_PdlDataAvailable(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobUISession, PrintWorkflowJobNotificationEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_JobNotification(handler) {
        if (!this.HasProp("__IPrintWorkflowJobUISession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession := IPrintWorkflowJobUISession(outPtr)
        }

        return this.__IPrintWorkflowJobUISession.add_JobNotification(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_JobNotification(token) {
        if (!this.HasProp("__IPrintWorkflowJobUISession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession := IPrintWorkflowJobUISession(outPtr)
        }

        return this.__IPrintWorkflowJobUISession.remove_JobNotification(token)
    }

    /**
     * Starts the print workflow job UI service so it can begin raising events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobuisession.start
     */
    Start() {
        if (!this.HasProp("__IPrintWorkflowJobUISession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession := IPrintWorkflowJobUISession(outPtr)
        }

        return this.__IPrintWorkflowJobUISession.Start()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowJobUISession, PrintWorkflowVirtualPrinterUIEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VirtualPrinterUIDataAvailable(handler) {
        if (!this.HasProp("__IPrintWorkflowJobUISession2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession2 := IPrintWorkflowJobUISession2(outPtr)
        }

        return this.__IPrintWorkflowJobUISession2.add_VirtualPrinterUIDataAvailable(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VirtualPrinterUIDataAvailable(token) {
        if (!this.HasProp("__IPrintWorkflowJobUISession2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobUISession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobUISession2 := IPrintWorkflowJobUISession2(outPtr)
        }

        return this.__IPrintWorkflowJobUISession2.remove_VirtualPrinterUIDataAvailable(token)
    }

;@endregion Instance Methods
}
