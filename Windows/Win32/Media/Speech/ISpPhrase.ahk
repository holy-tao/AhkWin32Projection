#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhrase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpPhrase
     * @type {Guid}
     */
    static IID => Guid("{1a5c0354-b621-4b5a-8791-d306ed379e53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPhrase", "GetSerializedPhrase", "GetText", "Discard"]

    /**
     * 
     * @returns {Pointer<SPPHRASE>} 
     */
    GetPhrase() {
        result := ComCall(3, this, "ptr*", &ppCoMemPhrase := 0, "HRESULT")
        return ppCoMemPhrase
    }

    /**
     * 
     * @returns {Pointer<SPSERIALIZEDPHRASE>} 
     */
    GetSerializedPhrase() {
        result := ComCall(4, this, "ptr*", &ppCoMemPhrase := 0, "HRESULT")
        return ppCoMemPhrase
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
     * @param {Integer} ulStart 
     * @param {Integer} ulCount 
     * @param {BOOL} fUseTextReplacements 
     * @param {Pointer<PWSTR>} ppszCoMemText 
     * @param {Pointer<Integer>} pbDisplayAttributes 
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
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-gettextalign
     */
    GetText(ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes) {
        ppszCoMemTextMarshal := ppszCoMemText is VarRef ? "ptr*" : "ptr"
        pbDisplayAttributesMarshal := pbDisplayAttributes is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", ulStart, "uint", ulCount, "int", fUseTextReplacements, ppszCoMemTextMarshal, ppszCoMemText, pbDisplayAttributesMarshal, pbDisplayAttributes, "HRESULT")
        return result
    }

    /**
     * Discards the memory contents of a range of memory pages, without decommitting the memory. The contents of discarded memory is undefined and must be rewritten by the application.
     * @remarks
     * If <b>DiscardVirtualMemory</b> fails, the contents of the region is not altered.
     * 
     * Use this function to discard memory contents that are no longer needed, while keeping the memory region itself committed.
     *       Discarding memory may give physical RAM back to the system.
     *       When the region of memory is again accessed by the application, the backing RAM is restored, and the contents of the memory is undefined.
     * 
     * <div class="alert"><b>Important</b>  Calls to <b>DiscardVirtualMemory</b> will fail if the memory protection is not <b>PAGE_READWRITE</b>.</div>
     * <div> </div>
     * @param {Integer} dwValueTypes 
     * @returns {HRESULT} ERROR_SUCCESS if successful; a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Code</a> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-discardvirtualmemory
     */
    Discard(dwValueTypes) {
        result := ComCall(6, this, "uint", dwValueTypes, "HRESULT")
        return result
    }
}
