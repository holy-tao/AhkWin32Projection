#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides simple frame controls that act as simple containers for other nested controls.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-isimpleframesite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ISimpleFrameSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleFrameSite
     * @type {Guid}
     */
    static IID => Guid("{742b0e01-14e6-101b-914e-00aa00300cab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreMessageFilter", "PostMessageFilter"]

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} msg 
     * @param {WPARAM} wp 
     * @param {LPARAM} lp 
     * @param {Pointer<LRESULT>} plResult 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-isimpleframesite-premessagefilter
     */
    PreMessageFilter(hWnd, msg, wp, lp, plResult, pdwCookie) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        plResultMarshal := plResult is VarRef ? "ptr*" : "ptr"
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hWnd, "uint", msg, "ptr", wp, "ptr", lp, plResultMarshal, plResult, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} msg 
     * @param {WPARAM} wp 
     * @param {LPARAM} lp 
     * @param {Integer} dwCookie 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-isimpleframesite-postmessagefilter
     */
    PostMessageFilter(hWnd, msg, wp, lp, dwCookie) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "uint", msg, "ptr", wp, "ptr", lp, "ptr*", &plResult := 0, "uint", dwCookie, "HRESULT")
        return plResult
    }
}
