#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClient interface enables a client to create and initialize an audio stream between an audio application and the audio engine (for a shared-mode stream) or the hardware buffer of an audio endpoint device (for an exclusive-mode stream).
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  In Windows 8, the first use of <b>IAudioClient</b> to access the audio device should be on the STA thread. Calls from an MTA thread may result in undefined behavior.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClient extends IUnknown{
    /**
     * The interface identifier for IAudioClient
     * @type {Guid}
     */
    static IID => Guid("{1cb9ad4c-dbfa-4c32-b178-c2f568a703b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} ShareMode 
     * @param {Integer} StreamFlags 
     * @param {Integer} hnsBufferDuration 
     * @param {Integer} hnsPeriodicity 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<Guid>} AudioSessionGuid 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(ShareMode, StreamFlags, hnsBufferDuration, hnsPeriodicity, pFormat, AudioSessionGuid) {
        result := ComCall(3, this, "int", ShareMode, "uint", StreamFlags, "int64", hnsBufferDuration, "int64", hnsPeriodicity, "ptr", pFormat, "ptr", AudioSessionGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumBufferFrames 
     * @returns {HRESULT} 
     */
    GetBufferSize(pNumBufferFrames) {
        result := ComCall(4, this, "uint*", pNumBufferFrames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} phnsLatency 
     * @returns {HRESULT} 
     */
    GetStreamLatency(phnsLatency) {
        result := ComCall(5, this, "int64*", phnsLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumPaddingFrames 
     * @returns {HRESULT} 
     */
    GetCurrentPadding(pNumPaddingFrames) {
        result := ComCall(6, this, "uint*", pNumPaddingFrames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ShareMode 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<WAVEFORMATEX>} ppClosestMatch 
     * @returns {HRESULT} 
     */
    IsFormatSupported(ShareMode, pFormat, ppClosestMatch) {
        result := ComCall(7, this, "int", ShareMode, "ptr", pFormat, "ptr", ppClosestMatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} ppDeviceFormat 
     * @returns {HRESULT} 
     */
    GetMixFormat(ppDeviceFormat) {
        result := ComCall(8, this, "ptr", ppDeviceFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} phnsDefaultDevicePeriod 
     * @param {Pointer<Int64>} phnsMinimumDevicePeriod 
     * @returns {HRESULT} 
     */
    GetDevicePeriod(phnsDefaultDevicePeriod, phnsMinimumDevicePeriod) {
        result := ComCall(9, this, "int64*", phnsDefaultDevicePeriod, "int64*", phnsMinimumDevicePeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} eventHandle 
     * @returns {HRESULT} 
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(13, this, "ptr", eventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetService(riid, ppv) {
        result := ComCall(14, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
