#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowVirtualPrinterUIEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PrintWorkflowJobUISession.VirtualPrinterUIDataAvailable](printworkflowjobuisession_virtualprinteruidataavailable.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinteruieventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowVirtualPrinterUIEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowVirtualPrinterUIEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowVirtualPrinterUIEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [PrintWorkflowConfiguration](printworkflowconfiguration.md) object that contains information about the current virtual print job and session in the print support UI context.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinteruieventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets an [IppPrintDevice](C../windows.devices.printers/ippprintdevice.md) object representing the IPP printer associated with the virtual printer session in the print support UI context.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinteruieventargs.printer
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * Gets the source page description language (PDL) content for the current virtual printer job in the print support UI context.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinteruieventargs.sourcecontent
     * @type {PrintWorkflowPdlSourceContent} 
     */
    SourceContent {
        get => this.get_SourceContent()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterUIEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterUIEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterUIEventArgs := IPrintWorkflowVirtualPrinterUIEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterUIEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterUIEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterUIEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterUIEventArgs := IPrintWorkflowVirtualPrinterUIEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterUIEventArgs.get_Printer()
    }

    /**
     * 
     * @returns {PrintWorkflowPdlSourceContent} 
     */
    get_SourceContent() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterUIEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterUIEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterUIEventArgs := IPrintWorkflowVirtualPrinterUIEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterUIEventArgs.get_SourceContent()
    }

    /**
     * Gets the XML PrintTicket document for the current virtual print job in the print support UI context. The PrintTicket document contains instructions on how the printer should set its various features for a printing task.
     * @returns {WorkflowPrintTicket} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinteruieventargs.getjobprintticket
     */
    GetJobPrintTicket() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterUIEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterUIEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterUIEventArgs := IPrintWorkflowVirtualPrinterUIEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterUIEventArgs.GetJobPrintTicket()
    }

    /**
     * Informs the system that the resource response task might continue to perform work after the [PrintWorkflowJobUISession.VirtualPrinterUIDataAvailable](printworkflowjobuisession_virtualprinteruidataavailable.md) handler returns.
     * @remarks
     * The print job operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinteruieventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterUIEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterUIEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterUIEventArgs := IPrintWorkflowVirtualPrinterUIEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterUIEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
