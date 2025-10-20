#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocument.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentText extends IDebugDocument{
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
     * 
     * @param {Pointer<UInt32>} ptextdocattr 
     * @returns {HRESULT} 
     */
    GetDocumentAttributes(ptextdocattr) {
        result := ComCall(5, this, "uint*", ptextdocattr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcNumLines 
     * @param {Pointer<UInt32>} pcNumChars 
     * @returns {HRESULT} 
     */
    GetSize(pcNumLines, pcNumChars) {
        result := ComCall(6, this, "uint*", pcNumLines, "uint*", pcNumChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cLineNumber 
     * @param {Pointer<UInt32>} pcCharacterPosition 
     * @returns {HRESULT} 
     */
    GetPositionOfLine(cLineNumber, pcCharacterPosition) {
        result := ComCall(7, this, "uint", cLineNumber, "uint*", pcCharacterPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Pointer<UInt32>} pcLineNumber 
     * @param {Pointer<UInt32>} pcCharacterOffsetInLine 
     * @returns {HRESULT} 
     */
    GetLineOfPosition(cCharacterPosition, pcLineNumber, pcCharacterOffsetInLine) {
        result := ComCall(8, this, "uint", cCharacterPosition, "uint*", pcLineNumber, "uint*", pcCharacterOffsetInLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {PWSTR} pcharText 
     * @param {Pointer<UInt16>} pstaTextAttr 
     * @param {Pointer<UInt32>} pcNumChars 
     * @param {Integer} cMaxChars 
     * @returns {HRESULT} 
     */
    GetText(cCharacterPosition, pcharText, pstaTextAttr, pcNumChars, cMaxChars) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        result := ComCall(9, this, "uint", cCharacterPosition, "ptr", pcharText, "ushort*", pstaTextAttr, "uint*", pcNumChars, "uint", cMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugDocumentContext>} psc 
     * @param {Pointer<UInt32>} pcCharacterPosition 
     * @param {Pointer<UInt32>} cNumChars 
     * @returns {HRESULT} 
     */
    GetPositionOfContext(psc, pcCharacterPosition, cNumChars) {
        result := ComCall(10, this, "ptr", psc, "uint*", pcCharacterPosition, "uint*", cNumChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumChars 
     * @param {Pointer<IDebugDocumentContext>} ppsc 
     * @returns {HRESULT} 
     */
    GetContextOfPosition(cCharacterPosition, cNumChars, ppsc) {
        result := ComCall(11, this, "uint", cCharacterPosition, "uint", cNumChars, "ptr", ppsc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
