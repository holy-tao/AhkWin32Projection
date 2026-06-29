#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IRedbookDiscMaster interface enables the staging of an audio CD image. It represents one of the formats supported by MSDiscMasterObj, and it allows the creation of multi-track audio discs in Track-at-Once mode (fixed-size audio gaps).
 * @see https://learn.microsoft.com/windows/win32/api/imapi/nn-imapi-iredbookdiscmaster
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IRedbookDiscMaster extends IUnknown {
    /**
     * The interface identifier for IRedbookDiscMaster
     * @type {Guid}
     */
    static IID := Guid("{e3bc42cd-4e5c-11d3-9144-00104ba11c5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRedbookDiscMaster interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTotalAudioTracks          : IntPtr
        GetTotalAudioBlocks          : IntPtr
        GetUsedAudioBlocks           : IntPtr
        GetAvailableAudioTrackBlocks : IntPtr
        GetAudioBlockSize            : IntPtr
        CreateAudioTrack             : IntPtr
        AddAudioTrackBlocks          : IntPtr
        CloseAudioTrack              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRedbookDiscMaster.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the total number of tracks that have either been staged or are being staged.
     * @returns {Integer} Total number of closed and open tracks.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-gettotalaudiotracks
     */
    GetTotalAudioTracks() {
        result := ComCall(3, this, "int*", &pnTracks := 0, "HRESULT")
        return pnTracks
    }

    /**
     * Retrieves the total number of blocks available for staging audio tracks. The total includes all block types, including blocks that may need to be allocated for track gaps.
     * @returns {Integer} Total number of audio blocks available on a disc.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-gettotalaudioblocks
     */
    GetTotalAudioBlocks() {
        result := ComCall(4, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the total number of audio blocks in use.
     * @returns {Integer} Total number of blocks in use, in both closed and open tracks.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-getusedaudioblocks
     */
    GetUsedAudioBlocks() {
        result := ComCall(5, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the current number of blocks that can be added to the track before an additional add will cause a failure for lack of space.
     * @remarks
     * This method accounts for gaps associated with open tracks. Additionally, if this method is called when there is no open track, it returns the maximum number of audio blocks that could be added if a new track is created (accounting for gaps, and so on).
     * @returns {Integer} Number of audio blocks that can be added to the open track before it must be closed.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-getavailableaudiotrackblocks
     */
    GetAvailableAudioTrackBlocks() {
        result := ComCall(6, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the size, in bytes, of an audio block.
     * @remarks
     * This method returns 2352.
     * @returns {Integer} Total size, in bytes, of a single audio block.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-getaudioblocksize
     */
    GetAudioBlockSize() {
        result := ComCall(7, this, "int*", &pnBlockBytes := 0, "HRESULT")
        return pnBlockBytes
    }

    /**
     * Begins staging a new audio track. It can be called only when there are no open audio tracks in the image.
     * @remarks
     * After the track is open, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-iredbookdiscmaster-addaudiotrackblocks">AddAudioTrackBlocks</a> method to add data to the track.
     * @param {Integer} nBlocks Number of audio blocks to be added to this track. You can create up to 99 tracks, and the open track may consume all remaining available audio blocks. 
     * 
     * 
     * 
     * 
     * The <i>nBlocks</i> parameter is advisory only. It does not force the track length to this size.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-createaudiotrack
     */
    CreateAudioTrack(nBlocks) {
        result := ComCall(8, this, "int", nBlocks, "HRESULT")
        return result
    }

    /**
     * Adds blocks of audio data to the currently open track. This method can be called repeatedly until there is no space available or the track is full.
     * @remarks
     * After all blocks are added, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-iredbookdiscmaster-closeaudiotrack">CloseAudioTrack</a> method to finish the track.
     * 
     * If a call to this method would overrun the number of available audio blocks, then the method will return IMAPI_E_DISCFULL and keep as much of the audio data as it can. In contrast, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-ijolietdiscmaster-adddata">IJolietDiscMaster::AddData</a> method does not keep any of the data, so there are no bad files.
     * @param {Pointer<Integer>} pby Pointer to an array of track blocks. The format is 44.1 KHz 16-bit stereo RAW audio samples, in the same format as used by WAV in the data section.
     * @param {Integer} cb Size of the array, in bytes. This count must be a multiple of the audio block size.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-addaudiotrackblocks
     */
    AddAudioTrackBlocks(pby, cb) {
        pbyMarshal := pby is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pbyMarshal, pby, "int", cb, "HRESULT")
        return result
    }

    /**
     * Closes a currently open audio track. All audio tracks must be closed before the IDiscMaster::RecordDisc method can be called.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-closeaudiotrack
     */
    CloseAudioTrack() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRedbookDiscMaster.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTotalAudioTracks := CallbackCreate(GetMethod(implObj, "GetTotalAudioTracks"), flags, 2)
        this.vtbl.GetTotalAudioBlocks := CallbackCreate(GetMethod(implObj, "GetTotalAudioBlocks"), flags, 2)
        this.vtbl.GetUsedAudioBlocks := CallbackCreate(GetMethod(implObj, "GetUsedAudioBlocks"), flags, 2)
        this.vtbl.GetAvailableAudioTrackBlocks := CallbackCreate(GetMethod(implObj, "GetAvailableAudioTrackBlocks"), flags, 2)
        this.vtbl.GetAudioBlockSize := CallbackCreate(GetMethod(implObj, "GetAudioBlockSize"), flags, 2)
        this.vtbl.CreateAudioTrack := CallbackCreate(GetMethod(implObj, "CreateAudioTrack"), flags, 2)
        this.vtbl.AddAudioTrackBlocks := CallbackCreate(GetMethod(implObj, "AddAudioTrackBlocks"), flags, 3)
        this.vtbl.CloseAudioTrack := CallbackCreate(GetMethod(implObj, "CloseAudioTrack"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTotalAudioTracks)
        CallbackFree(this.vtbl.GetTotalAudioBlocks)
        CallbackFree(this.vtbl.GetUsedAudioBlocks)
        CallbackFree(this.vtbl.GetAvailableAudioTrackBlocks)
        CallbackFree(this.vtbl.GetAudioBlockSize)
        CallbackFree(this.vtbl.CreateAudioTrack)
        CallbackFree(this.vtbl.AddAudioTrackBlocks)
        CallbackFree(this.vtbl.CloseAudioTrack)
    }
}
