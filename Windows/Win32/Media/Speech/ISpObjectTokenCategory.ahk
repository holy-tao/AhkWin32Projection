#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpDataKey.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectTokenCategory extends ISpDataKey{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpObjectTokenCategory
     * @type {Guid}
     */
    static IID => Guid("{2d3d3845-39af-4850-bbf9-40b49780011d}")

    /**
     * The class identifier for SpObjectTokenCategory
     * @type {Guid}
     */
    static CLSID => Guid("{a910187f-0c7a-45ac-92cc-59edafb77b53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetId", "GetId", "GetDataKey", "EnumTokens", "SetDefaultTokenId", "GetDefaultTokenId"]

    /**
     * 
     * @param {PWSTR} pszCategoryId 
     * @param {BOOL} fCreateIfNotExist 
     * @returns {HRESULT} 
     */
    SetId(pszCategoryId, fCreateIfNotExist) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId

        result := ComCall(15, this, "ptr", pszCategoryId, "int", fCreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCoMemCategoryId 
     * @returns {HRESULT} 
     */
    GetId(ppszCoMemCategoryId) {
        result := ComCall(16, this, "ptr", ppszCoMemCategoryId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} spdkl 
     * @param {Pointer<ISpDataKey>} ppDataKey 
     * @returns {HRESULT} 
     */
    GetDataKey(spdkl, ppDataKey) {
        result := ComCall(17, this, "int", spdkl, "ptr*", ppDataKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pzsReqAttribs 
     * @param {PWSTR} pszOptAttribs 
     * @param {Pointer<IEnumSpObjectTokens>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumTokens(pzsReqAttribs, pszOptAttribs, ppEnum) {
        pzsReqAttribs := pzsReqAttribs is String ? StrPtr(pzsReqAttribs) : pzsReqAttribs
        pszOptAttribs := pszOptAttribs is String ? StrPtr(pszOptAttribs) : pszOptAttribs

        result := ComCall(18, this, "ptr", pzsReqAttribs, "ptr", pszOptAttribs, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTokenId 
     * @returns {HRESULT} 
     */
    SetDefaultTokenId(pszTokenId) {
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(19, this, "ptr", pszTokenId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCoMemTokenId 
     * @returns {HRESULT} 
     */
    GetDefaultTokenId(ppszCoMemTokenId) {
        result := ComCall(20, this, "ptr", ppszCoMemTokenId, "HRESULT")
        return result
    }
}
