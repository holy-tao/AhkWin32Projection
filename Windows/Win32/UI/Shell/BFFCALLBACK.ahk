#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives event notifications from the Active Directory Domain Services container browser dialog box.
 * @remarks
 * The <b>DSBM_*</b> message values are defined in Dsclient.h.
 * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nc-shlobj_core-bffcallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BFFCALLBACK extends IUnknown {

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
     * @param {HWND} hwnd_ 
     * @param {Integer} uMsg 
     * @param {LPARAM} lParam_ 
     * @param {LPARAM} lpData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwnd_, uMsg, lParam_, lpData) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_
        lpData := lpData is Win32Handle ? NumGet(lpData, "ptr") : lpData

        result := ComCall(3, this, "ptr", hwnd_, "uint", uMsg, "ptr", lParam_, "ptr", lpData, "int")
        return result
    }
}
