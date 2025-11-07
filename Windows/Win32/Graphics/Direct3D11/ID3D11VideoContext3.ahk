#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoContext2.ahk

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11videocontext3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoContext3 extends ID3D11VideoContext2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoContext3
     * @type {Guid}
     */
    static IID => Guid("{a9e2faa0-cb39-418f-a0b7-d8aad4de672e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecoderBeginFrame1", "SubmitDecoderBuffers2"]

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {ID3D11VideoDecoderOutputView} pView 
     * @param {Integer} ContentKeySize 
     * @param {Pointer} pContentKey 
     * @param {Integer} NumComponentHistograms 
     * @param {Pointer<Integer>} pHistogramOffsets 
     * @param {Pointer<ID3D11Buffer>} ppHistogramBuffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext3-decoderbeginframe1
     */
    DecoderBeginFrame1(pDecoder, pView, ContentKeySize, pContentKey, NumComponentHistograms, pHistogramOffsets, ppHistogramBuffers) {
        pHistogramOffsetsMarshal := pHistogramOffsets is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "ptr", pDecoder, "ptr", pView, "uint", ContentKeySize, "ptr", pContentKey, "uint", NumComponentHistograms, pHistogramOffsetsMarshal, pHistogramOffsets, "ptr*", ppHistogramBuffers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} NumBuffers 
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC2>} pBufferDesc 
     * @returns {HRESULT} 
     */
    SubmitDecoderBuffers2(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(84, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "HRESULT")
        return result
    }
}
