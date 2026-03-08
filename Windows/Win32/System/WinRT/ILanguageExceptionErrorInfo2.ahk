#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILanguageExceptionErrorInfo2.ahk
#Include .\ILanguageExceptionErrorInfo.ahk

/**
 * Enables language projections to provide and retrieve error information as with ILanguageExceptionErrorInfo, with the additional benefit of working across language boundaries.
 * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo2
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
     * @remarks
     * Generally speaking, <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpropagationcontexthead">GetPropagationContextHead</a> is utilized to retrieve the linked list of <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> objects that contains additional error information on the exception in question. You can then use <b>GetPreviousLanguageExceptionErrorInfo</b> to move through that linked list, and examine each error separately.
     * 
     * 
     * The operating system also uses this method to retrieve the stored exceptions associated with the error.
     * @returns {ILanguageExceptionErrorInfo2} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo2">ILanguageExceptionErrorInfo2</a> object that contains the previous error information object.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpreviouslanguageexceptionerrorinfo
     */
    GetPreviousLanguageExceptionErrorInfo() {
        result := ComCall(4, this, "ptr*", &previousLanguageExceptionErrorInfo := 0, "HRESULT")
        return ILanguageExceptionErrorInfo2(previousLanguageExceptionErrorInfo)
    }

    /**
     * Captures the context of an exception across a language boundary and across threads.
     * @remarks
     * <b>CapturePropagationContext</b> is utilized by a language projection at re-throw of an error. This includes when an error is received at a language boundary. As such, utilizing <b>CapturePropagationContext</b> helps ensure that the back trace for an exception is captured for a current re-throw. This is to also help ensure that relevant debugging information is not lost when an exception crosses a language border.
     * 
     * Generally speaking, the method creates a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> objects that provide additional error information regarding how the exception propagated. This information is exposed as stowed exceptions referenced by the exception record during crash dump analysis. Using this linked list, you can observe the back trace for all language boundaries and threads that the exception propagated through, including where the error originated from.
     * @param {IUnknown} languageException An error object that's apartment-agile, in-proc, and marshal-by-value across processes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-capturepropagationcontext
     */
    CapturePropagationContext(languageException) {
        result := ComCall(5, this, "ptr", languageException, "HRESULT")
        return result
    }

    /**
     * Retrieves the propagation context head.
     * @remarks
     * You can use <b>GetPropagationContextHead</b> to retrieve the linked list of <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> objects that contains additional error information on the exception in question. You can then use <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpreviouslanguageexceptionerrorinfo">GetPreviousLanguageExceptionErrorInfo</a> to move through that linked list, and examine each error separately.
     * 
     *  The operating system also uses this method to retrieve the stored exceptions associated with the error.
     * @returns {ILanguageExceptionErrorInfo2} On success, returns an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo2">ILanguageExceptionErrorInfo2</a> object that represents the head of the propagation context.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpropagationcontexthead
     */
    GetPropagationContextHead() {
        result := ComCall(6, this, "ptr*", &propagatedLanguageExceptionErrorInfoHead := 0, "HRESULT")
        return ILanguageExceptionErrorInfo2(propagatedLanguageExceptionErrorInfoHead)
    }
}
