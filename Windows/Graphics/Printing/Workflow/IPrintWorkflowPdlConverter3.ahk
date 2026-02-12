#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPdlConverter3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPdlConverter3
     * @type {Guid}
     */
    static IID => Guid("{6b556b4f-3756-5da6-b1f7-8f9e89f629fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertPdlFromObjectModelAsync"]

    /**
     * 
     * @param {WorkflowPrintTicket} printTicket 
     * @param {IPrintWorkflowObjectModelProvider} objectModelProvider 
     * @param {IOutputStream} outputStream 
     * @param {Integer} hostBasedProcessingOperations 
     * @returns {IAsyncAction} 
     */
    ConvertPdlFromObjectModelAsync(printTicket, objectModelProvider, outputStream, hostBasedProcessingOperations) {
        result := ComCall(6, this, "ptr", printTicket, "ptr", objectModelProvider, "ptr", outputStream, "uint", hostBasedProcessingOperations, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
