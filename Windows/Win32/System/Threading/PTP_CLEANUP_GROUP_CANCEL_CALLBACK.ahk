#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Applications implement this callback if they call the SetThreadpoolCallbackCleanupGroup function to specify the callback to use when CloseThreadpoolCleanupGroup is called.
 * @see https://learn.microsoft.com/windows/win32/api//content/winnt/nc-winnt-ptp_cleanup_group_cancel_callback
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PTP_CLEANUP_GROUP_CANCEL_CALLBACK extends IUnknown {

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        ComCall(3, this)
    }
}
