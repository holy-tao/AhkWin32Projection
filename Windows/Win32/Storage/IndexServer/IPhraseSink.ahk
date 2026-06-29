#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles phrases that word breakers parse from query text during query time.
 * @remarks
 * Indexing Service creates and initializes instances of the PhraseSink object. The PhraseSink receives the <i>fQuery</i> parameter during initialization and uses this parameter to determine the word-breaking context in which the object is being used.
 * 
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> implementations receive a pointer to the PhraseSink object in the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext">BreakText</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nn-indexsrv-iphrasesink
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct IPhraseSink extends IUnknown {
    /**
     * The interface identifier for IPhraseSink
     * @type {Guid}
     */
    static IID := Guid("{cc906ff0-c058-101a-b554-08002b33b0e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhraseSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutSmallPhrase : IntPtr
        PutPhrase      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhraseSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Puts a small query-time phrase in the IPhraseSink object for WordBreaker.
     * @remarks
     * <b>PutSmallPhrase</b> is called by the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext">IWordBreaker::BreakText</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> implementation. Phrases that the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iphrasesink">IPhraseSink</a> object handles are used by Windows Search to expand the original query text.
     * @param {PWSTR} pwcNoun A pointer to a buffer that contains a word being modified.
     * @param {Integer} cwcNoun The number of characters in <i>pwcNoun</i>. There is no limit on the size of a query-time phrase.
     * @param {PWSTR} pwcModifier A pointer to the word modifying <i>pwcNoun</i>.
     * @param {Integer} cwcModifier The number of characters in <i>pwcModifier</i>. There is no limit on the size of a query-time phrase.
     * @param {Integer} ulAttachmentType A wordbreaker-specific value which a 
     *  wordbreaker can use to store additional information about the method of composition.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-iphrasesink-putsmallphrase
     */
    PutSmallPhrase(pwcNoun, cwcNoun, pwcModifier, cwcModifier, ulAttachmentType) {
        pwcNoun := pwcNoun is String ? StrPtr(pwcNoun) : pwcNoun
        pwcModifier := pwcModifier is String ? StrPtr(pwcModifier) : pwcModifier

        result := ComCall(3, this, "ptr", pwcNoun, "uint", cwcNoun, "ptr", pwcModifier, "uint", cwcModifier, "uint", ulAttachmentType, "HRESULT")
        return result
    }

    /**
     * Puts a query-time phrase in the IPhraseSink object.
     * @remarks
     * <b>PutPhrase</b> is called by the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext">IWordBreaker::BreakText</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> implementation. Phrases that the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iphrasesink">IPhraseSink</a> object handles are used by Windows Search to expand the original query text.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-iphrasesink-putphrase">PutPhrase</a> was called at index time instead of query time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-iphrasesink-putphrase
     */
    PutPhrase(pwcPhrase, cwcPhrase) {
        pwcPhrase := pwcPhrase is String ? StrPtr(pwcPhrase) : pwcPhrase

        result := ComCall(4, this, "ptr", pwcPhrase, "uint", cwcPhrase, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPhraseSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutSmallPhrase := CallbackCreate(GetMethod(implObj, "PutSmallPhrase"), flags, 6)
        this.vtbl.PutPhrase := CallbackCreate(GetMethod(implObj, "PutPhrase"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutSmallPhrase)
        CallbackFree(this.vtbl.PutPhrase)
    }
}
