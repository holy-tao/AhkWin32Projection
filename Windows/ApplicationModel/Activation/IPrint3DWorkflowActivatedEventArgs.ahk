#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Printers\Extensions\Print3DWorkflow.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an event that occurs when the app is launched as a workflow for three-dimensional printing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprint3dworkflowactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IPrint3DWorkflowActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DWorkflowActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3f57e78b-f2ac-4619-8302-ef855e1c9b90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Workflow"]

    /**
     * Gets the workflow that the app should use for three-dimensional printing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprint3dworkflowactivatedeventargs.workflow
     * @type {Print3DWorkflow} 
     */
    Workflow {
        get => this.get_Workflow()
    }

    /**
     * 
     * @returns {Print3DWorkflow} 
     */
    get_Workflow() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Print3DWorkflow(value)
    }
}
