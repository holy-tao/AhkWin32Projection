#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowVirtualPrinterDataAvailableEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PrintWorkflowVirtualPrinterSession.VirtualPrinterDataAvailable](printworkflowvirtualprintersession_virtualprinterdataavailable.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowVirtualPrinterDataAvailableEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowVirtualPrinterDataAvailableEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [PrintWorkflowConfiguration](printworkflowconfiguration.md) object that contains information about the current virtual print job and session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the source page description language (PDL) content for the current virtual printer job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.sourcecontent
     * @type {PrintWorkflowPdlSourceContent} 
     */
    SourceContent {
        get => this.get_SourceContent()
    }

    /**
     * Gets an object that can show a UI for gathering user input that the virtual print workflow app needs to complete the conversion to the page description language (PDL) format indicated by the printer.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.uilauncher
     * @type {PrintWorkflowUILauncher} 
     */
    UILauncher {
        get => this.get_UILauncher()
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
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {PrintWorkflowPdlSourceContent} 
     */
    get_SourceContent() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.get_SourceContent()
    }

    /**
     * 
     * @returns {PrintWorkflowUILauncher} 
     */
    get_UILauncher() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.get_UILauncher()
    }

    /**
     * Gets the XML PrintTicket document for the current virtual print job. The PrintTicket document contains instructions on how the printer should set its various features for a printing task.
     * @returns {WorkflowPrintTicket} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.getjobprintticket
     */
    GetJobPrintTicket() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.GetJobPrintTicket()
    }

    /**
     * Gets the page description language (PDL) converter for the specified conversion type for the virtual print job.
     * @param {Integer} conversionType A value from the [PrintWorkflowPdlConversionType](printworkflowpdlconversiontype.md) enumeration that indicates the PDL conversion type.
     * @returns {PrintWorkflowPdlConverter} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.getpdlconverter
     */
    GetPdlConverter(conversionType) {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.GetPdlConverter(conversionType)
    }

    /**
     * Gets a [StorageFile](/uwp/api/windows.storage.storagefile) representing the target file for the virtual print job.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.gettargetfileasync
     */
    GetTargetFileAsync() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.GetTargetFileAsync()
    }

    /**
     * Completes the virtual printer job with the specified status.
     * @param {Integer} status_ A member of the [PrintWorkflowSubmittedStatus](printworkflowsubmittedstatus.md) enumeration indicating the status of the completed virtual printer job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprinterdataavailableeventargs.completejob
     */
    CompleteJob(status_) {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs := IPrintWorkflowVirtualPrinterDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterDataAvailableEventArgs.CompleteJob(status_)
    }

;@endregion Instance Methods
}
