#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IMFTimedTextTrack>} track 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-gettrack
     */
    GetTrack(index, track) {
        result := ComCall(4, this, "uint", index, "ptr*", track, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} trackId 
     * @param {Pointer<IMFTimedTextTrack>} track 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-gettrackbyid
     */
    GetTrackById(trackId, track) {
        result := ComCall(5, this, "uint", trackId, "ptr*", track, "HRESULT")
        return result
    }
}
