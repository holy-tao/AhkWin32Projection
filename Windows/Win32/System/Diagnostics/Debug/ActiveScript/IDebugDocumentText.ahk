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
        result := ComCall(5, this, "uint*", &ptextdocattr := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(6, this, pcNumLinesMarshal, pcNumLines, pcNumCharsMarshal, pcNumChars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} cLineNumber 
     * @returns {Integer} 
     */
    GetPositionOfLine(cLineNumber) {
        result := ComCall(7, this, "uint", cLineNumber, "uint*", &pcCharacterPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(8, this, "uint", cCharacterPosition, pcLineNumberMarshal, pcLineNumber, pcCharacterOffsetInLineMarshal, pcCharacterOffsetInLine, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetTextAlign function retrieves the text-alignment setting for the specified device context.
     * @remarks
     * The bounding rectangle is a rectangle bounding all of the character cells in a string of text. Its dimensions can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentpoint32a">GetTextExtentPoint32</a> function.
     * 
     * The text-alignment flags determine how the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions align a string of text in relation to the string's reference point provided to <b>TextOut</b> or <b>ExtTextOut</b>.
     * 
     * The text-alignment flags are not necessarily single bit flags and may be equal to zero. The flags must be examined in groups of related flags, as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and TA_CENTER</li>
     * <li>TA_BOTTOM, TA_TOP, and TA_BASELINE</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * If the current font has a vertical default base line, the related flags are as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and VTA_BASELINE</li>
     * <li>TA_BOTTOM, TA_TOP, and VTA_CENTER</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * <p class="proch"><b>To verify that a particular flag is set in the return value of this function:</b>
     * 
     * <ol>
     * <li>Apply the bitwise OR operator to the flag and its related flags.</li>
     * <li>Apply the bitwise AND operator to the result and the return value.</li>
     * <li>Test for the equality of this result and the flag.</li>
     * </ol>
     * @param {Integer} cCharacterPosition 
     * @param {PWSTR} pcharText 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @param {Pointer<Integer>} pcNumChars 
     * @param {Integer} cMaxChars 
     * @returns {HRESULT} If the function succeeds, the return value is the status of the text-alignment flags. For more information about the return value, see the Remarks section. The return value is a combination of the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TA_BASELINE</td>
     * <td>The reference point is on the base line of the text.</td>
     * </tr>
     * <tr>
     * <td>TA_BOTTOM</td>
     * <td>The reference point is on the bottom edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_TOP</td>
     * <td>The reference point is on the top edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_CENTER</td>
     * <td>The reference point is aligned horizontally with the center of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_LEFT</td>
     * <td>The reference point is on the left edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_RIGHT</td>
     * <td>The reference point is on the right edge of the bounding rectangle.</td>
     * </tr>
     * <tr>
     * <td>TA_RTLREADING</td>
     * <td><b>Middle East language edition of Windows:</b> The text is laid out in right to left reading order, as opposed to the default left to right order. This only applies when the font selected into the device context is either Hebrew or Arabic.</td>
     * </tr>
     * <tr>
     * <td>TA_NOUPDATECP</td>
     * <td>The current position is not updated after each text output call.</td>
     * </tr>
     * <tr>
     * <td>TA_UPDATECP</td>
     * <td>The current position is updated after each text output call.</td>
     * </tr>
     * </table>
     *  
     * 
     * When the current font has a vertical default base line (as with Kanji), the following values are used instead of TA_BASELINE and TA_CENTER.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>VTA_BASELINE</td>
     * <td>The reference point is on the base line of the text.</td>
     * </tr>
     * <tr>
     * <td>VTA_CENTER</td>
     * <td>The reference point is aligned vertically with the center of the bounding rectangle.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-gettextalign
     */
    GetText(cCharacterPosition, pcharText, pstaTextAttr, pcNumChars, cMaxChars) {
        pcharText := pcharText is String ? StrPtr(pcharText) : pcharText

        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"
        pcNumCharsMarshal := pcNumChars is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cCharacterPosition, "ptr", pcharText, pstaTextAttrMarshal, pstaTextAttr, pcNumCharsMarshal, pcNumChars, "uint", cMaxChars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(10, this, "ptr", psc, pcCharacterPositionMarshal, pcCharacterPosition, cNumCharsMarshal, cNumChars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} cCharacterPosition 
     * @param {Integer} cNumChars 
     * @returns {IDebugDocumentContext} 
     */
    GetContextOfPosition(cCharacterPosition, cNumChars) {
        result := ComCall(11, this, "uint", cCharacterPosition, "uint", cNumChars, "ptr*", &ppsc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugDocumentContext(ppsc)
    }
}
