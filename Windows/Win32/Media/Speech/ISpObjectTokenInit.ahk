#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectToken.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectTokenInit extends ISpObjectToken{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpObjectTokenInit
     * @type {Guid}
     */
    static IID => Guid("{b8aab0cf-346f-49d8-9499-c8b03f161d51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitFromDataKey"]

    /**
     * 
     * @param {PWSTR} pszCategoryId 
     * @param {PWSTR} pszTokenId 
     * @param {ISpDataKey} pDataKey 
     * @returns {HRESULT} 
     */
    InitFromDataKey(pszCategoryId, pszTokenId, pDataKey) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(25, this, "ptr", pszCategoryId, "ptr", pszTokenId, "ptr", pDataKey, "HRESULT")
        return result
    }
}
