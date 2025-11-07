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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "ReleaseBuffer", "GetNextPacketSize"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @param {Pointer<Integer>} pNumFramesToRead 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pu64DevicePosition 
     * @param {Pointer<Integer>} pu64QPCPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiocaptureclient-getbuffer
     */
    GetBuffer(ppData, pNumFramesToRead, pdwFlags, pu64DevicePosition, pu64QPCPosition) {
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pNumFramesToReadMarshal := pNumFramesToRead is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pu64DevicePositionMarshal := pu64DevicePosition is VarRef ? "uint*" : "ptr"
        pu64QPCPositionMarshal := pu64QPCPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppDataMarshal, ppData, pNumFramesToReadMarshal, pNumFramesToRead, pdwFlagsMarshal, pdwFlags, pu64DevicePositionMarshal, pu64DevicePosition, pu64QPCPositionMarshal, pu64QPCPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumFramesRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiocaptureclient-releasebuffer
     */
    ReleaseBuffer(NumFramesRead) {
        result := ComCall(4, this, "uint", NumFramesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiocaptureclient-getnextpacketsize
     */
    GetNextPacketSize() {
        result := ComCall(5, this, "uint*", &pNumFramesInNextPacket := 0, "HRESULT")
        return pNumFramesInNextPacket
    }
}
