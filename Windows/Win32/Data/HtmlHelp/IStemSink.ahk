#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IStemSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStemSink
     * @type {Guid}
     */
    static IID => Guid("{fe77c330-7f42-11ce-be57-00aa0051fe20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutAltWord", "PutWord"]

    /**
     * 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwc 
     * @returns {HRESULT} 
     */
    PutAltWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "ptr", pwcInBuf, "uint", cwc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwc 
     * @returns {HRESULT} 
     */
    PutWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "ptr", pwcInBuf, "uint", cwc, "HRESULT")
        return result
    }
}
