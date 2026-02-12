#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDispatcher2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDispatcher2
     * @type {Guid}
     */
    static IID => Guid("{6f5e63c7-e3aa-4eae-b0e0-dcf321ca4b2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryRunAsync", "TryRunIdleAsync"]

    /**
     * 
     * @param {Integer} priority_ 
     * @param {DispatchedHandler} agileCallback 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRunAsync(priority_, agileCallback) {
        result := ComCall(6, this, "int", priority_, "ptr", agileCallback, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncOperation)
    }

    /**
     * 
     * @param {IdleDispatchedHandler} agileCallback 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRunIdleAsync(agileCallback) {
        result := ComCall(7, this, "ptr", agileCallback, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncOperation)
    }
}
