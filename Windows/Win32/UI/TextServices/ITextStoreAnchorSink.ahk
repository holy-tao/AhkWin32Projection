#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreAnchorSink interface is implemented by the TSF manager and is used by an anchor-based application to notify the manager when certain events occur. The manager installs this advise sink by calling ITextStoreAnchor::AdviseSink.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreanchorsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreAnchorSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreAnchorSink
     * @type {Guid}
     */
    static IID => Guid("{aa80e905-2021-11d2-93e0-0060b067b86e}")

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
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-ontextchange
     */
    OnTextChange(dwFlags, paStart, paEnd) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onselectionchange
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
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onlayoutchange
     */
    OnLayoutChange(lcode, vcView) {
        result := ComCall(5, this, "int", lcode, "uint", vcView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paStart 
     * @param {IAnchor} paEnd 
     * @param {Integer} cAttrs 
     * @param {Pointer<Guid>} paAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onattrschange
     */
    OnAttrsChange(paStart, paEnd, cAttrs, paAttrs) {
        result := ComCall(7, this, "ptr", paStart, "ptr", paEnd, "uint", cAttrs, "ptr", paAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLockFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onlockgranted
     */
    OnLockGranted(dwLockFlags) {
        result := ComCall(8, this, "uint", dwLockFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onstartedittransaction
     */
    OnStartEditTransaction() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-itextstoreanchorsink-onendedittransaction
     */
    OnEndEditTransaction() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
