#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRedbookDiscMaster interface enables the staging of an audio CD image. It represents one of the formats supported by MSDiscMasterObj, and it allows the creation of multi-track audio discs in Track-at-Once mode (fixed-size audio gaps).
 * @see https://docs.microsoft.com/windows/win32/api//imapi/nn-imapi-iredbookdiscmaster
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IRedbookDiscMaster extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRedbookDiscMaster
     * @type {Guid}
     */
    static IID => Guid("{e3bc42cd-4e5c-11d3-9144-00104ba11c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTotalAudioTracks", "GetTotalAudioBlocks", "GetUsedAudioBlocks", "GetAvailableAudioTrackBlocks", "GetAudioBlockSize", "CreateAudioTrack", "AddAudioTrackBlocks", "CloseAudioTrack"]

    /**
     * Retrieves the total number of tracks that have either been staged or are being staged.
     * @returns {Integer} Total number of closed and open tracks.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-gettotalaudiotracks
     */
    GetTotalAudioTracks() {
        result := ComCall(3, this, "int*", &pnTracks := 0, "HRESULT")
        return pnTracks
    }

    /**
     * Retrieves the total number of blocks available for staging audio tracks. The total includes all block types, including blocks that may need to be allocated for track gaps.
     * @returns {Integer} Total number of audio blocks available on a disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-gettotalaudioblocks
     */
    GetTotalAudioBlocks() {
        result := ComCall(4, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the total number of audio blocks in use.
     * @returns {Integer} Total number of blocks in use, in both closed and open tracks.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-getusedaudioblocks
     */
    GetUsedAudioBlocks() {
        result := ComCall(5, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the current number of blocks that can be added to the track before an additional add will cause a failure for lack of space.
     * @returns {Integer} Number of audio blocks that can be added to the open track before it must be closed.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-getavailableaudiotrackblocks
     */
    GetAvailableAudioTrackBlocks() {
        result := ComCall(6, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the size, in bytes, of an audio block.
     * @returns {Integer} Total size, in bytes, of a single audio block.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-getaudioblocksize
     */
    GetAudioBlockSize() {
        result := ComCall(7, this, "int*", &pnBlockBytes := 0, "HRESULT")
        return pnBlockBytes
    }

    /**
     * Begins staging a new audio track. It can be called only when there are no open audio tracks in the image.
     * @param {Integer} nBlocks Number of audio blocks to be added to this track. You can create up to 99 tracks, and the open track may consume all remaining available audio blocks. 
     * 
     * 
     * 
     * 
     * The <i>nBlocks</i> parameter is advisory only. It does not force the track length to this size.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-createaudiotrack
     */
    CreateAudioTrack(nBlocks) {
        result := ComCall(8, this, "int", nBlocks, "HRESULT")
        return result
    }

    /**
     * Adds blocks of audio data to the currently open track. This method can be called repeatedly until there is no space available or the track is full.
     * @param {Pointer<Integer>} pby Pointer to an array of track blocks. The format is 44.1 KHz 16-bit stereo RAW audio samples, in the same format as used by WAV in the data section.
     * @param {Integer} cb Size of the array, in bytes. This count must be a multiple of the audio block size.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-addaudiotrackblocks
     */
    AddAudioTrackBlocks(pby, cb) {
        pbyMarshal := pby is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pbyMarshal, pby, "int", cb, "HRESULT")
        return result
    }

    /**
     * Closes a currently open audio track. All audio tracks must be closed before the IDiscMaster::RecordDisc method can be called.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-iredbookdiscmaster-closeaudiotrack
     */
    CloseAudioTrack() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
