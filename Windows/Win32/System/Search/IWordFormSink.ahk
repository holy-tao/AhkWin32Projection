#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Handles the list of alternative word forms that stemmers generate during query time.
 * @remarks
 * Windows Search creates and initializes instances of the StemSink object. The <b>IWordFormSink</b> object receives the <i>ulMaxTokenSize</i> parameter during initialization. The value for this parameter is determined by the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-istemmer">IStemmer</a> implementation and determines the maximum length, in characters, for a single word that the <b>IWordFormSink</b> handles.
 * 
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-istemmer">IStemmer</a> implementations receive a pointer to the <b>IWordFormSink</b> object in the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-istemmer-generatewordforms">GenerateWordForms</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nn-indexsrv-iwordformsink
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IWordFormSink extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutAltWord", "PutWord"]

    /**
     * Puts an alternative form of a word in the IWordFormSink object.
     * @remarks
     * This method is called from the [**GenerateWordForms**](/windows/win32/api/indexsrv/nf-indexsrv-istemmer-generatewordforms) method of the [**IStemmer**](/windows/win32/api/indexsrv/nn-indexsrv-istemmer) implementation. All alternative forms for a word, except the last, are put in the [**IWordFormSink**](/windows/desktop/api/Indexsrv/nn-indexsrv-iwordformsink) object by calling **IWordFormSink::PutAltWord**. The final alternative form of a word, which is always the original form of the word, is handled by calling [**IWordFormSink::PutWord**](iwordformsink-putword.md).
     * @param {PWSTR} pwcInBuf A pointer to a buffer that contains an alternative form of a word.
     * @param {Integer} cwc The number of characters in *pwcInBuf*.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                                              | Description                                                                                                                                       |
     * |----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                     | The operation was completed successfully. <br/>                                                                                             |
     * | <dl> <dt>**LANGUAGE\_S\_LARGE\_WORD** </dt> </dl> | Value of *cwc* is larger than the value for *ulMaxTokenSize* that is specified in [**IStemmer::Init**](/windows/win32/api/indexsrv/nf-indexsrv-istemmer-init). <br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordformsink-putphrase
     */
    PutAltWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "ptr", pwcInBuf, "uint", cwc, "HRESULT")
        return result
    }

    /**
     * Puts the original word form in the IWordFormSink object.
     * @remarks
     * **PutWord** is called from the [**GenerateWordForms**](/windows/win32/api/indexsrv/nf-indexsrv-istemmer-generatewordforms) method of the [**IStemmer**](/windows/win32/api/indexsrv/nn-indexsrv-istemmer) implementation. This method handles the original form of a word and is called last. All preceding alternative forms for a word are put in the [**IWordFormSink**](/windows/desktop/api/Indexsrv/nn-indexsrv-iwordformsink) object by calling [**IWordFormSink::PutAltWord**](iwordformsink-putphrase.md).
     * @param {PWSTR} pwcInBuf A pointer to a buffer that contains the final alternative form of a word, which is always the original word.
     * @param {Integer} cwc The number of characters in *pwcInBuf*.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                          | Description                                           |
     * |--------------------------------------------------------------------------------------|-------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The operation was completed successfully. <br/> |
     * @see https://learn.microsoft.com/windows/win32/search/iwordformsink-putword
     */
    PutWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "ptr", pwcInBuf, "uint", cwc, "HRESULT")
        return result
    }
}
