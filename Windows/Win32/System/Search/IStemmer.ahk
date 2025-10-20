#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for creating a language-specific stemmer. The stemmer generates inflected forms of a specified word.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement this interface to create a custom stemmer for a language. Windows Search calls the methods of this interface to generate inflected forms for words identified when building an index.
  * 
  * Stemmer components for Windows Search run in the Local Security context. They should be written to manage buffers and the stack correctly. All string copies must have explicit checks to guard against buffer overruns. You should always verify the allocated size of the buffer and test the size of the data against the size of the buffer.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-istemmer
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IStemmer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStemmer
     * @type {Guid}
     */
    static IID => Guid("{efbaf140-7f42-11ce-be57-00aa0051fe20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GenerateWordForms", "GetLicenseToUse"]

    /**
     * 
     * @param {Integer} ulMaxTokenSize 
     * @param {Pointer<BOOL>} pfLicense 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-istemmer-init
     */
    Init(ulMaxTokenSize, pfLicense) {
        result := ComCall(3, this, "uint", ulMaxTokenSize, "ptr", pfLicense, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwc 
     * @param {IWordFormSink} pStemSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-istemmer-generatewordforms
     */
    GenerateWordForms(pwcInBuf, cwc, pStemSink) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "ptr", pwcInBuf, "uint", cwc, "ptr", pStemSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppwcsLicense 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-istemmer-getlicensetouse
     */
    GetLicenseToUse(ppwcsLicense) {
        result := ComCall(5, this, "ptr*", ppwcsLicense, "HRESULT")
        return result
    }
}
