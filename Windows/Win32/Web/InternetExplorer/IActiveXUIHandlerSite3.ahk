#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IActiveXUIHandlerSite3 extends IUnknown {
    /**
     * The interface identifier for IActiveXUIHandlerSite3
     * @type {Guid}
     */
    static IID := Guid("{7904009a-1238-47f4-901c-871375c34608}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveXUIHandlerSite3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MessageBoxW : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveXUIHandlerSite3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {HWND} _hwnd 
     * @param {PWSTR} text 
     * @param {PWSTR} caption 
     * @param {Integer} type 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-messageboxw
     */
    MessageBoxW(_hwnd, text, caption, type) {
        text := text is String ? StrPtr(text) : text
        caption := caption is String ? StrPtr(caption) : caption

        result := ComCall(3, this, HWND, _hwnd, "ptr", text, "ptr", caption, "uint", type, "int*", &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveXUIHandlerSite3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MessageBoxW := CallbackCreate(GetMethod(implObj, "MessageBoxW"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MessageBoxW)
    }
}
