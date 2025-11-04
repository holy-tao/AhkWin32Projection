#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides video decoding and processing capabilities of a Microsoft Direct3D 12 device including the ability to query video capabilities and instantiating video decoders and processors.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videodevice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice
     * @type {Guid}
     */
    static IID => Guid("{1f052807-0b46-4acc-8a89-364f793718a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckFeatureSupport", "CreateVideoDecoder", "CreateVideoDecoderHeap", "CreateVideoProcessor"]

    /**
     * 
     * @param {Integer} FeatureVideo 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-checkfeaturesupport
     */
    CheckFeatureSupport(FeatureVideo, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(3, this, "int", FeatureVideo, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_DECODER_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideodecoder
     */
    CreateVideoDecoder(pDesc, riid, ppVideoDecoder) {
        ppVideoDecoderMarshal := ppVideoDecoder is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pDesc, "ptr", riid, ppVideoDecoderMarshal, ppVideoDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_DECODER_HEAP_DESC>} pVideoDecoderHeapDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoDecoderHeap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideodecoderheap
     */
    CreateVideoDecoderHeap(pVideoDecoderHeapDesc, riid, ppVideoDecoderHeap) {
        ppVideoDecoderHeapMarshal := ppVideoDecoderHeap is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pVideoDecoderHeapDesc, "ptr", riid, ppVideoDecoderHeapMarshal, ppVideoDecoderHeap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NodeMask 
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC>} pOutputStreamDesc 
     * @param {Integer} NumInputStreamDescs 
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC>} pInputStreamDescs 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoProcessor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideoprocessor
     */
    CreateVideoProcessor(NodeMask, pOutputStreamDesc, NumInputStreamDescs, pInputStreamDescs, riid, ppVideoProcessor) {
        ppVideoProcessorMarshal := ppVideoProcessor is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", NodeMask, "ptr", pOutputStreamDesc, "uint", NumInputStreamDescs, "ptr", pInputStreamDescs, "ptr", riid, ppVideoProcessorMarshal, ppVideoProcessor, "HRESULT")
        return result
    }
}
