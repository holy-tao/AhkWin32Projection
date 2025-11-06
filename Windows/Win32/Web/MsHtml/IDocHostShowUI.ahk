#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} lpstrText 
     * @param {PWSTR} lpstrCaption 
     * @param {Integer} dwType 
     * @param {PWSTR} lpstrHelpFile 
     * @param {Integer} dwHelpContext 
     * @returns {LRESULT} 
     */
    ShowMessage(hwnd, lpstrText, lpstrCaption, dwType, lpstrHelpFile, dwHelpContext) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        lpstrText := lpstrText is String ? StrPtr(lpstrText) : lpstrText
        lpstrCaption := lpstrCaption is String ? StrPtr(lpstrCaption) : lpstrCaption
        lpstrHelpFile := lpstrHelpFile is String ? StrPtr(lpstrHelpFile) : lpstrHelpFile

        result := ComCall(3, this, "ptr", hwnd, "ptr", lpstrText, "ptr", lpstrCaption, "uint", dwType, "ptr", lpstrHelpFile, "uint", dwHelpContext, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} pszHelpFile 
     * @param {Integer} uCommand 
     * @param {Integer} dwData 
     * @param {POINT} ptMouse 
     * @param {IDispatch} pDispatchObjectHit 
     * @returns {HRESULT} 
     */
    ShowHelp(hwnd, pszHelpFile, uCommand, dwData, ptMouse, pDispatchObjectHit) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszHelpFile := pszHelpFile is String ? StrPtr(pszHelpFile) : pszHelpFile

        result := ComCall(4, this, "ptr", hwnd, "ptr", pszHelpFile, "uint", uCommand, "uint", dwData, "ptr", ptMouse, "ptr", pDispatchObjectHit, "HRESULT")
        return result
    }
}
