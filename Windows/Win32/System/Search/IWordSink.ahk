#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/search/iwordsink
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IWordSink extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutWord", "PutAltWord", "StartAltPhrase", "EndAltPhrase", "PutBreak"]

    /**
     * 
     * @param {Integer} cwc 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwcSrcLen 
     * @param {Integer} cwcSrcPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-putword
     */
    PutWord(cwc, pwcInBuf, cwcSrcLen, cwcSrcPos) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "uint", cwc, "ptr", pwcInBuf, "uint", cwcSrcLen, "uint", cwcSrcPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cwc 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwcSrcLen 
     * @param {Integer} cwcSrcPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-putaltword
     */
    PutAltWord(cwc, pwcInBuf, cwcSrcLen, cwcSrcPos) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "uint", cwc, "ptr", pwcInBuf, "uint", cwcSrcLen, "uint", cwcSrcPos, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-startaltphrase
     */
    StartAltPhrase() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-endaltphrase
     */
    EndAltPhrase() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} breakType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-putbreak
     */
    PutBreak(breakType) {
        result := ComCall(7, this, "int", breakType, "HRESULT")
        return result
    }
}
