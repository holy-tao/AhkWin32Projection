#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The RM_WRITE_STATUS_CALLBACK function can be implemented by the user interface that controls the Restart Manager.
 * @see https://learn.microsoft.com/windows/win32/api//content/restartmanager/nc-restartmanager-rm_write_status_callback
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_WRITE_STATUS_CALLBACK extends IUnknown {

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
     * @param {Integer} nPercentComplete 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(nPercentComplete) {
        ComCall(3, this, "uint", nPercentComplete)
    }
}
