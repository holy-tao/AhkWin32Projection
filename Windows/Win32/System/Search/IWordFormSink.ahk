#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Handles the list of alternative word forms that stemmers generate during query time.
 * @remarks
 * 
  * Windows Search creates and initializes instances of the StemSink object. The <b>IWordFormSink</b> object receives the <i>ulMaxTokenSize</i> parameter during initialization. The value for this parameter is determined by the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-istemmer">IStemmer</a> implementation and determines the maximum length, in characters, for a single word that the <b>IWordFormSink</b> handles.
  * 
  * 
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-istemmer">IStemmer</a> implementations receive a pointer to the <b>IWordFormSink</b> object in the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-istemmer-generatewordforms">GenerateWordForms</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-iwordformsink
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IWordFormSink extends IUnknown{
    /**
     * The interface identifier for IWordFormSink
     * @type {Guid}
     */
    static IID => Guid("{fe77c330-7f42-11ce-be57-00aa0051fe20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwc 
     * @returns {HRESULT} 
     */
    PutAltWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "ptr", pwcInBuf, "uint", cwc, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "ptr", pwcInBuf, "uint", cwc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
