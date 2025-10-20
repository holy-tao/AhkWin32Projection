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
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} 
     */
    OnTextChange(dwFlags, pChange) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnSelectionChange() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcode 
     * @param {Integer} vcView 
     * @returns {HRESULT} 
     */
    OnLayoutChange(lcode, vcView) {
        result := ComCall(5, this, "int", lcode, "uint", vcView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OnStatusChange(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Integer} cAttrs 
     * @param {Pointer<Guid>} paAttrs 
     * @returns {HRESULT} 
     */
    OnAttrsChange(acpStart, acpEnd, cAttrs, paAttrs) {
        result := ComCall(7, this, "int", acpStart, "int", acpEnd, "uint", cAttrs, "ptr", paAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLockFlags 
     * @returns {HRESULT} 
     */
    OnLockGranted(dwLockFlags) {
        result := ComCall(8, this, "uint", dwLockFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnStartEditTransaction() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnEndEditTransaction() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
