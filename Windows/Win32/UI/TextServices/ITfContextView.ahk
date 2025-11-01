#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextView interface is implemented by the TSF manager and used by a client (application or text service) to obtain information about a context view.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextview
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextView
     * @type {Guid}
     */
    static IID => Guid("{2433bf8e-0f9b-435c-ba2c-180611978c30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRangeFromPoint", "GetTextExt", "GetScreenExt", "GetWnd"]

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<POINT>} ppt 
     * @param {Integer} dwFlags 
     * @param {Pointer<ITfRange>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextview-getrangefrompoint
     */
    GetRangeFromPoint(ec, ppt, dwFlags, ppRange) {
        result := ComCall(3, this, "uint", ec, "ptr", ppt, "uint", dwFlags, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<BOOL>} pfClipped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextview-gettextext
     */
    GetTextExt(ec, pRange, prc, pfClipped) {
        result := ComCall(4, this, "uint", ec, "ptr", pRange, "ptr", prc, "ptr", pfClipped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextview-getscreenext
     */
    GetScreenExt(prc) {
        result := ComCall(5, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextview-getwnd
     */
    GetWnd(phwnd) {
        result := ComCall(6, this, "ptr", phwnd, "HRESULT")
        return result
    }
}
