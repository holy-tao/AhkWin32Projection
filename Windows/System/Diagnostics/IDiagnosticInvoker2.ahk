#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DiagnosticActionResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IDiagnosticInvoker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiagnosticInvoker2
     * @type {Guid}
     */
    static IID => Guid("{e3bf945c-155a-4b52-a8ec-070c44f95000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RunDiagnosticActionFromStringAsync"]

    /**
     * 
     * @param {HSTRING} context_ 
     * @returns {IAsyncOperationWithProgress<DiagnosticActionResult, Integer>} 
     */
    RunDiagnosticActionFromStringAsync(context_) {
        if(context_ is String) {
            pin := HSTRING.Create(context_)
            context_ := pin.Value
        }
        context_ := context_ is Win32Handle ? NumGet(context_, "ptr") : context_

        result := ComCall(6, this, "ptr", context_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DiagnosticActionResult, (ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
