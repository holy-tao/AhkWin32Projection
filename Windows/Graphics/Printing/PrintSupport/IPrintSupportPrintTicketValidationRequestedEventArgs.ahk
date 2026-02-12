#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintTicketValidationRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintTicketValidationRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{338e4e69-db55-55c7-8338-ef64680a8f90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrintTicket", "SetPrintTicketValidationStatus", "GetDeferral"]

    /**
     * @type {WorkflowPrintTicket} 
     */
    PrintTicket {
        get => this.get_PrintTicket()
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_PrintTicket() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(value)
    }

    /**
     * 
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     */
    SetPrintTicketValidationStatus(status_) {
        result := ComCall(7, this, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
