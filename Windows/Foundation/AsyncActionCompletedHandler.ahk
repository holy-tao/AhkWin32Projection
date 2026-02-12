#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles the completed event of an asynchronous action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.asyncactioncompletedhandler
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class AsyncActionCompletedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncActionCompletedHandler
     * @type {Guid}
     */
    static IID => Guid("{a4ed5c81-76c9-40bd-8be6-b1d90fb20ae7}")

    /**
     * The class identifier for AsyncActionCompletedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{a4ed5c81-76c9-40bd-8be6-b1d90fb20ae7}")

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
     * Invokes the method that is called when the specified asynchronous action completes.
     * @param {IAsyncAction} asyncInfo Type: **[**IAsyncAction**](/windows/win32/api/windows.foundation/nn-windows-foundation-iasyncaction)\***
     * 
     * The asynchronous action that reports completion.
     * @param {Integer} asyncStatus_ 
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/asyncactioncompletedhandler-invoke
     */
    Invoke(asyncInfo, asyncStatus_) {
        result := ComCall(3, this, "ptr", asyncInfo, "int", asyncStatus_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
