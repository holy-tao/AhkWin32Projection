#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPdlModificationRequestedEventArgs.ahk
#Include .\IPrintWorkflowPdlModificationRequestedEventArgs2.ahk
#Include .\IPrintWorkflowPdlModificationRequestedEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info for the [PdlModificationRequested](printworkflowjobbackgroundsession_pdlmodificationrequested.md) event.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPdlModificationRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPdlModificationRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPdlModificationRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets printer job and session related information for the current page description language (PDL) conversion operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the printer job for the current page description language (PDL) conversion operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.printerjob
     * @type {PrintWorkflowPrinterJob} 
     */
    PrinterJob {
        get => this.get_PrinterJob()
    }

    /**
     * Gets the source page description language (PDL) content for the current job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.sourcecontent
     * @type {PrintWorkflowPdlSourceContent} 
     */
    SourceContent {
        get => this.get_SourceContent()
    }

    /**
     * Gets an object that can show a UI for gathering user input that the print workflow app needs to complete the conversion to the page description language (PDL) format indicated by the printer.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.uilauncher
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
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {PrintWorkflowPrinterJob} 
     */
    get_PrinterJob() {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.get_PrinterJob()
    }

    /**
     * 
     * @returns {PrintWorkflowPdlSourceContent} 
     */
    get_SourceContent() {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.get_SourceContent()
    }

    /**
     * 
     * @returns {PrintWorkflowUILauncher} 
     */
    get_UILauncher() {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.get_UILauncher()
    }

    /**
     * Creates a job on the printer.
     * @param {HSTRING} targetContentType The target content type for the job.
     * @returns {PrintWorkflowPdlTargetStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.createjobonprinter
     */
    CreateJobOnPrinter(targetContentType) {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.CreateJobOnPrinter(targetContentType)
    }

    /**
     * Creates a job on the printer with initial job attributes from the specified list.
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} jobAttributes A list of Internet Printing Protocol (IPP) job attributes, as per the definition in the IPP specification.
     * @param {HSTRING} targetContentType The target content type for the job.
     * @returns {PrintWorkflowPdlTargetStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.createjobonprinterwithattributes
     */
    CreateJobOnPrinterWithAttributes(jobAttributes, targetContentType) {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.CreateJobOnPrinterWithAttributes(jobAttributes, targetContentType)
    }

    /**
     * Creates a job on the printer with initial job attributes from the specified buffer.
     * @param {IBuffer} jobAttributesBuffer A serialized Internet Printing Protocol (IPP) job attribute group, as per the definition in the IPP specification.
     * @param {HSTRING} targetContentType The target content type for the job.
     * @returns {PrintWorkflowPdlTargetStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.createjobonprinterwithattributesbuffer
     */
    CreateJobOnPrinterWithAttributesBuffer(jobAttributesBuffer, targetContentType) {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.CreateJobOnPrinterWithAttributesBuffer(jobAttributesBuffer, targetContentType)
    }

    /**
     * Gets the page description language (PDL) converter for the specified conversion type.
     * @param {Integer} conversionType A value from the [PrintWorkflowPdlConversionType](printworkflowpdlconversiontype.md) enumeration that indicates the PDL conversion type.
     * @returns {PrintWorkflowPdlConverter} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.getpdlconverter
     */
    GetPdlConverter(conversionType) {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.GetPdlConverter(conversionType)
    }

    /**
     * Requests that the page description language (PDL) conversion operation be delayed and gets a deferral object that will be invoked upon completion of the deferred action.
     * @remarks
     * The PDL conversion operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs := IPrintWorkflowPdlModificationRequestedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs.GetDeferral()
    }

    /**
     * Creates a job on the printer with initial job attributes from the specified list.
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} jobAttributes A list of Internet Printing Protocol (IPP) job attributes, as per the definition in the IPP specification.
     * @param {HSTRING} targetContentType The target content type for the job.
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} operationAttributes 
     * @param {Integer} jobAttributesMergePolicy 
     * @param {Integer} operationAttributesMergePolicy 
     * @returns {PrintWorkflowPdlTargetStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.createjobonprinterwithattributes
     */
    CreateJobOnPrinterWithAttributes1(jobAttributes, targetContentType, operationAttributes, jobAttributesMergePolicy, operationAttributesMergePolicy) {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs2 := IPrintWorkflowPdlModificationRequestedEventArgs2(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs2.CreateJobOnPrinterWithAttributes(jobAttributes, targetContentType, operationAttributes, jobAttributesMergePolicy, operationAttributesMergePolicy)
    }

    /**
     * Creates a job on the printer with initial job attributes from the specified buffer.
     * @param {IBuffer} jobAttributesBuffer A serialized Internet Printing Protocol (IPP) job attribute group, as per the definition in the IPP specification.
     * @param {HSTRING} targetContentType The target content type for the job.
     * @param {IBuffer} operationAttributesBuffer 
     * @param {Integer} jobAttributesMergePolicy 
     * @param {Integer} operationAttributesMergePolicy 
     * @returns {PrintWorkflowPdlTargetStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowpdlmodificationrequestedeventargs.createjobonprinterwithattributesbuffer
     */
    CreateJobOnPrinterWithAttributesBuffer1(jobAttributesBuffer, targetContentType, operationAttributesBuffer, jobAttributesMergePolicy, operationAttributesMergePolicy) {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs2 := IPrintWorkflowPdlModificationRequestedEventArgs2(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs2.CreateJobOnPrinterWithAttributesBuffer(jobAttributesBuffer, targetContentType, operationAttributesBuffer, jobAttributesMergePolicy, operationAttributesMergePolicy)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableIppCompressionForJob() {
        if (!this.HasProp("__IPrintWorkflowPdlModificationRequestedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPdlModificationRequestedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPdlModificationRequestedEventArgs3 := IPrintWorkflowPdlModificationRequestedEventArgs3(outPtr)
        }

        return this.__IPrintWorkflowPdlModificationRequestedEventArgs3.DisableIppCompressionForJob()
    }

;@endregion Instance Methods
}
