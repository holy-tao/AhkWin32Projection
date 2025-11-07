#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles phrases that word breakers parse from query text during query time.
 * @remarks
 * 
 * Indexing Service creates and initializes instances of the PhraseSink object. The PhraseSink receives the <i>fQuery</i> parameter during initialization and uses this parameter to determine the word-breaking context in which the object is being used.
 * 
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> implementations receive a pointer to the PhraseSink object in the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext">BreakText</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-iphrasesink
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IPhraseSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhraseSink
     * @type {Guid}
     */
    static IID => Guid("{cc906ff0-c058-101a-b554-08002b33b0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutSmallPhrase", "PutPhrase"]

    /**
     * 
     * @param {PWSTR} pwcNoun 
     * @param {Integer} cwcNoun 
     * @param {PWSTR} pwcModifier 
     * @param {Integer} cwcModifier 
     * @param {Integer} ulAttachmentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-iphrasesink-putsmallphrase
     */
    PutSmallPhrase(pwcNoun, cwcNoun, pwcModifier, cwcModifier, ulAttachmentType) {
        pwcNoun := pwcNoun is String ? StrPtr(pwcNoun) : pwcNoun
        pwcModifier := pwcModifier is String ? StrPtr(pwcModifier) : pwcModifier

        result := ComCall(3, this, "ptr", pwcNoun, "uint", cwcNoun, "ptr", pwcModifier, "uint", cwcModifier, "uint", ulAttachmentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcPhrase 
     * @param {Integer} cwcPhrase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-iphrasesink-putphrase
     */
    PutPhrase(pwcPhrase, cwcPhrase) {
        pwcPhrase := pwcPhrase is String ? StrPtr(pwcPhrase) : pwcPhrase

        result := ComCall(4, this, "ptr", pwcPhrase, "uint", cwcPhrase, "HRESULT")
        return result
    }
}
