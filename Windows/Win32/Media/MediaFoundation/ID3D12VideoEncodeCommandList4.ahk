#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoEncodeCommandList3.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList4 extends ID3D12VideoEncodeCommandList3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList4
     * @type {Guid}
     */
    static IID => Guid("{69aeb5b7-55f2-4012-8b73-3a88d65a204c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncodeFrame1", "ResolveEncoderOutputMetadata1", "ResolveInputParamLayout"]

    /**
     * 
     * @param {ID3D12VideoEncoder} pEncoder 
     * @param {ID3D12VideoEncoderHeap1} pHeap 
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS1>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS1>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    EncodeFrame1(pEncoder, pHeap, pInputArguments, pOutputArguments) {
        ComCall(30, this, "ptr", pEncoder, "ptr", pHeap, "ptr", pInputArguments, "ptr", pOutputArguments)
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS1>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveEncoderOutputMetadata1(pInputArguments, pOutputArguments) {
        ComCall(31, this, "ptr", pInputArguments, "ptr", pOutputArguments)
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_INPUT_ARGUMENTS>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_OUTPUT_ARGUMENTS>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveInputParamLayout(pInputArguments, pOutputArguments) {
        ComCall(32, this, "ptr", pInputArguments, "ptr", pOutputArguments)
    }
}
