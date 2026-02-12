#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowXpsDataAvailableEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a [PrintWorkflowForegroundSession.XpsDataAvailable](PrintWorkflowForegroundSession_XpsDataAvailable.md) event that was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowxpsdataavailableeventargs
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowXpsDataAvailableEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowXpsDataAvailableEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowXpsDataAvailableEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the current print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowxpsdataavailableeventargs.operation
     * @type {PrintWorkflowSubmittedOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowSubmittedOperation} 
     */
    get_Operation() {
        if (!this.HasProp("__IPrintWorkflowXpsDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowXpsDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowXpsDataAvailableEventArgs := IPrintWorkflowXpsDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowXpsDataAvailableEventArgs.get_Operation()
    }

    /**
     * Gets a deferral object for managing the work done on the corresponding [PrintWorkflowForegroundSession.XpsDataAvailable](PrintWorkflowForegroundSession_XpsDataAvailable.md) event.
     * @remarks
     * A deferral should be used if any asynchronous work is being done in this event handler, so that the next event in the sequence isn't raised until this work is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowxpsdataavailableeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintWorkflowXpsDataAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowXpsDataAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowXpsDataAvailableEventArgs := IPrintWorkflowXpsDataAvailableEventArgs(outPtr)
        }

        return this.__IPrintWorkflowXpsDataAvailableEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
