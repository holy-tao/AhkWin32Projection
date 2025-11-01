#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice3.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice4 extends ID3D12VideoDevice3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice4
     * @type {Guid}
     */
    static IID => Guid("{e59ad09e-f1ae-42bb-8983-9f6e5586c4eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoEncoderHeap1"]

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_HEAP_DESC1>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoEncoderHeap 
     * @returns {HRESULT} 
     */
    CreateVideoEncoderHeap1(pDesc, riid, ppVideoEncoderHeap) {
        result := ComCall(16, this, "ptr", pDesc, "ptr", riid, "ptr*", ppVideoEncoderHeap, "HRESULT")
        return result
    }
}
