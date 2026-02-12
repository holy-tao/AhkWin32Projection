#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowPrinterJob.ahk
#Include .\IPrintWorkflowPrinterJob2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a printer job in the context of a print workflow app.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPrinterJob extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowPrinterJob

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowPrinterJob.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the current print job as provided by the printer.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.jobid
     * @type {Integer} 
     */
    JobId {
        get => this.get_JobId()
    }

    /**
     * Gets the Internet Printing Protocol (IPP) printer device for the current printer job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.printer
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobId() {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.get_JobId()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.get_Printer()
    }

    /**
     * Gets the status of the current printer job.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.getjobstatus
     */
    GetJobStatus() {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.GetJobStatus()
    }

    /**
     * Gets the XML PrintTicket document for the current print job. The PrintTicket document contains instructions on how the printer should set its various features for a printing task.
     * @returns {WorkflowPrintTicket} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.getjobprintticket
     */
    GetJobPrintTicket() {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.GetJobPrintTicket()
    }

    /**
     * Gets attributes for the current printer job as specified by a buffer that contains a printer attributes group from a serialized Internet Printing Protocol (IPP) response.
     * @param {IIterable<HSTRING>} attributeNames The names of the IPP attributes to retrieve.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.getjobattributesasbuffer
     */
    GetJobAttributesAsBuffer(attributeNames) {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.GetJobAttributesAsBuffer(attributeNames)
    }

    /**
     * Gets attributes for the current printer job as a map of Internet Printing Protocol (IPP) attribute name and value pairs.
     * @param {IIterable<HSTRING>} attributeNames The names of the IPP attributes to retrieve.
     * @returns {IMap<HSTRING, IppAttributeValue>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.getjobattributes
     */
    GetJobAttributes(attributeNames) {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.GetJobAttributes(attributeNames)
    }

    /**
     * Sets attributes for the current printer job as specified by the specified buffer that contains a serialized Internet Printing Protocol (IPP) job attribute group.
     * @param {IBuffer} jobAttributesBuffer A serialized IPP job attribute group, as per the definition in the IPP specification.
     * @returns {IppSetAttributesResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.setjobattributesfrombuffer
     */
    SetJobAttributesFromBuffer(jobAttributesBuffer) {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.SetJobAttributesFromBuffer(jobAttributesBuffer)
    }

    /**
     * Sets attributes for the current printer job as specified by the specified map of Internet Printing Protocol (IPP) attribute name and value pairs.
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} jobAttributes A map of IPP attribute name and value pairs.
     * @returns {IppSetAttributesResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.setjobattributes
     */
    SetJobAttributes(jobAttributes) {
        if (!this.HasProp("__IPrintWorkflowPrinterJob")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob := IPrintWorkflowPrinterJob(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob.SetJobAttributes(jobAttributes)
    }

    /**
     * Converts a [WorkflowPrintTicket](../windows.graphics.printing.printticket/workflowprintticket.md) to Internet Printing Protocol (IPP) job attributes.
     * @param {WorkflowPrintTicket} printTicket The **WorkflowPrintTicket** to be converted.
     * @param {HSTRING} targetPdlFormat A string specifying the target PDL format
     * @returns {IMap<HSTRING, IppAttributeValue>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjob.convertprinttickettojobattributes
     */
    ConvertPrintTicketToJobAttributes(printTicket, targetPdlFormat) {
        if (!this.HasProp("__IPrintWorkflowPrinterJob2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowPrinterJob2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowPrinterJob2 := IPrintWorkflowPrinterJob2(outPtr)
        }

        return this.__IPrintWorkflowPrinterJob2.ConvertPrintTicketToJobAttributes(printTicket, targetPdlFormat)
    }

;@endregion Instance Methods
}
