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
     * 
     * @param {Integer} MaxPeriod 
     * @param {Integer} u32LatencyCoefficient 
     * @returns {HRESULT} 
     */
    SetBuffer(MaxPeriod, u32LatencyCoefficient) {
        result := ComCall(3, this, "int64", MaxPeriod, "uint", u32LatencyCoefficient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsRTCapable 
     * @returns {HRESULT} 
     */
    GetRTCaps(pbIsRTCapable) {
        result := ComCall(4, this, "ptr", pbIsRTCapable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbisEventCapable 
     * @returns {HRESULT} 
     */
    GetEventDrivenCapable(pbisEventCapable) {
        result := ComCall(5, this, "ptr", pbisEventCapable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hTargetProcess 
     * @param {Integer} hnsPeriod 
     * @param {Integer} hnsBufferDuration 
     * @param {Integer} u32LatencyCoefficient 
     * @param {Pointer<UInt32>} pu32SharedMemorySize 
     * @param {Pointer<UIntPtr>} phSharedMemory 
     * @returns {HRESULT} 
     */
    WriteExclusiveModeParametersToSharedMemory(hTargetProcess, hnsPeriod, hnsBufferDuration, u32LatencyCoefficient, pu32SharedMemorySize, phSharedMemory) {
        result := ComCall(6, this, "ptr", hTargetProcess, "int64", hnsPeriod, "int64", hnsBufferDuration, "uint", u32LatencyCoefficient, "uint*", pu32SharedMemorySize, "ptr*", phSharedMemory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
