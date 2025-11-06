#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\TS_STATUS.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getacpfrompoint
     */
    GetACPFromPoint(ptScreen, dwFlags) {
        result := ComCall(3, this, "ptr", ptScreen, "uint", dwFlags, "int*", &pacp := 0, "HRESULT")
        return pacp
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
        pfClippedMarshal := pfClipped is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", acpStart, "int", acpEnd, "ptr", prc, pfClippedMarshal, pfClipped, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getscreenext
     */
    GetScreenExt() {
        prc := RECT()
        result := ComCall(5, this, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * 
     * @returns {TS_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getwnd
     */
    GetWnd() {
        phwnd := HWND()
        result := ComCall(7, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidAttribute 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextowner-getattribute
     */
    GetAttribute(rguidAttribute) {
        pvarValue := VARIANT()
        result := ComCall(8, this, "ptr", rguidAttribute, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }
}
