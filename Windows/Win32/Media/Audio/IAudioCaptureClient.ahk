#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioCaptureClient interface enables a client to read input data from a capture endpoint buffer.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudiocaptureclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioCaptureClient extends IUnknown{
    /**
     * The interface identifier for IAudioCaptureClient
     * @type {Guid}
     */
    static IID => Guid("{c8adbd64-e71e-48a0-a4de-185c395cd317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} ppData 
     * @param {Pointer<UInt32>} pNumFramesToRead 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<UInt64>} pu64DevicePosition 
     * @param {Pointer<UInt64>} pu64QPCPosition 
     * @returns {HRESULT} 
     */
    GetBuffer(ppData, pNumFramesToRead, pdwFlags, pu64DevicePosition, pu64QPCPosition) {
        result := ComCall(3, this, "char*", ppData, "uint*", pNumFramesToRead, "uint*", pdwFlags, "uint*", pu64DevicePosition, "uint*", pu64QPCPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NumFramesRead 
     * @returns {HRESULT} 
     */
    ReleaseBuffer(NumFramesRead) {
        result := ComCall(4, this, "uint", NumFramesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumFramesInNextPacket 
     * @returns {HRESULT} 
     */
    GetNextPacketSize(pNumFramesInNextPacket) {
        result := ComCall(5, this, "uint*", pNumFramesInNextPacket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
