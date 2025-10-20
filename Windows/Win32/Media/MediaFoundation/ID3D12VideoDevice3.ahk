#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice2.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice3 extends ID3D12VideoDevice2{
    /**
     * The interface identifier for ID3D12VideoDevice3
     * @type {Guid}
     */
    static IID => Guid("{4243adb4-3a32-4666-973c-0ccc5625dc44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppVideoEncoder 
     * @returns {HRESULT} 
     */
    CreateVideoEncoder(pDesc, riid, ppVideoEncoder) {
        result := ComCall(14, this, "ptr", pDesc, "ptr", riid, "ptr", ppVideoEncoder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_HEAP_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppVideoEncoderHeap 
     * @returns {HRESULT} 
     */
    CreateVideoEncoderHeap(pDesc, riid, ppVideoEncoderHeap) {
        result := ComCall(15, this, "ptr", pDesc, "ptr", riid, "ptr", ppVideoEncoderHeap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
