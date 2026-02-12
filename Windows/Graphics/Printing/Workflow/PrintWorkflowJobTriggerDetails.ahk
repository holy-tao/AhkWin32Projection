#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintWorkflowJobTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides additional information associated with a print workflow job session that runs in the background.
 * @remarks
 * To create a print support workflow, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportWorkflow** in its package manifest that specifies the entry point of a background task. When the background task is activated, the [IBackgroundTask.Run](/uwp/api/windows.applicationmodel.background.ibackgroundtask.run) method receives an [IBackgroundTaskInstance](/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance) object. You can cast the [TriggerDetails](windows.applicationmodel.background.ibackgroundtaskinstance.triggerdetails) property of this object to a **PrintWorkflowJobTriggerDetails** object to get more details about the print workflow job session.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobtriggerdetails
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintWorkflowJobTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintWorkflowJobTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the current session of the print workflow job.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobtriggerdetails.printworkflowjobsession
     * @type {PrintWorkflowJobBackgroundSession} 
     */
    PrintWorkflowJobSession {
        get => this.get_PrintWorkflowJobSession()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintWorkflowJobBackgroundSession} 
     */
    get_PrintWorkflowJobSession() {
        if (!this.HasProp("__IPrintWorkflowJobTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPrintWorkflowJobTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintWorkflowJobTriggerDetails := IPrintWorkflowJobTriggerDetails(outPtr)
        }

        return this.__IPrintWorkflowJobTriggerDetails.get_PrintWorkflowJobSession()
    }

;@endregion Instance Methods
}
