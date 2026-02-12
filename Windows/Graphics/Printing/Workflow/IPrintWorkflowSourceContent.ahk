#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include .\PrintWorkflowSpoolStreamContent.ahk
#Include .\PrintWorkflowObjectModelSourceFileContent.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowSourceContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowSourceContent
     * @type {Guid}
     */
    static IID => Guid("{1a28c641-ceb1-4533-bb73-fbe63eefdb18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJobPrintTicketAsync", "GetSourceSpoolDataAsStreamContent", "GetSourceSpoolDataAsXpsObjectModel"]

    /**
     * 
     * @returns {IAsyncOperation<WorkflowPrintTicket>} 
     */
    GetJobPrintTicketAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WorkflowPrintTicket, operation)
    }

    /**
     * 
     * @returns {PrintWorkflowSpoolStreamContent} 
     */
    GetSourceSpoolDataAsStreamContent() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowSpoolStreamContent(result_)
    }

    /**
     * 
     * @returns {PrintWorkflowObjectModelSourceFileContent} 
     */
    GetSourceSpoolDataAsXpsObjectModel() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowObjectModelSourceFileContent(result_)
    }
}
