#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines a callback function that WDS can call for progress notification and error messages during a file or image transfer.
 * @remarks
 * A callback function can call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer">WdsCliCancelTransfer</a> function to cancel a 
 *     transfer. Although a callback function can also call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer">WdsCliWaitForTransfer</a> function, this is not 
 *     recommended because no additional callbacks will be received until the current callback is unblocked.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdsclientapi/nc-wdsclientapi-pfn_wdsclicallback
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsCliCallback extends IUnknown {

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
     * @param {Integer} dwMessageId 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @param {Pointer<Void>} pvUserData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwMessageId, wParam_, lParam_, pvUserData) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        pvUserDataMarshal := pvUserData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", dwMessageId, "ptr", wParam_, "ptr", lParam_, pvUserDataMarshal, pvUserData)
    }
}
