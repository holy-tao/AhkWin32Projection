#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\AppExecutionStateChangeResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppResourceGroupInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppResourceGroupInfo2
     * @type {Guid}
     */
    static IID => Guid("{ee9b236d-d305-4d6b-92f7-6afdad72dedc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartSuspendAsync", "StartResumeAsync", "StartTerminateAsync"]

    /**
     * 
     * @returns {IAsyncOperation<AppExecutionStateChangeResult>} 
     */
    StartSuspendAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppExecutionStateChangeResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<AppExecutionStateChangeResult>} 
     */
    StartResumeAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppExecutionStateChangeResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<AppExecutionStateChangeResult>} 
     */
    StartTerminateAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppExecutionStateChangeResult, operation)
    }
}
