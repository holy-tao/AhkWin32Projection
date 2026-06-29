#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Initializes a device endpoint object and gets the capabilities of the device that it represents.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudiodeviceendpoint
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IAudioDeviceEndpoint extends IUnknown {
    /**
     * The interface identifier for IAudioDeviceEndpoint
     * @type {Guid}
     */
    static IID := Guid("{d4952f5a-a0b2-4cc4-8b82-9358488dd8ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioDeviceEndpoint interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBuffer                                  : IntPtr
        GetRTCaps                                  : IntPtr
        GetEventDrivenCapable                      : IntPtr
        WriteExclusiveModeParametersToSharedMemory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioDeviceEndpoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the endpoint and creates a buffer based on the format of the endpoint into which the audio data is streamed.
     * @remarks
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
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
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-setbuffer
     */
    SetBuffer(MaxPeriod, u32LatencyCoefficient) {
        result := ComCall(3, this, "int64", MaxPeriod, "uint", u32LatencyCoefficient, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio device is real-time (RT)-capable. This method is not used in Remote Desktop Services implementations of IAudioDeviceEndpoint.
     * @remarks
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {BOOL} Receives <b>TRUE</b> if the audio device is RT-capable, or <b>FALSE</b> otherwise. Remote Desktop Services implementations should always return <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-getrtcaps
     */
    GetRTCaps() {
        result := ComCall(4, this, BOOL.Ptr, &pbIsRTCapable := 0, "HRESULT")
        return pbIsRTCapable
    }

    /**
     * Indicates whether the device endpoint is event driven. The device endpoint controls the period of the audio engine by setting events that signal buffer availability.
     * @remarks
     * Call the <b>GetEventDrivenCapable</b> method before calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-setbuffer">IAudioDeviceEndpoint::SetBuffer</a> method, which initializes the device endpoint and creates a buffer. This allows the device endpoint to set up the structures needed for driving events.
     * 
     * If the audio engine requires an event driven device endpoint, it will:
     * 
     * <ul>
     * <li>Create an event and set the event handle on the device endpoint by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-seteventhandle">IAudioEndpoint::SetEventHandle</a> method.</li>
     * <li>Specify event driven mode by setting the <b>AUDCLNT_STREAMFLAGS_EVENTCALLBACK</b> flag on the device endpoint by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-setstreamflags">IAudioEndpoint::SetStreamFlags</a> method.</li>
     * </ul>
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {BOOL} A value of <b>TRUE</b> indicates that the device endpoint is event driven. A value of <b>FALSE</b> indicates that it is not event driven. If the endpoint device is event driven, the audio engine can receive events from an audio device endpoint.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-geteventdrivencapable
     */
    GetEventDrivenCapable() {
        result := ComCall(5, this, BOOL.Ptr, &pbisEventCapable := 0, "HRESULT")
        return pbisEventCapable
    }

    /**
     * Creates and writes the exclusive-mode parameters to shared memory.
     * @remarks
     * This method is used to provide handles and parameters of the audio service of the endpoint to the client 
     *     process for use in exclusive mode. This method fails if the endpoint object is fully initialized through the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-setbuffer">IAudioDeviceEndpoint::SetBuffer</a> 
     *     method call.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
     *     applications.
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
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-writeexclusivemodeparameterstosharedmemory
     */
    WriteExclusiveModeParametersToSharedMemory(hTargetProcess, hnsPeriod, hnsBufferDuration, u32LatencyCoefficient, pu32SharedMemorySize, phSharedMemory) {
        pu32SharedMemorySizeMarshal := pu32SharedMemorySize is VarRef ? "uint*" : "ptr"
        phSharedMemoryMarshal := phSharedMemory is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", hTargetProcess, "int64", hnsPeriod, "int64", hnsBufferDuration, "uint", u32LatencyCoefficient, pu32SharedMemorySizeMarshal, pu32SharedMemorySize, phSharedMemoryMarshal, phSharedMemory, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioDeviceEndpoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBuffer := CallbackCreate(GetMethod(implObj, "SetBuffer"), flags, 3)
        this.vtbl.GetRTCaps := CallbackCreate(GetMethod(implObj, "GetRTCaps"), flags, 2)
        this.vtbl.GetEventDrivenCapable := CallbackCreate(GetMethod(implObj, "GetEventDrivenCapable"), flags, 2)
        this.vtbl.WriteExclusiveModeParametersToSharedMemory := CallbackCreate(GetMethod(implObj, "WriteExclusiveModeParametersToSharedMemory"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBuffer)
        CallbackFree(this.vtbl.GetRTCaps)
        CallbackFree(this.vtbl.GetEventDrivenCapable)
        CallbackFree(this.vtbl.WriteExclusiveModeParametersToSharedMemory)
    }
}
