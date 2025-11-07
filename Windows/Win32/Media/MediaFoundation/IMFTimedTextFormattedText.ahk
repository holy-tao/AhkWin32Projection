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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-gettext
     */
    GetText() {
        result := ComCall(3, this, "ptr*", &text := 0, "HRESULT")
        return text
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-getsubformattingcount
     */
    GetSubformattingCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Integer>} firstChar 
     * @param {Pointer<Integer>} charLength 
     * @param {Pointer<IMFTimedTextStyle>} style 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextformattedtext-getsubformatting
     */
    GetSubformatting(index, firstChar, charLength, style) {
        firstCharMarshal := firstChar is VarRef ? "uint*" : "ptr"
        charLengthMarshal := charLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", index, firstCharMarshal, firstChar, charLengthMarshal, charLength, "ptr*", style, "HRESULT")
        return result
    }
}
