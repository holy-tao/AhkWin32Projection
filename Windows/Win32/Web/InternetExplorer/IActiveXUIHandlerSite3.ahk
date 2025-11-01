#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IActiveXUIHandlerSite3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveXUIHandlerSite3
     * @type {Guid}
     */
    static IID => Guid("{7904009a-1238-47f4-901c-871375c34608}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MessageBoxW"]

    /**
     * Displays a modal dialog box that contains a system icon, a set of buttons, and a brief application-specific message, such as status or error information. The message box returns an integer value that indicates which button the user clicked.
     * @param {HWND} hwnd 
     * @param {PWSTR} text 
     * @param {PWSTR} caption 
     * @param {Integer} type 
     * @param {Pointer<Integer>} result 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If a message box has a <b>Cancel</b> button, the function returns the <b>IDCANCEL</b> value if either the ESC key is pressed or the <b>Cancel</b> button is selected. If the message box has no <b>Cancel</b> button, pressing ESC will no effect - unless an MB_OK button is present. If an MB_OK button is displayed and the user presses ESC, the return value will be <b>IDOK</b>.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the function succeeds, the return value is one of the following menu-item values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDABORT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Abort</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDCANCEL</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Cancel</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDCONTINUE</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Continue</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDIGNORE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Ignore</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDNO</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>No</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDOK</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>OK</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDRETRY</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Retry</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDTRYAGAIN</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Try Again</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDYES</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Yes</b> button was selected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-messageboxw
     */
    MessageBoxW(hwnd, text, caption, type, result) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        text := text is String ? StrPtr(text) : text
        caption := caption is String ? StrPtr(caption) : caption

        result := ComCall(3, this, "ptr", hwnd, "ptr", text, "ptr", caption, "uint", type, "int*", result, "HRESULT")
        return result
    }
}
