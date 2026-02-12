#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LOG_UNPINNED_CALLBACK function is an application-defined callback function that receives notification that the log has become unpinned.
 * @see https://learn.microsoft.com/windows/win32/api//content/clfsmgmtw32/nc-clfsmgmtw32-plog_unpinned_callback
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class PLOG_UNPINNED_CALLBACK extends IUnknown {

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
     * @param {HANDLE} hLogFile 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hLogFile, pvClientContext) {
        hLogFile := hLogFile is Win32Handle ? NumGet(hLogFile, "ptr") : hLogFile

        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hLogFile, pvClientContextMarshal, pvClientContext)
    }
}
