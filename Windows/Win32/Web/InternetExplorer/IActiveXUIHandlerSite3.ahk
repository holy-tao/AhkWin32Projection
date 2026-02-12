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
     * Displays a modal dialog box that contains a system icon, a set of buttons, and a brief application-specific message, such as status or error information. The message box returns an integer value that indicates which button the user clicked. (MessageBoxW)
     * @remarks
     * The following system icons can be used in a message box by setting the <i>uType</i> parameter to the corresponding flag value.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Icon</th>
     * <th>Flag values</th>
     * </tr>
     * <tr>
     * <td><img alt="Icon for MB_ICONHAND, MB_ICONSTOP, and MB_ICONERROR" src="./images/MB_ICONHAND.png"/></td>
     * <td><b>MB_ICONHAND</b>, <b>MB_ICONSTOP</b>, or <b>MB_ICONERROR</b></td>
     * </tr>
     * <tr>
     * <td><img alt="Icon for MB_ICONQUESTION" src="./images/MB_ICONQUESTION.png"/></td>
     * <td><b>MB_ICONQUESTION</b></td>
     * </tr>
     * <tr>
     * <td><img alt="Icon for MB_ICONEXCLAMATION and MB_ICONWARNING" src="./images/MB_ICONEXCLAMATION.png"/></td>
     * <td><b>MB_ICONEXCLAMATION</b> or <b>MB_ICONWARNING</b></td>
     * </tr>
     * <tr>
     * <td><img alt="Icon for MB_ICONASTERISK and MB_ICONINFORMATION" src="./images/MB_ICONASTERISK.png"/></td>
     * <td><b>MB_ICONASTERISK</b> or <b>MB_ICONINFORMATION</b></td>
     * </tr>
     * </table>
     *  
     * 
     * Adding two right-to-left marks (RLMs), represented by Unicode formatting character U+200F, in the beginning of a MessageBox display string is interpreted by the MessageBox rendering engine so as to cause the reading order of the MessageBox to be rendered as right-to-left (RTL).
     * 
     * When you use a system-modal message box to indicate that the system is low on memory, the strings pointed to by the <i>lpText</i> and <i>lpCaption</i> parameters should not be taken from a resource file because an attempt to load the resource may fail.
     * 
     * If you create a message box while a dialog box is present, use a handle to the dialog box as the <i>hWnd</i> parameter. The <i>hWnd</i> parameter should not identify a child window, such as a control in a dialog box.
     * @param {HWND} hwnd_ 
     * @param {PWSTR} text 
     * @param {PWSTR} caption 
     * @param {Integer} type 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-messageboxw
     */
    MessageBoxW(hwnd_, text, caption, type) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        text := text is String ? StrPtr(text) : text
        caption := caption is String ? StrPtr(caption) : caption

        result := ComCall(3, this, "ptr", hwnd_, "ptr", text, "ptr", caption, "uint", type, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
