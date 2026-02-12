#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowConfiguration2.ahk
#Include .\IPrintWorkflowConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about the source application, print job title, and session ID for a print workflow session.
 * @remarks
 * This class presents the same session-specific information to both the background and foreground components of a print workflow app.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowconfiguration
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowConfiguration2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowConfiguration2.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name of the external application that initiated the print job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowconfiguration.sourceappdisplayname
     * @type {HSTRING} 
     */
    SourceAppDisplayName {
        get => this.get_SourceAppDisplayName()
    }

    /**
     * Gets the job title for this print job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowconfiguration.jobtitle
     * @type {HSTRING} 
     */
    JobTitle {
        get => this.get_JobTitle()
    }

    /**
     * Gets the session ID for this print job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowconfiguration.sessionid
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Cancels the current print workflow with the specified reason. This method also cancels the corresponding print job in the print device, if already created.
     * @param {Integer} reason The reason for canceling the print workflow.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowconfiguration.abortprintflow
     */
    AbortPrintFlow(reason) {
        if (!this.HasProp("__IPrintWorkflowConfiguration2")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowConfiguration2 := IPrintWorkflowConfiguration2(outPtr)
        }

        return this.__IPrintWorkflowConfiguration2.AbortPrintFlow(reason)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceAppDisplayName() {
        if (!this.HasProp("__IPrintWorkflowConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowConfiguration := IPrintWorkflowConfiguration(outPtr)
        }

        return this.__IPrintWorkflowConfiguration.get_SourceAppDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JobTitle() {
        if (!this.HasProp("__IPrintWorkflowConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowConfiguration := IPrintWorkflowConfiguration(outPtr)
        }

        return this.__IPrintWorkflowConfiguration.get_JobTitle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        if (!this.HasProp("__IPrintWorkflowConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowConfiguration := IPrintWorkflowConfiguration(outPtr)
        }

        return this.__IPrintWorkflowConfiguration.get_SessionId()
    }

;@endregion Instance Methods
}
