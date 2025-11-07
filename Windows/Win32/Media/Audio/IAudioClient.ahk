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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetBufferSize", "GetStreamLatency", "GetCurrentPadding", "IsFormatSupported", "GetMixFormat", "GetDevicePeriod", "Start", "Stop", "Reset", "SetEventHandle", "GetService"]

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
        result := ComCall(3, this, "int", ShareMode, "uint", StreamFlags, "int64", hnsBufferDuration, "int64", hnsPeriodicity, "ptr", pFormat, "ptr", AudioSessionGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getbuffersize
     */
    GetBufferSize() {
        result := ComCall(4, this, "uint*", &pNumBufferFrames := 0, "HRESULT")
        return pNumBufferFrames
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getstreamlatency
     */
    GetStreamLatency() {
        result := ComCall(5, this, "int64*", &phnsLatency := 0, "HRESULT")
        return phnsLatency
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getcurrentpadding
     */
    GetCurrentPadding() {
        result := ComCall(6, this, "uint*", &pNumPaddingFrames := 0, "HRESULT")
        return pNumPaddingFrames
    }

    /**
     * 
     * @param {Integer} ShareMode 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {Pointer<WAVEFORMATEX>} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-isformatsupported
     */
    IsFormatSupported(ShareMode, pFormat) {
        result := ComCall(7, this, "int", ShareMode, "ptr", pFormat, "ptr*", &ppClosestMatch := 0, "int")
        return ppClosestMatch
    }

    /**
     * 
     * @returns {Pointer<WAVEFORMATEX>} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getmixformat
     */
    GetMixFormat() {
        result := ComCall(8, this, "ptr*", &ppDeviceFormat := 0, "HRESULT")
        return ppDeviceFormat
    }

    /**
     * 
     * @param {Pointer<Integer>} phnsDefaultDevicePeriod 
     * @param {Pointer<Integer>} phnsMinimumDevicePeriod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getdeviceperiod
     */
    GetDevicePeriod(phnsDefaultDevicePeriod, phnsMinimumDevicePeriod) {
        phnsDefaultDevicePeriodMarshal := phnsDefaultDevicePeriod is VarRef ? "int64*" : "ptr"
        phnsMinimumDevicePeriodMarshal := phnsMinimumDevicePeriod is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, phnsDefaultDevicePeriodMarshal, phnsDefaultDevicePeriod, phnsMinimumDevicePeriodMarshal, phnsMinimumDevicePeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-start
     */
    Start() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-stop
     */
    Stop() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-reset
     */
    Reset() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} eventHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-seteventhandle
     */
    SetEventHandle(eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(13, this, "ptr", eventHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient-getservice
     */
    GetService(riid) {
        result := ComCall(14, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
