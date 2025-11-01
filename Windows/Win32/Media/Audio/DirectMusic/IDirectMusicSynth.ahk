#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynth interface is used by DirectMusic to communicate with user-mode synthesizers.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/nn-dmusics-idirectmusicsynth
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicSynth extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicSynth
     * @type {Guid}
     */
    static IID => Guid("{09823661-5c85-11d2-afa6-00aa0024d8b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "SetNumChannelGroups", "Download", "Unload", "PlayBuffer", "GetRunningStats", "GetPortCaps", "SetMasterClock", "GetLatencyClock", "Activate", "SetSynthSink", "Render", "SetChannelPriority", "GetChannelPriority", "GetFormat", "GetAppend"]

    /**
     * 
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-open
     */
    Open(pPortParams) {
        result := ComCall(3, this, "ptr", pPortParams, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwGroups 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setnumchannelgroups
     */
    SetNumChannelGroups(dwGroups) {
        result := ComCall(5, this, "uint", dwGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phDownload 
     * @param {Pointer<Void>} pvData 
     * @param {Pointer<BOOL>} pbFree 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-download
     */
    Download(phDownload, pvData, pbFree) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", phDownload, pvDataMarshal, pvData, "ptr", pbFree, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hDownload 
     * @param {Pointer} lpFreeHandle 
     * @param {HANDLE} hUserData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-unload
     */
    Unload(hDownload, lpFreeHandle, hUserData) {
        hDownload := hDownload is Win32Handle ? NumGet(hDownload, "ptr") : hDownload
        hUserData := hUserData is Win32Handle ? NumGet(hUserData, "ptr") : hUserData

        result := ComCall(7, this, "ptr", hDownload, "ptr", lpFreeHandle, "ptr", hUserData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} cbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-playbuffer
     */
    PlayBuffer(rt, pbBuffer, cbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "int64", rt, pbBufferMarshal, pbBuffer, "uint", cbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_SYNTHSTATS>} pStats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getrunningstats
     */
    GetRunningStats(pStats) {
        result := ComCall(9, this, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_PORTCAPS>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getportcaps
     */
    GetPortCaps(pCaps) {
        result := ComCall(10, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IReferenceClock} pClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setmasterclock
     */
    SetMasterClock(pClock) {
        result := ComCall(11, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} ppClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock
     */
    GetLatencyClock(ppClock) {
        result := ComCall(12, this, "ptr*", ppClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-activate
     */
    Activate(fEnable) {
        result := ComCall(13, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicSynthSink} pSynthSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setsynthsink
     */
    SetSynthSink(pSynthSink) {
        result := ComCall(14, this, "ptr", pSynthSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} dwLength 
     * @param {Integer} llPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-render
     */
    Render(pBuffer, dwLength, llPosition) {
        pBufferMarshal := pBuffer is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, pBufferMarshal, pBuffer, "uint", dwLength, "int64", llPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Integer} dwPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setchannelpriority
     */
    SetChannelPriority(dwChannelGroup, dwChannel, dwPriority) {
        result := ComCall(16, this, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Pointer<Integer>} pdwPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getchannelpriority
     */
    GetChannelPriority(dwChannelGroup, dwChannel, pdwPriority) {
        pdwPriorityMarshal := pdwPriority is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", dwChannelGroup, "uint", dwChannel, pdwPriorityMarshal, pdwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<Integer>} pdwWaveFormatExSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getformat
     */
    GetFormat(pWaveFormatEx, pdwWaveFormatExSize) {
        pdwWaveFormatExSizeMarshal := pdwWaveFormatExSize is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pWaveFormatEx, pdwWaveFormatExSizeMarshal, pdwWaveFormatExSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAppend 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getappend
     */
    GetAppend(pdwAppend) {
        pdwAppendMarshal := pdwAppend is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pdwAppendMarshal, pdwAppend, "HRESULT")
        return result
    }
}
