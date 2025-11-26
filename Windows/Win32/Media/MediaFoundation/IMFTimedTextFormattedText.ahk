#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a block of formatted timed-text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextformattedtext
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextFormattedText extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextFormattedText
     * @type {Guid}
     */
    static IID => Guid("{e13af3c1-4d47-4354-b1f5-e83ae0ecae60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetText", "GetSubformattingCount", "GetSubformatting"]

    /**
     * Gets the text in the formatted timed-text object.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a variable that receives the null-terminated wide-character string that contains the text.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-gettext
     */
    GetText() {
        result := ComCall(3, this, "ptr*", &text := 0, "HRESULT")
        return text
    }

    /**
     * Gets the number of subformats in the formatted timed-text object.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the number of subformats.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-getsubformattingcount
     */
    GetSubformattingCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Gets a subformat in the formatted timed-text object.
     * @param {Integer} index Type: <b>DWORD</b>
     * 
     * The index of the subformat in the formatted timed-text object.
     * @param {Pointer<Integer>} firstChar Type: <b>DWORD*</b>
     * 
     * A pointer to a variable that receives the first character of the subformat.
     * @param {Pointer<Integer>} charLength Type: <b>DWORD*</b>
     * 
     * A pointer to a variable that receives the length, in characters, of the subformat.
     * @param {Pointer<IMFTimedTextStyle>} style Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle">IMFTimedTextStyle</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle">IMFTimedTextStyle</a> interface for the subformat's timed-text style. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-getsubformatting
     */
    GetSubformatting(index, firstChar, charLength, style) {
        firstCharMarshal := firstChar is VarRef ? "uint*" : "ptr"
        charLengthMarshal := charLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", index, firstCharMarshal, firstChar, charLengthMarshal, charLength, "ptr*", style, "HRESULT")
        return result
    }
}
