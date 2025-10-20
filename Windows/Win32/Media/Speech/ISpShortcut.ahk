#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpShortcut extends IUnknown{
    /**
     * The interface identifier for ISpShortcut
     * @type {Guid}
     */
    static IID => Guid("{3df681e2-ea56-11d9-8bde-f66bad1e3f3a}")

    /**
     * The class identifier for SpShortcut
     * @type {Guid}
     */
    static CLSID => Guid("{0d722f1a-9fcf-4e62-96d8-6df8f01a26aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszDisplay 
     * @param {Integer} LangID 
     * @param {PWSTR} pszSpoken 
     * @param {Integer} shType 
     * @returns {HRESULT} 
     */
    AddShortcut(pszDisplay, LangID, pszSpoken, shType) {
        pszDisplay := pszDisplay is String ? StrPtr(pszDisplay) : pszDisplay
        pszSpoken := pszSpoken is String ? StrPtr(pszSpoken) : pszSpoken

        result := ComCall(3, this, "ptr", pszDisplay, "ushort", LangID, "ptr", pszSpoken, "int", shType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDisplay 
     * @param {Integer} LangID 
     * @param {PWSTR} pszSpoken 
     * @param {Integer} shType 
     * @returns {HRESULT} 
     */
    RemoveShortcut(pszDisplay, LangID, pszSpoken, shType) {
        pszDisplay := pszDisplay is String ? StrPtr(pszDisplay) : pszDisplay
        pszSpoken := pszSpoken is String ? StrPtr(pszSpoken) : pszSpoken

        result := ComCall(4, this, "ptr", pszDisplay, "ushort", LangID, "ptr", pszSpoken, "int", shType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LangID 
     * @param {Pointer<SPSHORTCUTPAIRLIST>} pShortcutpairList 
     * @returns {HRESULT} 
     */
    GetShortcuts(LangID, pShortcutpairList) {
        result := ComCall(5, this, "ushort", LangID, "ptr", pShortcutpairList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @returns {HRESULT} 
     */
    GetGeneration(pdwGeneration) {
        result := ComCall(6, this, "uint*", pdwGeneration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetWordsFromGenerationChange(pdwGeneration, pWordList) {
        result := ComCall(7, this, "uint*", pdwGeneration, "ptr", pWordList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetWords(pdwGeneration, pdwCookie, pWordList) {
        result := ComCall(8, this, "uint*", pdwGeneration, "uint*", pdwCookie, "ptr", pWordList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<SPSHORTCUTPAIRLIST>} pShortcutpairList 
     * @returns {HRESULT} 
     */
    GetShortcutsForGeneration(pdwGeneration, pdwCookie, pShortcutpairList) {
        result := ComCall(9, this, "uint*", pdwGeneration, "uint*", pdwCookie, "ptr", pShortcutpairList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwGeneration 
     * @param {Pointer<SPSHORTCUTPAIRLIST>} pShortcutpairList 
     * @returns {HRESULT} 
     */
    GetGenerationChange(pdwGeneration, pShortcutpairList) {
        result := ComCall(10, this, "uint*", pdwGeneration, "ptr", pShortcutpairList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
