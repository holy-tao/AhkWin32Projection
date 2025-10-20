#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectToken.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectTokenInit extends ISpObjectToken{
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
     * 
     * @param {PWSTR} pszCategoryId 
     * @param {PWSTR} pszTokenId 
     * @param {Pointer<ISpDataKey>} pDataKey 
     * @returns {HRESULT} 
     */
    InitFromDataKey(pszCategoryId, pszTokenId, pDataKey) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(25, this, "ptr", pszCategoryId, "ptr", pszTokenId, "ptr", pDataKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
