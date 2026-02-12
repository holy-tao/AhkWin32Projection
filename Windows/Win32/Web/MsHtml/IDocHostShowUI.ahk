#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocHostShowUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocHostShowUI
     * @type {Guid}
     */
    static IID => Guid("{c4d244b0-d43e-11cf-893b-00aa00bdce1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowMessage", "ShowHelp"]

    /**
     * Represents an action that shows a message box.
     * @remarks
     * For scripting development, a message box action is specified using the [**ShowMessageAction**](showmessageaction.md) object.
     * 
     * For C++ development, a message box action is specified using the [**IShowMessageAction**](/windows/desktop/api/taskschd/nn-taskschd-ishowmessageaction) interface.
     * 
     * **Windows 8 and Windows Server 2012:** This element has been removed. You can use IExecAction with the Windows scripting [**MsgBox function**](/previous-versions/sfw6660x(v=vs.80)) to show a message in the user session.
     * @param {HWND} hwnd_ 
     * @param {PWSTR} lpstrText 
     * @param {PWSTR} lpstrCaption 
     * @param {Integer} dwType 
     * @param {PWSTR} lpstrHelpFile 
     * @param {Integer} dwHelpContext 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-showmessage-actiongroup-element
     */
    ShowMessage(hwnd_, lpstrText, lpstrCaption, dwType, lpstrHelpFile, dwHelpContext) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        lpstrText := lpstrText is String ? StrPtr(lpstrText) : lpstrText
        lpstrCaption := lpstrCaption is String ? StrPtr(lpstrCaption) : lpstrCaption
        lpstrHelpFile := lpstrHelpFile is String ? StrPtr(lpstrHelpFile) : lpstrHelpFile

        plResult := LRESULT()
        result := ComCall(3, this, "ptr", hwnd_, "ptr", lpstrText, "ptr", lpstrCaption, "uint", dwType, "ptr", lpstrHelpFile, "uint", dwHelpContext, "ptr", plResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plResult
    }

    /**
     * 
     * @param {HWND} hwnd_ 
     * @param {PWSTR} pszHelpFile 
     * @param {Integer} uCommand 
     * @param {Integer} dwData 
     * @param {POINT} ptMouse 
     * @param {IDispatch} pDispatchObjectHit 
     * @returns {HRESULT} 
     */
    ShowHelp(hwnd_, pszHelpFile, uCommand, dwData, ptMouse, pDispatchObjectHit) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        pszHelpFile := pszHelpFile is String ? StrPtr(pszHelpFile) : pszHelpFile

        result := ComCall(4, this, "ptr", hwnd_, "ptr", pszHelpFile, "uint", uCommand, "uint", dwData, "ptr", ptMouse, "ptr", pDispatchObjectHit, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
