#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Callback used for notifying completion of an async SSPI call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nc-sspi-sspiasyncnotifycallback
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SspiAsyncNotifyCallback extends IUnknown {

    static sizeof => A_PtrSize

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
     * @param {Pointer<SspiAsyncContext>} Handle_ 
     * @param {Pointer<Void>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Handle_, CallbackData) {
        CallbackDataMarshal := CallbackData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", Handle_, CallbackDataMarshal, CallbackData)
    }
}
