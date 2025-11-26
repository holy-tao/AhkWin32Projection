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
     * Gets the identifier of a timed-text cue.
     * @returns {Integer} Type: <b>DWORD
     * </b>
     * 
     * The identifier of a timed-text cue.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getid
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the cue identifier that is provided in the text-track data format, if available.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * The cue identifier that is provided in the text-track data format.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getoriginalid
     */
    GetOriginalId() {
        result := ComCall(4, this, "ptr*", &originalId := 0, "HRESULT")
        return originalId
    }

    /**
     * Gets the kind of timed-text cue.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a></b>
     * 
     * Returns a <a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_track_kind">MF_TIMED_TEXT_TRACK_KIND</a>-typed value that specifies the kind of timed-text cue.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getcuekind
     */
    GetCueKind() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Gets the start time of the cue in the track.
     * @returns {Float} Type: <b>double</b>
     * 
     * Returns the start time of the cue in the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getstarttime
     */
    GetStartTime() {
        result := ComCall(6, this, "double")
        return result
    }

    /**
     * Gets the duration time of the cue in the track.
     * @returns {Float} Type: <b>double</b>
     * 
     * Returns the duration time of the cue in the track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getduration
     */
    GetDuration() {
        result := ComCall(7, this, "double")
        return result
    }

    /**
     * Gets the identifier of the timed-text cue.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the identifier of the timed-text cue.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-gettrackid
     */
    GetTrackId() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Gets the data content of the timed-text cue.
     * @returns {IMFTimedTextBinary} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextbinary">IMFTimedTextBinary</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextbinary">IMFTimedTextBinary</a> interface for the data content of the timed-text cue. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getdata
     */
    GetData() {
        result := ComCall(9, this, "ptr*", &data := 0, "HRESULT")
        return IMFTimedTextBinary(data)
    }

    /**
     * Gets info about the display region of the timed-text cue.
     * @returns {IMFTimedTextRegion} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextregion">IMFTimedTextRegion</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextregion">IMFTimedTextRegion</a> interface for the timed-text region. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getregion
     */
    GetRegion() {
        result := ComCall(10, this, "ptr*", &region := 0, "HRESULT")
        return IMFTimedTextRegion(region)
    }

    /**
     * Gets info about the style of the timed-text cue.
     * @returns {IMFTimedTextStyle} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle">IMFTimedTextStyle</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextstyle">IMFTimedTextStyle</a> interface for the timed-text style. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getstyle
     */
    GetStyle() {
        result := ComCall(11, this, "ptr*", &style := 0, "HRESULT")
        return IMFTimedTextStyle(style)
    }

    /**
     * Gets the number of lines of text in the timed-text cue.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the number of lines of text.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getlinecount
     */
    GetLineCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * Gets a line of text in the cue from the index of the line.
     * @param {Integer} index Type: <b>DWORD</b>
     * 
     * The index of the line of text in the cue to retrieve.
     * @returns {IMFTimedTextFormattedText} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextformattedtext">IMFTimedTextFormattedText</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtextformattedtext">IMFTimedTextFormattedText</a> interface for the line of text in the cue.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtextcue-getline
     */
    GetLine(index) {
        result := ComCall(13, this, "uint", index, "ptr*", &line := 0, "HRESULT")
        return IMFTimedTextFormattedText(line)
    }
}
