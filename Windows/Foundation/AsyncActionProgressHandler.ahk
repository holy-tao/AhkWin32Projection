#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles progress update events of an asynchronous action that provides progress updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.asyncactionprogresshandler-1
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class AsyncActionProgressHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncActionProgressHandler
     * @type {Guid}
     */
    static IID => Guid("{6d844858-0cff-4590-ae89-95a5a5c8b4b8}")

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
     * @param {Generic} progressInfo 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(asyncInfo, progressInfo) {
        result := ComCall(3, this, "ptr", asyncInfo, "ptr", progressInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
