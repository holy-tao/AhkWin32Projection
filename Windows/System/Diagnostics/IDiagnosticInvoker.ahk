#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DiagnosticActionResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IDiagnosticInvoker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiagnosticInvoker
     * @type {Guid}
     */
    static IID => Guid("{187b270a-02e3-4f86-84fc-fdd892b5940f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RunDiagnosticActionAsync"]

    /**
     * 
     * @param {JsonObject} context_ 
     * @returns {IAsyncOperationWithProgress<DiagnosticActionResult, Integer>} 
     */
    RunDiagnosticActionAsync(context_) {
        result := ComCall(6, this, "ptr", context_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DiagnosticActionResult, (ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
