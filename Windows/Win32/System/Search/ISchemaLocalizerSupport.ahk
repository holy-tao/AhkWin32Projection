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
     * 
     * @param {PWSTR} pszGlobalString 
     * @param {Pointer<PWSTR>} ppszLocalString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-ischemalocalizersupport-localize
     */
    Localize(pszGlobalString, ppszLocalString) {
        pszGlobalString := pszGlobalString is String ? StrPtr(pszGlobalString) : pszGlobalString

        result := ComCall(3, this, "ptr", pszGlobalString, "ptr", ppszLocalString, "HRESULT")
        return result
    }
}
