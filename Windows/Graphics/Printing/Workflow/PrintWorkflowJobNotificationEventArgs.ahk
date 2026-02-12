#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowJobNotificationEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info for the [JobNotification](printworkflowjobuisession_jobnotification.md) event.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobnotificationeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobNotificationEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowJobNotificationEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowJobNotificationEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets printer job and session related information for the current operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobnotificationeventargs.configuration
     * @type {PrintWorkflowConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the printer job for the current operation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobnotificationeventargs.printerjob
     * @type {PrintWorkflowPrinterJob} 
     */
    PrinterJob {
        get => this.get_PrinterJob()
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
        if (!this.HasProp("__IPrintWorkflowJobNotificationEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobNotificationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobNotificationEventArgs := IPrintWorkflowJobNotificationEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobNotificationEventArgs.get_Configuration()
    }

    /**
     * 
     * @returns {PrintWorkflowPrinterJob} 
     */
    get_PrinterJob() {
        if (!this.HasProp("__IPrintWorkflowJobNotificationEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobNotificationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobNotificationEventArgs := IPrintWorkflowJobNotificationEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobNotificationEventArgs.get_PrinterJob()
    }

    /**
     * Requests that the operation be delayed and gets a deferral object that will be invoked upon completion of the deferred action.
     * @remarks
     * The operation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobnotificationeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowJobNotificationEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobNotificationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobNotificationEventArgs := IPrintWorkflowJobNotificationEventArgs(outPtr)
        }

        return this.__IPrintWorkflowJobNotificationEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
