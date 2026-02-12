#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowJobIssueDetectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PrintWorkflowJobBackgroundSession.JobIssueDetected](printworkflowjobbackgroundsession_jobissuedetected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobIssueDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowJobIssueDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowJobIssueDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of issue that was detected in a printer job operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.jobissuekind
     * @type {Integer} 
     */
    JobIssueKind {
        get => this.get_JobIssueKind()
    }

    /**
     * Gets the extended error associated with the issue that was detected in a printer job operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets a sets a value that specifies whether the default system toast notification for the printer job issue should be skipped.
     * @remarks
     * Setting this property to true in the handler for [PrintWorkflowJobBackgroundSession.JobIssueDetected](printworkflowjobbackgroundsession_jobissuedetected.md) enables apps to launch their own custom toast notification without the user receiving redundant notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.skipsystemerrortoast
     * @type {Boolean} 
     */
    SkipSystemErrorToast {
        get => this.get_SkipSystemErrorToast()
        set => this.put_SkipSystemErrorToast(value)
    }

    /**
     * Gets a [PrintWorkflowPrinterJob](printworkflowprinterjob.md) object representing the printer job operation in which the issue was encountered.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.printerjob
     * @type {PrintWorkflowPrinterJob} 
     */
    PrinterJob {
        get => this.get_PrinterJob()
    }

    /**
     * Gets a [PrintWorkflowConfiguration](printworkflowconfiguration.md) object that contains job and session related information.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the [PrintWorkflowUILauncher](printworkflowuilauncher.md) object that is used to launching the print support UI for job notification.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.uilauncher
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
     * @returns {Integer} 
     */
    get_JobIssueKind() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.get_JobIssueKind()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.get_ExtendedError()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SkipSystemErrorToast() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.get_SkipSystemErrorToast()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SkipSystemErrorToast(value) {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.put_SkipSystemErrorToast(value)
    }

    /**
     * 
     * @returns {PrintWorkflowPrinterJob} 
     */
    get_PrinterJob() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.get_PrinterJob()
    }

    /**
     * 
     * @returns {PrintWorkflowConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {PrintWorkflowUILauncher} 
     */
    get_UILauncher() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.get_UILauncher()
    }

    /**
     * Informs the system that the resource response task might continue to perform work after the [PrintWorkflowJobBackgroundSession.JobIssueDetected](printworkflowjobbackgroundsession_jobissuedetected.md) handler returns.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuedetectedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowJobIssueDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobIssueDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobIssueDetectedEventArgs := IPrintWorkflowJobIssueDetectedEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobIssueDetectedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
