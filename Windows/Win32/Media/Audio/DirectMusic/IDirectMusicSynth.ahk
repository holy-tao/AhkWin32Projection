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
     * 
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams 
     * @returns {HRESULT} 
     */
    Open(pPortParams) {
        result := ComCall(3, this, "ptr", pPortParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwGroups 
     * @returns {HRESULT} 
     */
    SetNumChannelGroups(dwGroups) {
        result := ComCall(5, this, "uint", dwGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phDownload 
     * @param {Pointer<Void>} pvData 
     * @param {Pointer<BOOL>} pbFree 
     * @returns {HRESULT} 
     */
    Download(phDownload, pvData, pbFree) {
        result := ComCall(6, this, "ptr", phDownload, "ptr", pvData, "ptr", pbFree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hDownload 
     * @param {Pointer} lpFreeHandle 
     * @param {HANDLE} hUserData 
     * @returns {HRESULT} 
     */
    Unload(hDownload, lpFreeHandle, hUserData) {
        hDownload := hDownload is Win32Handle ? NumGet(hDownload, "ptr") : hDownload
        hUserData := hUserData is Win32Handle ? NumGet(hUserData, "ptr") : hUserData

        result := ComCall(7, this, "ptr", hDownload, "ptr", lpFreeHandle, "ptr", hUserData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Integer} cbBuffer 
     * @returns {HRESULT} 
     */
    PlayBuffer(rt, pbBuffer, cbBuffer) {
        result := ComCall(8, this, "int64", rt, "char*", pbBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_SYNTHSTATS>} pStats 
     * @returns {HRESULT} 
     */
    GetRunningStats(pStats) {
        result := ComCall(9, this, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_PORTCAPS>} pCaps 
     * @returns {HRESULT} 
     */
    GetPortCaps(pCaps) {
        result := ComCall(10, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} pClock 
     * @returns {HRESULT} 
     */
    SetMasterClock(pClock) {
        result := ComCall(11, this, "ptr", pClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} ppClock 
     * @returns {HRESULT} 
     */
    GetLatencyClock(ppClock) {
        result := ComCall(12, this, "ptr", ppClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Activate(fEnable) {
        result := ComCall(13, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectMusicSynthSink>} pSynthSink 
     * @returns {HRESULT} 
     */
    SetSynthSink(pSynthSink) {
        result := ComCall(14, this, "ptr", pSynthSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pBuffer 
     * @param {Integer} dwLength 
     * @param {Integer} llPosition 
     * @returns {HRESULT} 
     */
    Render(pBuffer, dwLength, llPosition) {
        result := ComCall(15, this, "short*", pBuffer, "uint", dwLength, "int64", llPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Integer} dwPriority 
     * @returns {HRESULT} 
     */
    SetChannelPriority(dwChannelGroup, dwChannel, dwPriority) {
        result := ComCall(16, this, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Pointer<UInt32>} pdwPriority 
     * @returns {HRESULT} 
     */
    GetChannelPriority(dwChannelGroup, dwChannel, pdwPriority) {
        result := ComCall(17, this, "uint", dwChannelGroup, "uint", dwChannel, "uint*", pdwPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<UInt32>} pdwWaveFormatExSize 
     * @returns {HRESULT} 
     */
    GetFormat(pWaveFormatEx, pdwWaveFormatExSize) {
        result := ComCall(18, this, "ptr", pWaveFormatEx, "uint*", pdwWaveFormatExSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAppend 
     * @returns {HRESULT} 
     */
    GetAppend(pdwAppend) {
        result := ComCall(19, this, "uint*", pdwAppend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
