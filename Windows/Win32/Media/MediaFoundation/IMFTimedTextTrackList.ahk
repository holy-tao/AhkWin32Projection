#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFTimedTextTrack.ahk" { IMFTimedTextTrack }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a list of timed-text tracks.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtexttracklist
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextTrackList extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextTrackList
     * @type {Guid}
     */
    static IID := Guid("{23ff334c-442c-445f-bccc-edc438aa11e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextTrackList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength    : IntPtr
        GetTrack     : IntPtr
        GetTrackById : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextTrackList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the length, in tracks, of the timed-text-track list.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns the length, in tracks, of the timed-text-track list.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-getlength
     */
    GetLength() {
        result := ComCall(3, this, UInt32)
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-gettrack
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttracklist-gettrackbyid
     */
    GetTrackById(trackId) {
        result := ComCall(5, this, "uint", trackId, "ptr*", &track := 0, "HRESULT")
        return IMFTimedTextTrack(track)
    }

    Query(iid) {
        if (IMFTimedTextTrackList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 1)
        this.vtbl.GetTrack := CallbackCreate(GetMethod(implObj, "GetTrack"), flags, 3)
        this.vtbl.GetTrackById := CallbackCreate(GetMethod(implObj, "GetTrackById"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetTrack)
        CallbackFree(this.vtbl.GetTrackById)
    }
}
