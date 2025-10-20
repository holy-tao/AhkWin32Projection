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
     * 
     * @param {Pointer<Int32>} pnTracks 
     * @returns {HRESULT} 
     */
    GetTotalAudioTracks(pnTracks) {
        result := ComCall(3, this, "int*", pnTracks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnBlocks 
     * @returns {HRESULT} 
     */
    GetTotalAudioBlocks(pnBlocks) {
        result := ComCall(4, this, "int*", pnBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnBlocks 
     * @returns {HRESULT} 
     */
    GetUsedAudioBlocks(pnBlocks) {
        result := ComCall(5, this, "int*", pnBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnBlocks 
     * @returns {HRESULT} 
     */
    GetAvailableAudioTrackBlocks(pnBlocks) {
        result := ComCall(6, this, "int*", pnBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnBlockBytes 
     * @returns {HRESULT} 
     */
    GetAudioBlockSize(pnBlockBytes) {
        result := ComCall(7, this, "int*", pnBlockBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nBlocks 
     * @returns {HRESULT} 
     */
    CreateAudioTrack(nBlocks) {
        result := ComCall(8, this, "int", nBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pby 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    AddAudioTrackBlocks(pby, cb) {
        result := ComCall(9, this, "char*", pby, "int", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseAudioTrack() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
