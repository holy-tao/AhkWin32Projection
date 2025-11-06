#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhrase.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhraseAlt extends ISpPhrase{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAltInfo", "Commit"]

    /**
     * 
     * @param {Pointer<Integer>} pulStartElementInParent 
     * @param {Pointer<Integer>} pcElementsInParent 
     * @param {Pointer<Integer>} pcElementsInAlt 
     * @returns {ISpPhrase} 
     */
    GetAltInfo(pulStartElementInParent, pcElementsInParent, pcElementsInAlt) {
        pulStartElementInParentMarshal := pulStartElementInParent is VarRef ? "uint*" : "ptr"
        pcElementsInParentMarshal := pcElementsInParent is VarRef ? "uint*" : "ptr"
        pcElementsInAltMarshal := pcElementsInAlt is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr*", &ppParent := 0, pulStartElementInParentMarshal, pulStartElementInParent, pcElementsInParentMarshal, pcElementsInParent, pcElementsInAltMarshal, pcElementsInAlt, "HRESULT")
        return ISpPhrase(ppParent)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
