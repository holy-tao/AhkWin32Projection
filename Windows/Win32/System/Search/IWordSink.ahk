#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Storage\IndexServer\WORDREP_BREAK_TYPE.ahk" { WORDREP_BREAK_TYPE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles words identified by word breaks during both index time and query time.
 * @remarks
 * The **IWordSink** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWordSink** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * Windows Search creates and initializes instances of the **IWordSink** object. The **IWordSink** object receives the *fQuery* parameter during initialization and uses this parameter to determine the word-breaking context in which the object is used.
 * 
 * [**IWordBreaker**](/windows/win32/api/indexsrv/nn-indexsrv-iwordbreaker) implementations receive a pointer to the **IWordSink** object in the [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext) method.
 * @see https://learn.microsoft.com/windows/win32/search/iwordsink
 * @namespace Windows.Win32.System.Search
 */
export default struct IWordSink extends IUnknown {
    /**
     * The interface identifier for IWordSink
     * @type {Guid}
     */
    static IID := Guid("{cc907054-c058-101a-b554-08002b33b0e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWordSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutWord        : IntPtr
        PutAltWord     : IntPtr
        StartAltPhrase : IntPtr
        EndAltPhrase   : IntPtr
        PutBreak       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWordSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Puts a word and its position in the IWordSink object.
     * @remarks
     * We recommend that the **IWordSink::PutWord** method always contain the original word as found in *pTextSource*. Alternative forms of the word are passed to WordSink by using [**IWordSink::PutAltWord**](iwordsink-putaltword.md). We also recommend that the words in *pwcInBuf* match the source text as closely as possible. For example, retain capitalization and accents where possible.
     * 
     * This call must be made for every word retrieved from *pTextSource* except those for which the [**IWordSink::PutAltWord**](iwordsink-putaltword.md) call was made. The word is terminated with an EOW character when it is saved to the WordSink.
     * @param {Integer} cwc The number of characters in *pwcInBuf*.
     * @param {PWSTR} pwcInBuf A pointer to a buffer that contains an alternative form of a word from the source text. This parameter is not modified by **PutWord**. You can pass the *pTextSource* parameter from [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext) as appropriate.
     * @param {Integer} cwcSrcLen The number of characters in the source text buffer (indicated by the *pTextSource* parameter to [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext)) that correspond to the word contained in *pwcInBuf*.
     * @param {Integer} cwcSrcPos The starting position of the word in *pwcInBuf* in the source text buffer (indicated by the *pTextSource* parameter to [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext)).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                                              | Description                                                                                                                                               |
     * |----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                     | The operation was completed successfully. Also indicates that no more text is available to refill the buffer.<br/>                                  |
     * | <dl> <dt>**LANGUAGE\_S\_LARGE\_WORD** </dt> </dl> | Value of *cwc* is larger than the value for *ulMaxTokenSize* that is specified in [**IWordBreaker::Init**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-init). <br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-putword
     */
    PutWord(cwc, pwcInBuf, cwcSrcLen, cwcSrcPos) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "uint", cwc, "ptr", pwcInBuf, "uint", cwcSrcLen, "uint", cwcSrcPos, "HRESULT")
        return result
    }

    /**
     * Puts an alternative word and its position in the IWordSink object.
     * @remarks
     * **PutAltWord** puts an alternative form of a word in the [**IWordSink**](iwordsink.md). The word is put in the same position as the original word in the text source (*pTextSource* in [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext)). By default, **PutAltWord** terminates words with a **WORDREP\_BREAK\_EOW** break type from the [**WORDREP\_BREAK\_TYPE**](/previous-versions/windows/desktop/legacy/ff819130(v=vs.85)) enumerated type.
     * @param {Integer} cwc The number of characters in *pwcInBuf*.
     * @param {PWSTR} pwcInBuf A pointer to a buffer that contains an alternative form of a word from the source text. This parameter is not modified by **PutAltWord**. You can pass the *pTextSource* parameter from [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext) as appropriate.
     * @param {Integer} cwcSrcLen The number of characters in the source text buffer (indicated by the *pTextSource* parameter to [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext)) that correspond to the word contained in *pwcInBuf*.
     * @param {Integer} cwcSrcPos The starting position of the word in *pwcInBuf* in the source text buffer (indicated by the *pTextSource* parameter to [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext)).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                                              | Description                                                                                                                                               |
     * |----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                     | The operation was completed successfully. Also indicates that no more text remains to be processed.<br/>                                            |
     * | <dl> <dt>**LANGUAGE\_S\_LARGE\_WORD** </dt> </dl> | Value of *cwc* is larger than the value for *ulMaxTokenSize* that is specified in [**IWordBreaker::Init**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-init). <br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-putaltword
     */
    PutAltWord(cwc, pwcInBuf, cwcSrcLen, cwcSrcPos) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "uint", cwc, "ptr", pwcInBuf, "uint", cwcSrcLen, "uint", cwcSrcPos, "HRESULT")
        return result
    }

    /**
     * Indicates the boundary between phrases in a sequence of alternative phrases that a word breaker generates during index time.
     * @remarks
     * Each alternative phrase starts with a **StartAltPhrase** call. The phrase is put in the [**IWordSink**](iwordsink.md) object through subsequent calls to the [**IWordSink::PutWord**](iwordsink-putword.md) or [**IWordSink::PutAltWord**](iwordsink-putaltword.md) method. The final alternative phrase in a sequence of phrases is terminated with a call to the [**IWordSink::EndAltPhrase**](iwordsink-endaltphrase.md) method.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                                           | Description                                                                                |
     * |-------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
     * | <dl> <dt>**WBREAK\_E\_QUERY\_ONLY**</dt> </dl> | [**StartAltPhrase**](iwordsink-startaltphrase.md) is called during query time.<br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-startaltphrase
     */
    StartAltPhrase() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Indicates the end of the final phrase in a sequence of alternative phrases that a word breaker generates during index time.
     * @remarks
     * [**IWordBreaker**](/windows/win32/api/indexsrv/nn-indexsrv-iwordbreaker) implementations call **IWordSink::EndAltPhrase** from the [**IWordBreaker::BreakText**](/windows/win32/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext) method to terminate a sequence of alternative phrases. The [**IWordSink::StartAltPhrase**](iwordsink-startaltphrase.md) method is called to indicate the end of one phrase and the beginning of another in a sequence of phrases. Only the last phrase in a sequence is terminated with a call to **EndAltPhrase**.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                                           | Description                                                                            |
     * |-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
     * | <dl> <dt>**WBREAK\_E\_QUERY\_ONLY**</dt> </dl> | [**EndAltPhrase**](iwordsink-endaltphrase.md) is called during query time.<br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-endaltphrase
     */
    EndAltPhrase() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Puts a break after the preceding word.
     * @remarks
     * The [**IWordSinkPutWord**](iwordsink-putword.md) and [**IWordSink::PutAltWord**](iwordsink-putaltword.md) methods automatically insert an end-of-word break (EOW, indicated by the WORDREP\_BREAK\_EOW element of the [**WORDREP\_BREAK\_TYPE**](/previous-versions/windows/desktop/legacy/ff819130(v=vs.85)) enumerated type) after each word. Call the **PutBreak** method to insert a break type other than end of word. This method does not change the source text buffer (*pSourceText*) or increment the character count (*cwc*). However, it does increment the current position in the index and affects query results.
     * @param {WORDREP_BREAK_TYPE} breakType A value from [**WORDREP\_BREAK\_TYPE**](/previous-versions/windows/desktop/legacy/ff819130(v=vs.85)) that indicates the type of break that the WordSink inserts after the preceding word. Each break occupies a unique position in the index. Therefore, inserting breaks between words changes the relative distance between words.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                          | Description                                          |
     * |--------------------------------------------------------------------------------------|------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The operation was completed successfully.<br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordsink-putbreak
     */
    PutBreak(breakType) {
        result := ComCall(7, this, WORDREP_BREAK_TYPE, breakType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWordSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutWord := CallbackCreate(GetMethod(implObj, "PutWord"), flags, 5)
        this.vtbl.PutAltWord := CallbackCreate(GetMethod(implObj, "PutAltWord"), flags, 5)
        this.vtbl.StartAltPhrase := CallbackCreate(GetMethod(implObj, "StartAltPhrase"), flags, 1)
        this.vtbl.EndAltPhrase := CallbackCreate(GetMethod(implObj, "EndAltPhrase"), flags, 1)
        this.vtbl.PutBreak := CallbackCreate(GetMethod(implObj, "PutBreak"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutWord)
        CallbackFree(this.vtbl.PutAltWord)
        CallbackFree(this.vtbl.StartAltPhrase)
        CallbackFree(this.vtbl.EndAltPhrase)
        CallbackFree(this.vtbl.PutBreak)
    }
}
