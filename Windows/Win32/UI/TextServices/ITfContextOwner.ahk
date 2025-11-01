#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwner interface is implemented by an application or a text service to receive text input without having a text store. An instance of this interface is obtained when the application calls the ITfSource::AdviseSink method.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextowner
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextOwner
     * @type {Guid}
     */
    static IID => Guid("{aa80e80c-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetACPFromPoint", "GetTextExt", "GetScreenExt", "GetStatus", "GetWnd", "GetAttribute"]

    /**
     * 
     * @param {Pointer<POINT>} ptScreen 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pacp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getacpfrompoint
     */
    GetACPFromPoint(ptScreen, dwFlags, pacp) {
        result := ComCall(3, this, "ptr", ptScreen, "uint", dwFlags, "int*", pacp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<BOOL>} pfClipped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-gettextext
     */
    GetTextExt(acpStart, acpEnd, prc, pfClipped) {
        result := ComCall(4, this, "int", acpStart, "int", acpEnd, "ptr", prc, "ptr", pfClipped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getscreenext
     */
    GetScreenExt(prc) {
        result := ComCall(5, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TS_STATUS>} pdcs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getstatus
     */
    GetStatus(pdcs) {
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getwnd
     */
    GetWnd(phwnd) {
        result := ComCall(7, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidAttribute 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getattribute
     */
    GetAttribute(rguidAttribute, pvarValue) {
        result := ComCall(8, this, "ptr", rguidAttribute, "ptr", pvarValue, "HRESULT")
        return result
    }
}
