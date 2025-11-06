#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextBinary.ahk
#Include .\IMFTimedTextRegion.ahk
#Include .\IMFTimedTextStyle.ahk
#Include .\IMFTimedTextFormattedText.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the timed-text-cue object.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextcue
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextCue extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetOriginalId", "GetCueKind", "GetStartTime", "GetDuration", "GetTrackId", "GetData", "GetRegion", "GetStyle", "GetLineCount", "GetLine"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getid
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getoriginalid
     */
    GetOriginalId() {
        result := ComCall(4, this, "ptr*", &originalId := 0, "HRESULT")
        return originalId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getcuekind
     */
    GetCueKind() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getstarttime
     */
    GetStartTime() {
        result := ComCall(6, this, "double")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getduration
     */
    GetDuration() {
        result := ComCall(7, this, "double")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-gettrackid
     */
    GetTrackId() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {IMFTimedTextBinary} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getdata
     */
    GetData() {
        result := ComCall(9, this, "ptr*", &data := 0, "HRESULT")
        return IMFTimedTextBinary(data)
    }

    /**
     * 
     * @returns {IMFTimedTextRegion} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getregion
     */
    GetRegion() {
        result := ComCall(10, this, "ptr*", &region := 0, "HRESULT")
        return IMFTimedTextRegion(region)
    }

    /**
     * 
     * @returns {IMFTimedTextStyle} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getstyle
     */
    GetStyle() {
        result := ComCall(11, this, "ptr*", &style := 0, "HRESULT")
        return IMFTimedTextStyle(style)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getlinecount
     */
    GetLineCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IMFTimedTextFormattedText} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getline
     */
    GetLine(index) {
        result := ComCall(13, this, "uint", index, "ptr*", &line := 0, "HRESULT")
        return IMFTimedTextFormattedText(line)
    }
}
