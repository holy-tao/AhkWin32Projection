#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPdlConverter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPdlConverter2
     * @type {Guid}
     */
    static IID => Guid("{854ceec1-7837-5b93-b7af-57a6998c2f71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertPdlAsync"]

    /**
     * 
     * @param {WorkflowPrintTicket} printTicket 
     * @param {IInputStream} inputStream 
     * @param {IOutputStream} outputStream 
     * @param {Integer} hostBasedProcessingOperations 
     * @returns {IAsyncAction} 
     */
    ConvertPdlAsync(printTicket, inputStream, outputStream, hostBasedProcessingOperations) {
        result := ComCall(6, this, "ptr", printTicket, "ptr", inputStream, "ptr", outputStream, "uint", hostBasedProcessingOperations, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
