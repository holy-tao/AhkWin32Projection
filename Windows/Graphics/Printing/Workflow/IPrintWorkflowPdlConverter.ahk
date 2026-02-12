#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPdlConverter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPdlConverter
     * @type {Guid}
     */
    static IID => Guid("{40604b62-0ae4-51f1-818f-731dc0b005ab}")

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
     * @returns {IAsyncAction} 
     */
    ConvertPdlAsync(printTicket, inputStream, outputStream) {
        result := ComCall(6, this, "ptr", printTicket, "ptr", inputStream, "ptr", outputStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
