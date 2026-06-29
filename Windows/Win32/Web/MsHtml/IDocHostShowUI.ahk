#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocHostShowUI extends IUnknown {
    /**
     * The interface identifier for IDocHostShowUI
     * @type {Guid}
     */
    static IID := Guid("{c4d244b0-d43e-11cf-893b-00aa00bdce1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocHostShowUI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowMessage : IntPtr
        ShowHelp    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocHostShowUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Represents an action that shows a message box.
     * @remarks
     * For scripting development, a message box action is specified using the [**ShowMessageAction**](showmessageaction.md) object.
     * 
     * For C++ development, a message box action is specified using the [**IShowMessageAction**](/windows/desktop/api/taskschd/nn-taskschd-ishowmessageaction) interface.
     * 
     * **Windows 8 and Windows Server 2012:** This element has been removed. You can use IExecAction with the Windows scripting [**MsgBox function**](/previous-versions/sfw6660x(v=vs.80)) to show a message in the user session.
     * @param {HWND} _hwnd 
     * @param {PWSTR} lpstrText 
     * @param {PWSTR} lpstrCaption 
     * @param {Integer} dwType 
     * @param {PWSTR} lpstrHelpFile 
     * @param {Integer} dwHelpContext 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-showmessage-actiongroup-element
     */
    ShowMessage(_hwnd, lpstrText, lpstrCaption, dwType, lpstrHelpFile, dwHelpContext) {
        lpstrText := lpstrText is String ? StrPtr(lpstrText) : lpstrText
        lpstrCaption := lpstrCaption is String ? StrPtr(lpstrCaption) : lpstrCaption
        lpstrHelpFile := lpstrHelpFile is String ? StrPtr(lpstrHelpFile) : lpstrHelpFile

        result := ComCall(3, this, HWND, _hwnd, "ptr", lpstrText, "ptr", lpstrCaption, "uint", dwType, "ptr", lpstrHelpFile, "uint", dwHelpContext, LRESULT.Ptr, &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {PWSTR} pszHelpFile 
     * @param {Integer} uCommand 
     * @param {Integer} dwData 
     * @param {POINT} ptMouse 
     * @param {IDispatch} pDispatchObjectHit 
     * @returns {HRESULT} 
     */
    ShowHelp(_hwnd, pszHelpFile, uCommand, dwData, ptMouse, pDispatchObjectHit) {
        pszHelpFile := pszHelpFile is String ? StrPtr(pszHelpFile) : pszHelpFile

        result := ComCall(4, this, HWND, _hwnd, "ptr", pszHelpFile, "uint", uCommand, "uint", dwData, POINT, ptMouse, "ptr", pDispatchObjectHit, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDocHostShowUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowMessage := CallbackCreate(GetMethod(implObj, "ShowMessage"), flags, 8)
        this.vtbl.ShowHelp := CallbackCreate(GetMethod(implObj, "ShowHelp"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowMessage)
        CallbackFree(this.vtbl.ShowHelp)
    }
}
