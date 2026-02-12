#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPdlDataAvailableEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info for the [PdlDataAvailable](printworkflowjobuisession_pdldataavailable.md) event.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdldataavailableeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPdlDataAvailableEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPdlDataAvailableEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPdlDataAvailableEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets printer job and session related information for the current operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdldataavailableeventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the printer job for the current operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdldataavailableeventargs.printerjob
     * @type {PrintWorkflowPrinterJob} 
     */
    PrinterJob {
        get => this.get_PrinterJob()
    }

    /**
     * Gets the source page description language (PDL) content for the current job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdldataavailableeventargs.sourcecontent
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
        if (!this.HasProp("__IPrintWorkflowPdlDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlDataAvailableEventArgs := IPrintWorkflowPdlDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlDataAvailableEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {PrintWorkflowPrinterJob} 
     */
    get_PrinterJob() {
        if (!this.HasProp("__IPrintWorkflowPdlDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlDataAvailableEventArgs := IPrintWorkflowPdlDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlDataAvailableEventArgs.get_PrinterJob()
    }

    /**
     * 
     * @returns {PrintWorkflowPdlSourceContent} 
     */
    get_SourceContent() {
        if (!this.HasProp("__IPrintWorkflowPdlDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlDataAvailableEventArgs := IPrintWorkflowPdlDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlDataAvailableEventArgs.get_SourceContent()
    }

    /**
     * Requests that the operation be delayed and gets a deferral object that will be invoked upon completion of the deferred action.
     * @remarks
     * The operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdldataavailableeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowPdlDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlDataAvailableEventArgs := IPrintWorkflowPdlDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlDataAvailableEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
