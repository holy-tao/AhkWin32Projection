#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to initialize dialog box controls and then create a modal dialog box from a dialog box template resource.
 * @remarks
 * <b>WlxDialogBoxParam</b> duplicates the Windows <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxparama">DialogBoxParam</a> function, and also allows Winlogon to terminate the dialog box. For more information, see 
 * <b>DialogBoxParam</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_dialog_box_param
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_DIALOG_BOX_PARAM extends IUnknown {

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
     * @param {PWSTR} lpszTemplate 
     * @param {HWND} hwndOwner 
     * @param {Pointer<DLGPROC>} dlgprc 
     * @param {LPARAM} dwInitParam 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, hInst, lpszTemplate, hwndOwner, dlgprc, dwInitParam) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        hInst := hInst is Win32Handle ? NumGet(hInst, "ptr") : hInst
        lpszTemplate := lpszTemplate is String ? StrPtr(lpszTemplate) : lpszTemplate
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        dwInitParam := dwInitParam is Win32Handle ? NumGet(dwInitParam, "ptr") : dwInitParam

        result := ComCall(3, this, "ptr", hWlx, "ptr", hInst, "ptr", lpszTemplate, "ptr", hwndOwner, "ptr", dlgprc, "ptr", dwInitParam, "int")
        return result
    }
}
