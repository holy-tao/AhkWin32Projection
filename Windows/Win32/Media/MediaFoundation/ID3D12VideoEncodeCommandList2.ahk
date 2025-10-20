#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoEncodeCommandList1.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList2 extends ID3D12VideoEncodeCommandList1{
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList2
     * @type {Guid}
     */
    static IID => Guid("{895491e2-e701-46a9-9a1f-8d3480ed867a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * 
     * @param {Pointer<ID3D12VideoEncoder>} pEncoder 
     * @param {Pointer<ID3D12VideoEncoderHeap>} pHeap 
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    EncodeFrame(pEncoder, pHeap, pInputArguments, pOutputArguments) {
        ComCall(27, this, "ptr", pEncoder, "ptr", pHeap, "ptr", pInputArguments, "ptr", pOutputArguments)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveEncoderOutputMetadata(pInputArguments, pOutputArguments) {
        ComCall(28, this, "ptr", pInputArguments, "ptr", pOutputArguments)
        return result
    }
}
