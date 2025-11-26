#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Initializes a device endpoint object and gets the capabilities of the device that it represents.
 * @remarks
 * 
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudiodeviceendpoint
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IAudioDeviceEndpoint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceEndpoint
     * @type {Guid}
     */
    static IID => Guid("{d4952f5a-a0b2-4cc4-8b82-9358488dd8ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBuffer", "GetRTCaps", "GetEventDrivenCapable", "WriteExclusiveModeParametersToSharedMemory"]

    /**
     * Initializes the endpoint and creates a buffer based on the format of the endpoint into which the audio data is streamed.
     * @param {Integer} MaxPeriod The processing time, in 
     *     100-nanosecond units, of the audio endpoint.
     * @param {Integer} u32LatencyCoefficient The latency coefficient for the audio          device. This value is used to calculate the latency. Latency = <i>u32LatencyCoefficient</i> * <i>MaxPeriod</i>.
     * 
     * <div class="alert"><b>Note</b>  The device that the endpoint represents has a minimum latency
     *     value. If the value of this parameter is less than the minimum latency of the device or is zero, the
     *      endpoint object applies the minimum latency.  The audio engine can obtain the
     *     actual latency of the endpoint by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getlatency">IAudioEndpoint::GetLatency</a> method.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If it fails, possible return codes include, but are not limited to, the following.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-setbuffer
     */
    SetBuffer(MaxPeriod, u32LatencyCoefficient) {
        result := ComCall(3, this, "int64", MaxPeriod, "uint", u32LatencyCoefficient, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio device is real-time (RT)-capable. This method is not used in Remote Desktop Services implementations of IAudioDeviceEndpoint.
     * @returns {BOOL} Receives <b>TRUE</b> if the audio device is RT-capable, or <b>FALSE</b> otherwise. Remote Desktop Services implementations should always return <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-getrtcaps
     */
    GetRTCaps() {
        result := ComCall(4, this, "int*", &pbIsRTCapable := 0, "HRESULT")
        return pbIsRTCapable
    }

    /**
     * Indicates whether the device endpoint is event driven. The device endpoint controls the period of the audio engine by setting events that signal buffer availability.
     * @returns {BOOL} A value of <b>TRUE</b> indicates that the device endpoint is event driven. A value of <b>FALSE</b> indicates that it is not event driven. If the endpoint device is event driven, the audio engine can receive events from an audio device endpoint.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-geteventdrivencapable
     */
    GetEventDrivenCapable() {
        result := ComCall(5, this, "int*", &pbisEventCapable := 0, "HRESULT")
        return pbisEventCapable
    }

    /**
     * Creates and writes the exclusive-mode parameters to shared memory.
     * @param {Pointer} hTargetProcess The handle of the process for which the handles
     *     will be duplicated.
     * @param {Integer} hnsPeriod The periodicity, in 100-nanosecond units, of the device. This value must fall within the range of the 
     *       minimum and maximum periodicity of the device represented by the endpoint.
     * @param {Integer} hnsBufferDuration The buffer duration, in 100-nanosecond units, requested by the client.
     * @param {Integer} u32LatencyCoefficient The latency coefficient of the audio endpoint. A client can obtain the actual latency of the endpoint by 
     *       calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getlatency">IAudioEndpoint::GetLatency</a> 
     *       method.
     * @param {Pointer<Integer>} pu32SharedMemorySize Receives the size of the memory area shared by the service and the process.
     * @param {Pointer<Pointer>} phSharedMemory Receives a handle to the memory area shared by the service and the process.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-writeexclusivemodeparameterstosharedmemory
     */
    WriteExclusiveModeParametersToSharedMemory(hTargetProcess, hnsPeriod, hnsBufferDuration, u32LatencyCoefficient, pu32SharedMemorySize, phSharedMemory) {
        pu32SharedMemorySizeMarshal := pu32SharedMemorySize is VarRef ? "uint*" : "ptr"
        phSharedMemoryMarshal := phSharedMemory is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", hTargetProcess, "int64", hnsPeriod, "int64", hnsBufferDuration, "uint", u32LatencyCoefficient, pu32SharedMemorySizeMarshal, pu32SharedMemorySize, phSharedMemoryMarshal, phSharedMemory, "HRESULT")
        return result
    }
}
