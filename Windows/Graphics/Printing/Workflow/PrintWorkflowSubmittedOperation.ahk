#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowSubmittedOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a print task that has potentially been modified by a print workflow session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedoperation
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowSubmittedOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowSubmittedOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowSubmittedOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the source application, print job title, and session ID for this print workflow session.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedoperation.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the source application's original XPS data. This can be edited and then assigned to the print target in order to change the print content.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedoperation.xpscontent
     * @type {PrintWorkflowSourceContent} 
     */
    XpsContent {
        get => this.get_XpsContent()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates the completion of the print workflow session. This method should be called in the handler for the [PrintWorkflowBackgroundSession.Submitted](PrintWorkflowBackgroundSession_Submitted.md) event when all work relating to the print task has been completed or when an error occurred that requires the process to be aborted.
     * @remarks
     * This method marks the end of the print workflow session and therefore should only be called once.
     * @param {Integer} status_ Indicates the status of the completed print workflow procedure. This will determine whether the printing pipeline should continue or abort.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedoperation.complete
     */
    Complete(status_) {
        if (!this.HasProp("__IPrintWorkflowSubmittedOperation")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSubmittedOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSubmittedOperation := IPrintWorkflowSubmittedOperation(outPtr)
        }

        return this.__IPrintWorkflowSubmittedOperation.Complete(status_)
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintWorkflowSubmittedOperation")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSubmittedOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSubmittedOperation := IPrintWorkflowSubmittedOperation(outPtr)
        }

        return this.__IPrintWorkflowSubmittedOperation.get_Configuration()
    }

    /**
     * 
     * @returns {PrintWorkflowSourceContent} 
     */
    get_XpsContent() {
        if (!this.HasProp("__IPrintWorkflowSubmittedOperation")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowSubmittedOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowSubmittedOperation := IPrintWorkflowSubmittedOperation(outPtr)
        }

        return this.__IPrintWorkflowSubmittedOperation.get_XpsContent()
    }

;@endregion Instance Methods
}
