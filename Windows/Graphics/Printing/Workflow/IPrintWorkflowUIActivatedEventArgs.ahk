#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowForegroundSession.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowUIActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowUIActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{bc8a844d-09eb-5746-72a6-8dc8b5edbe9b}")

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
     * @type {PrintWorkflowForegroundSession} 
     */
    PrintWorkflowSession {
        get => this.get_PrintWorkflowSession()
    }

    /**
     * 
     * @returns {PrintWorkflowForegroundSession} 
     */
    get_PrintWorkflowSession() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowForegroundSession(value)
    }
}
