#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreACPSink interface is implemented by the TSF manager and is used by an ACP-based application to notify the manager when certain events occur. The manager installs this advise sink by calling ITextStoreACP::AdviseSink.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreacpsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACPSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreACPSink
     * @type {Guid}
     */
    static IID => Guid("{22d44c94-a419-4542-a272-ae26093ececf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTextChange", "OnSelectionChange", "OnLayoutChange", "OnStatusChange", "OnAttrsChange", "OnLockGranted", "OnStartEditTransaction", "OnEndEditTransaction"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-ontextchange
     */
    OnTextChange(dwFlags, pChange) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onselectionchange
     */
    OnSelectionChange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcode 
     * @param {Integer} vcView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onlayoutchange
     */
    OnLayoutChange(lcode, vcView) {
        result := ComCall(5, this, "int", lcode, "uint", vcView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Integer} cAttrs 
     * @param {Pointer<Guid>} paAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onattrschange
     */
    OnAttrsChange(acpStart, acpEnd, cAttrs, paAttrs) {
        result := ComCall(7, this, "int", acpStart, "int", acpEnd, "uint", cAttrs, "ptr", paAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLockFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onlockgranted
     */
    OnLockGranted(dwLockFlags) {
        result := ComCall(8, this, "uint", dwLockFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onstartedittransaction
     */
    OnStartEditTransaction() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreacpsink-onendedittransaction
     */
    OnEndEditTransaction() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
