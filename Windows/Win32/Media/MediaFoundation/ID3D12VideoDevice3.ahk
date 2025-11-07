#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice2.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodevice3
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice3 extends ID3D12VideoDevice2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoEncoder", "CreateVideoEncoderHeap"]

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice3-createvideoencoder
     */
    CreateVideoEncoder(pDesc, riid) {
        result := ComCall(14, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppVideoEncoder := 0, "HRESULT")
        return ppVideoEncoder
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_HEAP_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice3-createvideoencoderheap
     */
    CreateVideoEncoderHeap(pDesc, riid) {
        result := ComCall(15, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppVideoEncoderHeap := 0, "HRESULT")
        return ppVideoEncoderHeap
    }
}
