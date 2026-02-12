#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowSourceContent.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents raw print data from the source application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsourcecontent
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowSourceContent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowSourceContent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowSourceContent.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the print ticket for the printing task associated with this print data.
     * @returns {IAsyncOperation<WorkflowPrintTicket>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsourcecontent.getjobprintticketasync
     */
    GetJobPrintTicketAsync() {
        if (!this.HasProp("__IPrintWorkflowSourceContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSourceContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSourceContent := IPrintWorkflowSourceContent(outPtr)
        }

        return this.__IPrintWorkflowSourceContent.GetJobPrintTicketAsync()
    }

    /**
     * Gets the print data as an XPS data stream.
     * @returns {PrintWorkflowSpoolStreamContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsourcecontent.getsourcespooldataasstreamcontent
     */
    GetSourceSpoolDataAsStreamContent() {
        if (!this.HasProp("__IPrintWorkflowSourceContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSourceContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSourceContent := IPrintWorkflowSourceContent(outPtr)
        }

        return this.__IPrintWorkflowSourceContent.GetSourceSpoolDataAsStreamContent()
    }

    /**
     * Gets the print data in the form of the COM-friendly XPS object model.
     * @returns {PrintWorkflowObjectModelSourceFileContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsourcecontent.getsourcespooldataasxpsobjectmodel
     */
    GetSourceSpoolDataAsXpsObjectModel() {
        if (!this.HasProp("__IPrintWorkflowSourceContent")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSourceContent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSourceContent := IPrintWorkflowSourceContent(outPtr)
        }

        return this.__IPrintWorkflowSourceContent.GetSourceSpoolDataAsXpsObjectModel()
    }

;@endregion Instance Methods
}
