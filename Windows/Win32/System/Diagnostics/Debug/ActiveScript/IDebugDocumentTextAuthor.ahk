#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentText.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentTextAuthor extends IDebugDocumentText{
    /**
     * The interface identifier for IDebugDocumentTextAuthor
     * @type {Guid}
     */
    static IID => Guid("{51973c24-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToInsert 
     * @param {PWSTR} pcharText 
     * @returns {HRESULT} 
     */
    InsertText(cCharacterPosition, cNumToInsert, pcharText) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        result := ComCall(12, this, "uint", cCharacterPosition, "uint", cNumToInsert, "ptr", pcharText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToRemove 
     * @returns {HRESULT} 
     */
    RemoveText(cCharacterPosition, cNumToRemove) {
        result := ComCall(13, this, "uint", cCharacterPosition, "uint", cNumToRemove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumToReplace 
     * @param {PWSTR} pcharText 
     * @returns {HRESULT} 
     */
    ReplaceText(cCharacterPosition, cNumToReplace, pcharText) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        result := ComCall(14, this, "uint", cCharacterPosition, "uint", cNumToReplace, "ptr", pcharText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
