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
     * @param {Pointer<PWSTR>} originalId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getoriginalid
     */
    GetOriginalId(originalId) {
        result := ComCall(4, this, "ptr", originalId, "HRESULT")
        return result
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
     * @param {Pointer<IMFTimedTextBinary>} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getdata
     */
    GetData(data) {
        result := ComCall(9, this, "ptr*", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextRegion>} region 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getregion
     */
    GetRegion(region) {
        result := ComCall(10, this, "ptr*", region, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextStyle>} style 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getstyle
     */
    GetStyle(style) {
        result := ComCall(11, this, "ptr*", style, "HRESULT")
        return result
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
     * @param {Pointer<IMFTimedTextFormattedText>} line 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextcue-getline
     */
    GetLine(index, line) {
        result := ComCall(13, this, "uint", index, "ptr*", line, "HRESULT")
        return result
    }
}
