#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhrase.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhraseAlt extends ISpPhrase{
    /**
     * The interface identifier for ISpPhraseAlt
     * @type {Guid}
     */
    static IID => Guid("{8fcebc98-4e49-4067-9c6c-d86a0e092e3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISpPhrase>} ppParent 
     * @param {Pointer<UInt32>} pulStartElementInParent 
     * @param {Pointer<UInt32>} pcElementsInParent 
     * @param {Pointer<UInt32>} pcElementsInAlt 
     * @returns {HRESULT} 
     */
    GetAltInfo(ppParent, pulStartElementInParent, pcElementsInParent, pcElementsInAlt) {
        result := ComCall(7, this, "ptr", ppParent, "uint*", pulStartElementInParent, "uint*", pcElementsInParent, "uint*", pcElementsInAlt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
