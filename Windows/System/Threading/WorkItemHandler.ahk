#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that is called when a work item runs.
 * @remarks
 * The thread pool calls a work item's WorkItemHandler delegate when a thread becomes available to run the work item. If a work item is canceled, WorkItemHandler delegates that have not yet started running are not called. WorkItemHandler delegates that are already running are allowed to finish unless the application stops them. If a work item might run for a relatively long time, the application should check if cancellation has been requested and stop the handler in an orderly way.
 * 
 * For an example, see [Submit a work item to the thread pool](/windows/uwp/threading-async/submit-a-work-item-to-the-thread-pool).
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.workitemhandler
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class WorkItemHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for WorkItemHandler
     * @type {Guid}
     */
    static IID => Guid("{1d1a8b8b-fa66-414f-9cbd-b65fc99d17fa}")

    /**
     * The class identifier for WorkItemHandler
     * @type {Guid}
     */
    static CLSID => Guid("{1d1a8b8b-fa66-414f-9cbd-b65fc99d17fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IAsyncAction} operation 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(operation) {
        result := ComCall(3, this, "ptr", operation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
