#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILanguageExceptionErrorInfo2.ahk
#Include .\ILanguageExceptionErrorInfo.ahk

/**
 * Enables language projections to provide and retrieve error information as with ILanguageExceptionErrorInfo, with the additional benefit of working across language boundaries.
 * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo2
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ILanguageExceptionErrorInfo2 extends ILanguageExceptionErrorInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageExceptionErrorInfo2
     * @type {Guid}
     */
    static IID => Guid("{5746e5c4-5b97-424c-b620-2822915734dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreviousLanguageExceptionErrorInfo", "CapturePropagationContext", "GetPropagationContextHead"]

    /**
     * Retrieves the previous language exception error information object.
     * @returns {ILanguageExceptionErrorInfo2} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo2">ILanguageExceptionErrorInfo2</a> object that contains the previous error information object.
     * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpreviouslanguageexceptionerrorinfo
     */
    GetPreviousLanguageExceptionErrorInfo() {
        result := ComCall(4, this, "ptr*", &previousLanguageExceptionErrorInfo := 0, "HRESULT")
        return ILanguageExceptionErrorInfo2(previousLanguageExceptionErrorInfo)
    }

    /**
     * Captures the context of an exception across a language boundary and across threads.
     * @param {IUnknown} languageException An error object that's apartment-agile, in-proc, and marshal-by-value across processes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-capturepropagationcontext
     */
    CapturePropagationContext(languageException) {
        result := ComCall(5, this, "ptr", languageException, "HRESULT")
        return result
    }

    /**
     * Retrieves the propagation context head.
     * @returns {ILanguageExceptionErrorInfo2} On success, returns an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo2">ILanguageExceptionErrorInfo2</a> object that represents the head of the propagation context.
     * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpropagationcontexthead
     */
    GetPropagationContextHead() {
        result := ComCall(6, this, "ptr*", &propagatedLanguageExceptionErrorInfoHead := 0, "HRESULT")
        return ILanguageExceptionErrorInfo2(propagatedLanguageExceptionErrorInfoHead)
    }
}
