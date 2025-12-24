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
     * Puts a small query-time phrase in the IPhraseSink object for WordBreaker.
     * @param {PWSTR} pwcNoun A pointer to a buffer that contains a word being modified.
     * @param {Integer} cwcNoun The number of characters in <i>pwcNoun</i>. There is no limit on the size of a query-time phrase.
     * @param {PWSTR} pwcModifier A pointer to the word modifying <i>pwcNoun</i>.
     * @param {Integer} cwcModifier The number of characters in <i>pwcModifier</i>. There is no limit on the size of a query-time phrase.
     * @param {Integer} ulAttachmentType A wordbreaker-specific value which a 
     *  wordbreaker can use to store additional information about the method of composition.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-iphrasesink-putsmallphrase
     */
    PutSmallPhrase(pwcNoun, cwcNoun, pwcModifier, cwcModifier, ulAttachmentType) {
        pwcNoun := pwcNoun is String ? StrPtr(pwcNoun) : pwcNoun
        pwcModifier := pwcModifier is String ? StrPtr(pwcModifier) : pwcModifier

        result := ComCall(3, this, "ptr", pwcNoun, "uint", cwcNoun, "ptr", pwcModifier, "uint", cwcModifier, "uint", ulAttachmentType, "HRESULT")
        return result
    }

    /**
     * Puts a query-time phrase in the IPhraseSink object.
     * @param {PWSTR} pwcPhrase A pointer to a buffer that contains a phrase.
     * @param {Integer} cwcPhrase The number of characters in <i>pwcPhrase</i>. There is no limit on the size of a query-time phrase.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PSINK_E_QUERY_ONLY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/indexsrv/nf-indexsrv-iphrasesink-putphrase">PutPhrase</a> was called at index time instead of query time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-iphrasesink-putphrase
     */
    PutPhrase(pwcPhrase, cwcPhrase) {
        pwcPhrase := pwcPhrase is String ? StrPtr(pwcPhrase) : pwcPhrase

        result := ComCall(4, this, "ptr", pwcPhrase, "uint", cwcPhrase, "HRESULT")
        return result
    }
}
