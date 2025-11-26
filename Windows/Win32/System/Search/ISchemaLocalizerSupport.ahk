#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method for localizing keywords in a specified string.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-ischemalocalizersupport
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISchemaLocalizerSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaLocalizerSupport
     * @type {Guid}
     */
    static IID => Guid("{ca3fdca2-bfbe-4eed-90d7-0caef0a1bda1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Localize"]

    /**
     * Localizes keywords from an input string.
     * @param {PWSTR} pszGlobalString Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string to be localized. It may be in one of two forms: (1) a set of keywords separated by the vertical bar character (Unicode character code 007C) (for example "date modified|modified|modification date"), or (2) a string of the form "@some.dll,-12345". This example refers to resource ID 12345 of the some.dll binary. That resource must be a string of the previous (1) form.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Returns a null-terminated Unicode string that is the localized string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. If the method does not succeed, this parameter is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-ischemalocalizersupport-localize
     */
    Localize(pszGlobalString) {
        pszGlobalString := pszGlobalString is String ? StrPtr(pszGlobalString) : pszGlobalString

        result := ComCall(3, this, "ptr", pszGlobalString, "ptr*", &ppszLocalString := 0, "HRESULT")
        return ppszLocalString
    }
}
