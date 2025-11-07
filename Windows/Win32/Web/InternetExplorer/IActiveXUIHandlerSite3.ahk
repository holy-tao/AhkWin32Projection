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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-messageboxw
     */
    MessageBoxW(hwnd, text, caption, type) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        text := text is String ? StrPtr(text) : text
        caption := caption is String ? StrPtr(caption) : caption

        result := ComCall(3, this, "ptr", hwnd, "ptr", text, "ptr", caption, "uint", type, "int*", &result := 0, "HRESULT")
        return result
    }
}
