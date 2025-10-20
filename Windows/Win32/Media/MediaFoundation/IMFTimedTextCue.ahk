#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the timed-text-cue object.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextcue
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextCue extends IUnknown{
    /**
     * The interface identifier for IMFTimedTextCue
     * @type {Guid}
     */
    static IID => Guid("{1e560447-9a2b-43e1-a94c-b0aaabfbfbc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} originalId 
     * @returns {HRESULT} 
     */
    GetOriginalId(originalId) {
        result := ComCall(4, this, "ptr", originalId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCueKind() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetStartTime() {
        result := ComCall(6, this, "double")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDuration() {
        result := ComCall(7, this, "double")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTrackId() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextBinary>} data 
     * @returns {HRESULT} 
     */
    GetData(data) {
        result := ComCall(9, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextRegion>} region 
     * @returns {HRESULT} 
     */
    GetRegion(region) {
        result := ComCall(10, this, "ptr", region, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextStyle>} style 
     * @returns {HRESULT} 
     */
    GetStyle(style) {
        result := ComCall(11, this, "ptr", style, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLineCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IMFTimedTextFormattedText>} line 
     * @returns {HRESULT} 
     */
    GetLine(index, line) {
        result := ComCall(13, this, "uint", index, "ptr", line, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
