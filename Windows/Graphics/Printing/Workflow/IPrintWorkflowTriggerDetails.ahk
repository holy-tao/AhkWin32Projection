#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowBackgroundSession.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{5739d868-9d86-4052-b0cb-f310becd59bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrintWorkflowSession"]

    /**
     * @type {PrintWorkflowBackgroundSession} 
     */
    PrintWorkflowSession {
        get => this.get_PrintWorkflowSession()
    }

    /**
     * 
     * @returns {PrintWorkflowBackgroundSession} 
     */
    get_PrintWorkflowSession() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowBackgroundSession(value)
    }
}
