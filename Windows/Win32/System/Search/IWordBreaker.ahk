#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Parses text and identifies individual words and phrases. This interface is a language-specific language resource component. It is used in background processes and must be optimized for both throughput and minimal use of resources.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement this interface to create a custom word breaker for a language. Windows Search calls the methods of this interface when it builds content indexes and runs queries.
 * 
 * Word breaker components for Windows Search run in the Local Security context. They should be written to manage buffers and the stack correctly. All string copies must have explicit checks to guard against buffer overruns. You should always verify the allocated size of the buffer and test the size of the data against the size of the buffer.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-iwordbreaker
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IWordBreaker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWordBreaker
     * @type {Guid}
     */
    static IID => Guid("{d53552c8-77e3-101a-b552-08002b33b0e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "BreakText", "ComposePhrase", "GetLicenseToUse"]

    /**
     * Initializes the IWordBreaker implementation and indicates the mode in which the component operates.
     * @param {BOOL} fQuery Type: <b>BOOL</b>
     * 
     * Flag that indicates the mode in which a word breaker operates. <b>TRUE</b> indicates query-time word breaking. <b>FALSE</b> indicates index-time word breaking.
     * @param {Integer} ulMaxTokenSize Type: <b>ULONG</b>
     * 
     * Maximum number of characters in words that are added to the <a href="https://docs.microsoft.com/windows/desktop/search/iwordsink">IWordSink</a>. Words that exceed this limit are truncated.
     * @param {Pointer<BOOL>} pfLicense Type: <b>BOOL*</b>
     * 
     * Pointer to a variable that receives a flag indicating whether there are license restrictions for this <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> implementation. <b>TRUE</b> indicates that the stemmer is restricted to authorized use only. <b>FALSE</b> indicates that this <b>IWordBreaker</b> implementation can be used freely.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * Successful completion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>LANGUAGE_E_DATABASE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the components for word breaking cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. The <i>pfLicense</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Other errors. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-iwordbreaker-init
     */
    Init(fQuery, ulMaxTokenSize, pfLicense) {
        pfLicenseMarshal := pfLicense is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", fQuery, "uint", ulMaxTokenSize, pfLicenseMarshal, pfLicense, "HRESULT")
        return result
    }

    /**
     * Parses text to identify words and phrases and provides the results to the IWordSink and IPhraseSink objects.
     * @param {Pointer<TEXT_SOURCE>} pTextSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/ns-indexsrv-text_source">TEXT_SOURCE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/ns-indexsrv-text_source">TEXT_SOURCE</a> structure that contains Unicode text.
     * @param {IWordSink} pWordSink Type: <b>IWordSink*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/search/iwordsink">IWordSink</a> object that receives and handles words generated by this method. <b>NULL</b> indicates that this method should identify phrases only.
     * @param {IPhraseSink} pPhraseSink Type: <b>IPhraseSink*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iphrasesink">IPhraseSink</a> object that receives and handles phrases generated by this method. <b>NULL</b> indicates that this method should identify individual words, not phrases.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * Operation was successful. No more text is available to refill the <i>pTextSource</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. The <i>pTextSource</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-iwordbreaker-breaktext
     */
    BreakText(pTextSource, pWordSink, pPhraseSink) {
        result := ComCall(4, this, "ptr", pTextSource, "ptr", pWordSink, "ptr", pPhraseSink, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @param {PWSTR} pwcNoun TBD
     * @param {Integer} cwcNoun TBD
     * @param {PWSTR} pwcModifier TBD
     * @param {Integer} cwcModifier TBD
     * @param {Integer} ulAttachmentType TBD
     * @param {PWSTR} pwcPhrase TBD
     * @param {Pointer<Integer>} pcwcPhrase TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-iwordbreaker-composephrase
     */
    ComposePhrase(pwcNoun, cwcNoun, pwcModifier, cwcModifier, ulAttachmentType, pwcPhrase, pcwcPhrase) {
        pwcNoun := pwcNoun is String ? StrPtr(pwcNoun) : pwcNoun
        pwcModifier := pwcModifier is String ? StrPtr(pwcModifier) : pwcModifier
        pwcPhrase := pwcPhrase is String ? StrPtr(pwcPhrase) : pwcPhrase

        pcwcPhraseMarshal := pcwcPhrase is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwcNoun, "uint", cwcNoun, "ptr", pwcModifier, "uint", cwcModifier, "uint", ulAttachmentType, "ptr", pwcPhrase, pcwcPhraseMarshal, pcwcPhrase, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the license information for this implementation of the IWordBreaker interface.
     * @param {Pointer<Pointer<Integer>>} ppwcsLicense Type: <b>WCHAR const**</b>
     * 
     * Pointer to a variable that receives a pointer to the license information for this <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nn-indexsrv-iwordbreaker">IWordBreaker</a> implementation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-iwordbreaker-getlicensetouse
     */
    GetLicenseToUse(ppwcsLicense) {
        ppwcsLicenseMarshal := ppwcsLicense is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppwcsLicenseMarshal, ppwcsLicense, "HRESULT")
        return result
    }
}
