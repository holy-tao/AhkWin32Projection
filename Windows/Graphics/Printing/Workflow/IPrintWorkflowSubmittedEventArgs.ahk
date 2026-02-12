#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowSubmittedOperation.ahk
#Include .\PrintWorkflowTarget.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowSubmittedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowSubmittedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3add0a41-3794-5569-5c87-40e8ff720f83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Operation", "GetTarget", "GetDeferral"]

    /**
     * @type {PrintWorkflowSubmittedOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * 
     * @returns {PrintWorkflowSubmittedOperation} 
     */
    get_Operation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowSubmittedOperation(value)
    }

    /**
     * 
     * @param {WorkflowPrintTicket} jobPrintTicket 
     * @returns {PrintWorkflowTarget} 
     */
    GetTarget(jobPrintTicket) {
        result := ComCall(7, this, "ptr", jobPrintTicket, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowTarget(result_)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
