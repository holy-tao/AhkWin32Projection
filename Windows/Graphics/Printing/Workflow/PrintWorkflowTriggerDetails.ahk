#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents contextual information about the triggering of a print workflow background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowtriggerdetails
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the print workflow session object that should manage the behavior of the background task that was triggered.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowtriggerdetails.printworkflowsession
     * @type {PrintWorkflowBackgroundSession} 
     */
    PrintWorkflowSession {
        get => this.get_PrintWorkflowSession()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowBackgroundSession} 
     */
    get_PrintWorkflowSession() {
        if (!this.HasProp("__IPrintWorkflowTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowTriggerDetails := IPrintWorkflowTriggerDetails(outPtr)
        }

        return this.__IPrintWorkflowTriggerDetails.get_PrintWorkflowSession()
    }

;@endregion Instance Methods
}
