#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class IThreadPoolStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThreadPoolStatics
     * @type {Guid}
     */
    static IID => Guid("{b6bf67dd-84bd-44f8-ac1c-93ebcb9dba91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RunAsync", "RunWithPriorityAsync", "RunWithPriorityAndOptionsAsync"]

    /**
     * 
     * @param {WorkItemHandler} handler 
     * @returns {IAsyncAction} 
     */
    RunAsync(handler) {
        result := ComCall(6, this, "ptr", handler, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {WorkItemHandler} handler 
     * @param {Integer} priority_ 
     * @returns {IAsyncAction} 
     */
    RunWithPriorityAsync(handler, priority_) {
        result := ComCall(7, this, "ptr", handler, "int", priority_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {WorkItemHandler} handler 
     * @param {Integer} priority_ 
     * @param {Integer} options 
     * @returns {IAsyncAction} 
     */
    RunWithPriorityAndOptionsAsync(handler, priority_, options) {
        result := ComCall(8, this, "ptr", handler, "int", priority_, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
