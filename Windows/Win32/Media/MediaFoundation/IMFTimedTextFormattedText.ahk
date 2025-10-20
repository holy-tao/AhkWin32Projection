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
     * 
     * @param {Pointer<PWSTR>} text 
     * @returns {HRESULT} 
     */
    GetText(text) {
        result := ComCall(3, this, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSubformattingCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<UInt32>} firstChar 
     * @param {Pointer<UInt32>} charLength 
     * @param {Pointer<IMFTimedTextStyle>} style 
     * @returns {HRESULT} 
     */
    GetSubformatting(index, firstChar, charLength, style) {
        result := ComCall(5, this, "uint", index, "uint*", firstChar, "uint*", charLength, "ptr", style, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
