#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ILanguageExceptionErrorInfo2>} previousLanguageExceptionErrorInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpreviouslanguageexceptionerrorinfo
     */
    GetPreviousLanguageExceptionErrorInfo(previousLanguageExceptionErrorInfo) {
        result := ComCall(4, this, "ptr*", previousLanguageExceptionErrorInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} languageException 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-capturepropagationcontext
     */
    CapturePropagationContext(languageException) {
        result := ComCall(5, this, "ptr", languageException, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ILanguageExceptionErrorInfo2>} propagatedLanguageExceptionErrorInfoHead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpropagationcontexthead
     */
    GetPropagationContextHead(propagatedLanguageExceptionErrorInfoHead) {
        result := ComCall(6, this, "ptr*", propagatedLanguageExceptionErrorInfoHead, "HRESULT")
        return result
    }
}
