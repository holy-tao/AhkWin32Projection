#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IWordSink extends IUnknown{
    /**
     * The interface identifier for IWordSink
     * @type {Guid}
     */
    static IID => Guid("{cc907054-c058-101a-b554-08002b33b0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cwc 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwcSrcLen 
     * @param {Integer} cwcSrcPos 
     * @returns {HRESULT} 
     */
    PutWord(cwc, pwcInBuf, cwcSrcLen, cwcSrcPos) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "uint", cwc, "ptr", pwcInBuf, "uint", cwcSrcLen, "uint", cwcSrcPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cwc 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwcSrcLen 
     * @param {Integer} cwcSrcPos 
     * @returns {HRESULT} 
     */
    PutAltWord(cwc, pwcInBuf, cwcSrcLen, cwcSrcPos) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "uint", cwc, "ptr", pwcInBuf, "uint", cwcSrcLen, "uint", cwcSrcPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartAltPhrase() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndAltPhrase() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} breakType 
     * @returns {HRESULT} 
     */
    PutBreak(breakType) {
        result := ComCall(7, this, "int", breakType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
