#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles the completed event of an asynchronous action that provides progress updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.asyncactionwithprogresscompletedhandler-1
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class AsyncActionWithProgressCompletedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncActionWithProgressCompletedHandler
     * @type {Guid}
     */
    static IID => Guid("{9c029f91-cc84-44fd-ac26-0a6c4e555281}")

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
     * @param {IAsyncActionWithProgress<Generic>} asyncInfo 
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
