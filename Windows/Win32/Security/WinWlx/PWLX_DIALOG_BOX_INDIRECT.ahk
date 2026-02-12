#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to create a modal dialog box from a dialog box template in memory.
 * @remarks
 * <b>WlxDialogBoxIndirect</b> duplicates the Windows <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxindirecta">DialogBoxIndirect</a> macro, and also allows Winlogon to terminate the dialog box. For more information, see 
 * <b>DialogBoxIndirect</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_dialog_box_indirect
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_DIALOG_BOX_INDIRECT extends IUnknown {

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
     * @param {HANDLE} hWlx 
     * @param {HANDLE} hInst 
     * @param {Pointer<DLGTEMPLATE>} hDialogTemplate 
     * @param {HWND} hwndOwner 
     * @param {Pointer<DLGPROC>} dlgprc 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, hInst, hDialogTemplate, hwndOwner, dlgprc) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        hInst := hInst is Win32Handle ? NumGet(hInst, "ptr") : hInst
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hWlx, "ptr", hInst, "ptr", hDialogTemplate, "ptr", hwndOwner, "ptr", dlgprc, "int")
        return result
    }
}
