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
     * 
     * @param {Integer} MaxPeriod 
     * @param {Integer} u32LatencyCoefficient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-setbuffer
     */
    SetBuffer(MaxPeriod, u32LatencyCoefficient) {
        result := ComCall(3, this, "int64", MaxPeriod, "uint", u32LatencyCoefficient, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-getrtcaps
     */
    GetRTCaps() {
        result := ComCall(4, this, "int*", &pbIsRTCapable := 0, "HRESULT")
        return pbIsRTCapable
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-geteventdrivencapable
     */
    GetEventDrivenCapable() {
        result := ComCall(5, this, "int*", &pbisEventCapable := 0, "HRESULT")
        return pbisEventCapable
    }

    /**
     * 
     * @param {Pointer} hTargetProcess 
     * @param {Integer} hnsPeriod 
     * @param {Integer} hnsBufferDuration 
     * @param {Integer} u32LatencyCoefficient 
     * @param {Pointer<Integer>} pu32SharedMemorySize 
     * @param {Pointer<Pointer>} phSharedMemory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiodeviceendpoint-writeexclusivemodeparameterstosharedmemory
     */
    WriteExclusiveModeParametersToSharedMemory(hTargetProcess, hnsPeriod, hnsBufferDuration, u32LatencyCoefficient, pu32SharedMemorySize, phSharedMemory) {
        pu32SharedMemorySizeMarshal := pu32SharedMemorySize is VarRef ? "uint*" : "ptr"
        phSharedMemoryMarshal := phSharedMemory is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", hTargetProcess, "int64", hnsPeriod, "int64", hnsBufferDuration, "uint", u32LatencyCoefficient, pu32SharedMemorySizeMarshal, pu32SharedMemorySize, phSharedMemoryMarshal, phSharedMemory, "HRESULT")
        return result
    }
}
