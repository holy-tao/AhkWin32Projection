#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowVirtualPrinterTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the details provided upon invocation of a virtual printer endpoint print support background task.
 * @remarks
 * An instance of this class is passed to the background task in its [Run](/uwp/api/windows.applicationmodel.background.ibackgroundtask.run?view=winrt-26100#windows-applicationmodel-background-ibackgroundtask-run(windows-applicationmodel-background-ibackgroundtaskinstance)) method.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprintertriggerdetails
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowVirtualPrinterTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowVirtualPrinterTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowVirtualPrinterTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [PrintWorkflowVirtualPrinterSession](printworkflowvirtualprintersession.md) object representing the virtual printer session associated with the background task invocation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowvirtualprintertriggerdetails.virtualprintersession
     * @type {PrintWorkflowVirtualPrinterSession} 
     */
    VirtualPrinterSession {
        get => this.get_VirtualPrinterSession()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowVirtualPrinterSession} 
     */
    get_VirtualPrinterSession() {
        if (!this.HasProp("__IPrintWorkflowVirtualPrinterTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowVirtualPrinterTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowVirtualPrinterTriggerDetails := IPrintWorkflowVirtualPrinterTriggerDetails(outPtr)
        }

        return this.__IPrintWorkflowVirtualPrinterTriggerDetails.get_VirtualPrinterSession()
    }

;@endregion Instance Methods
}
