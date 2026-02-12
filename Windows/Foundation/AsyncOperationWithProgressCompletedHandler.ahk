#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles the completed event of an asynchronous operation that provides progress updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.asyncoperationwithprogresscompletedhandler-2
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class AsyncOperationWithProgressCompletedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncOperationWithProgressCompletedHandler
     * @type {Guid}
     */
    static IID => Guid("{e85df41d-6aa7-46e3-a8e2-f009d840c627}")

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
     * @param {IAsyncOperationWithProgress<Generic, Generic>} asyncInfo 
     * @param {Integer} asyncStatus_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(asyncInfo, asyncStatus_) {
        result := ComCall(3, this, "ptr", asyncInfo, "int", asyncStatus_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
