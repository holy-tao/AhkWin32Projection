#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextTrack.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a list of timed-text tracks.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtexttracklist
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextTrackList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextTrackList
     * @type {Guid}
     */
    static IID => Guid("{23ff334c-442c-445f-bccc-edc438aa11e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "GetTrack", "GetTrackById"]

    /**
     * Gets the length, in tracks, of the timed-text-track list.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the length, in tracks, of the timed-text-track list.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets a text track in the list from the index of the track.
     * @param {Integer} index Type: <b>DWORD</b>
     * 
     * The index of the track in the list to retrieve.
     * @returns {IMFTimedTextTrack} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttrack">IMFTimedTextTrack</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttrack">IMFTimedTextTrack</a> interface for the timed-text track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-gettrack
     */
    GetTrack(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &track := 0, "HRESULT")
        return IMFTimedTextTrack(track)
    }

    /**
     * Gets a text track in the list from the identifier of the track.
     * @param {Integer} trackId Type: <b>DWORD</b>
     * 
     * The identifier of the track in the list to retrieve.
     * @returns {IMFTimedTextTrack} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttrack">IMFTimedTextTrack</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imftimedtexttrack">IMFTimedTextTrack</a> interface for the timed-text track.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-gettrackbyid
     */
    GetTrackById(trackId) {
        result := ComCall(5, this, "uint", trackId, "ptr*", &track := 0, "HRESULT")
        return IMFTimedTextTrack(track)
    }
}
