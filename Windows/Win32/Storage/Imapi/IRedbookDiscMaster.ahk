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
     * 
     * @param {Pointer<Integer>} pnTracks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-gettotalaudiotracks
     */
    GetTotalAudioTracks(pnTracks) {
        pnTracksMarshal := pnTracks is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pnTracksMarshal, pnTracks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-gettotalaudioblocks
     */
    GetTotalAudioBlocks(pnBlocks) {
        pnBlocksMarshal := pnBlocks is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pnBlocksMarshal, pnBlocks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-getusedaudioblocks
     */
    GetUsedAudioBlocks(pnBlocks) {
        pnBlocksMarshal := pnBlocks is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pnBlocksMarshal, pnBlocks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-getavailableaudiotrackblocks
     */
    GetAvailableAudioTrackBlocks(pnBlocks) {
        pnBlocksMarshal := pnBlocks is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pnBlocksMarshal, pnBlocks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnBlockBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-getaudioblocksize
     */
    GetAudioBlockSize(pnBlockBytes) {
        pnBlockBytesMarshal := pnBlockBytes is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pnBlockBytesMarshal, pnBlockBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-createaudiotrack
     */
    CreateAudioTrack(nBlocks) {
        result := ComCall(8, this, "int", nBlocks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pby 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-addaudiotrackblocks
     */
    AddAudioTrackBlocks(pby, cb) {
        pbyMarshal := pby is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pbyMarshal, pby, "int", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-iredbookdiscmaster-closeaudiotrack
     */
    CloseAudioTrack() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
