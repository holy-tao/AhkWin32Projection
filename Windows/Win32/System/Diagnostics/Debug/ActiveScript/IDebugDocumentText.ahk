#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentContext.ahk
#Include .\IDebugDocument.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentText extends IDebugDocument{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentText
     * @type {Guid}
     */
    static IID => Guid("{51973c22-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentAttributes", "GetSize", "GetPositionOfLine", "GetLineOfPosition", "GetText", "GetPositionOfContext", "GetContextOfPosition"]

    /**
     * 
     * @returns {Integer} 
     */
    GetDocumentAttributes() {
        result := ComCall(5, this, "uint*", &ptextdocattr := 0, "HRESULT")
        return ptextdocattr
    }

    /**
     * 
     * @param {Pointer<Integer>} pcNumLines 
     * @param {Pointer<Integer>} pcNumChars 
     * @returns {HRESULT} 
     */
    GetSize(pcNumLines, pcNumChars) {
        pcNumLinesMarshal := pcNumLines is VarRef ? "uint*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcNumLinesMarshal, pcNumLines, pcNumCharsMarshal, pcNumChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cLineNumber 
     * @returns {Integer} 
     */
    GetPositionOfLine(cLineNumber) {
        result := ComCall(7, this, "uint", cLineNumber, "uint*", &pcCharacterPosition := 0, "HRESULT")
        return pcCharacterPosition
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Pointer<Integer>} pcLineNumber 
     * @param {Pointer<Integer>} pcCharacterOffsetInLine 
     * @returns {HRESULT} 
     */
    GetLineOfPosition(cCharacterPosition, pcLineNumber, pcCharacterOffsetInLine) {
        pcLineNumberMarshal := pcLineNumber is VarRef ? "uint*" : "ptr"
        pcCharacterOffsetInLineMarshal := pcCharacterOffsetInLine is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", cCharacterPosition, pcLineNumberMarshal, pcLineNumber, pcCharacterOffsetInLineMarshal, pcCharacterOffsetInLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {PWSTR} pcharText 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @param {Pointer<Integer>} pcNumChars 
     * @param {Integer} cMaxChars 
     * @returns {HRESULT} 
     */
    GetText(cCharacterPosition, pcharText, pstaTextAttr, pcNumChars, cMaxChars) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cCharacterPosition, "ptr", pcharText, pstaTextAttrMarshal, pstaTextAttr, pcNumCharsMarshal, pcNumChars, "uint", cMaxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentContext} psc 
     * @param {Pointer<Integer>} pcCharacterPosition 
     * @param {Pointer<Integer>} cNumChars 
     * @returns {HRESULT} 
     */
    GetPositionOfContext(psc, pcCharacterPosition, cNumChars) {
        pcCharacterPositionMarshal := pcCharacterPosition is VarRef ? "uint*" : "ptr"
        cNumCharsMarshal := cNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", psc, pcCharacterPositionMarshal, pcCharacterPosition, cNumCharsMarshal, cNumChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumChars 
     * @returns {IDebugDocumentContext} 
     */
    GetContextOfPosition(cCharacterPosition, cNumChars) {
        result := ComCall(11, this, "uint", cCharacterPosition, "uint", cNumChars, "ptr*", &ppsc := 0, "HRESULT")
        return IDebugDocumentContext(ppsc)
    }
}
