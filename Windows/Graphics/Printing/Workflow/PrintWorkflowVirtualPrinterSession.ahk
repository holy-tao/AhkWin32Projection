#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowVirtualPrinterSession.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PrintWorkflowVirtualPrinterSession.ahk
#Include .\PrintWorkflowVirtualPrinterDataAvailableEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a virtual printer session.
 * @remarks
 * Get an instance of this class by accessing the [VirtualPrinterSession](printworkflowvirtualprintertriggerdetails_virtualprintersession.md) property of the [PrintWorkflowVirtualPrinterTriggerDetails](printworkflowvirtualprintertriggerdetails.md) object passed into the [Run](/uwp/api/windows.applicationmodel.background.ibackgroundtask.run?view=winrt-26100#windows-applicationmodel-background-ibackgroundtask-run(windows-applicationmodel-background-ibackgroundtaskinstance)) method of the background task.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprintersession
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowVirtualPrinterSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowVirtualPrinterSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowVirtualPrinterSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value from the [PrintWorkflowSessionStatus](printworkflowsessionstatus.md) enumeration indicating the status of the virtual printer session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprintersession.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets an [IppPrintDevice](C../windows.devices.printers/ippprintdevice.md) object representing the IPP printer associated with the virtual printer session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprintersession.printer
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * Raised when the page description language (PDL) data is available for modification.
     * @type {TypedEventHandler<PrintWorkflowVirtualPrinterSession, PrintWorkflowVirtualPrinterDataAvailableEventArgs>}
    */
    OnVirtualPrinterDataAvailable {
        get {
            if(!this.HasProp("__OnVirtualPrinterDataAvailable")){
                this.__OnVirtualPrinterDataAvailable := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d307fc90-bb1d-54a1-8678-961d92337bcf}"),
                    PrintWorkflowVirtualPrinterSession,
                    PrintWorkflowVirtualPrinterDataAvailableEventArgs
                )
                this.__OnVirtualPrinterDataAvailableToken := this.add_VirtualPrinterDataAvailable(this.__OnVirtualPrinterDataAvailable.iface)
            }
            return this.__OnVirtualPrinterDataAvailable
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVirtualPrinterDataAvailableToken")) {
            this.remove_VirtualPrinterDataAvailable(this.__OnVirtualPrinterDataAvailableToken)
            this.__OnVirtualPrinterDataAvailable.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterSession := IPrintWorkflowVirtualPrinterSession(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterSession.get_Status()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterSession := IPrintWorkflowVirtualPrinterSession(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterSession.get_Printer()
    }

    /**
     * 
     * @param {TypedEventHandler<PrintWorkflowVirtualPrinterSession, PrintWorkflowVirtualPrinterDataAvailableEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VirtualPrinterDataAvailable(handler) {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterSession := IPrintWorkflowVirtualPrinterSession(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterSession.add_VirtualPrinterDataAvailable(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VirtualPrinterDataAvailable(token) {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterSession := IPrintWorkflowVirtualPrinterSession(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterSession.remove_VirtualPrinterDataAvailable(token)
    }

    /**
     * Starts raising registered events of the virtual printer session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprintersession.start
     */
    Start() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterSession")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterSession := IPrintWorkflowVirtualPrinterSession(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterSession.Start()
    }

;@endregion Instance Methods
}
