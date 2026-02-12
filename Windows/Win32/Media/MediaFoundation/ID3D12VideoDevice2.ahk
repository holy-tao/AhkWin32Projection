#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice1.ahk

/**
 * Adds support for protected resources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videodevice2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice2 extends ID3D12VideoDevice1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice2
     * @type {Guid}
     */
    static IID => Guid("{f019ac49-f838-4a95-9b17-579437c8f513}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoDecoder1", "CreateVideoDecoderHeap1", "CreateVideoProcessor1", "CreateVideoExtensionCommand", "ExecuteExtensionCommand"]

    /**
     * Creates a video decoder instance that contains the resolution-independent driver resources and state, with support for protected resources.
     * @remarks
     * Decoding a new stream requires instantiating a new decoder object.
     * @param {Pointer<D3D12_VIDEO_DECODER_DESC>} pDesc A pointer to a [D3D12\_VIDEO\_DECODER\_DESC](ns-d3d12video-d3d12_video_decoder_desc.md) structure describing the decode profile and bitstream encryption for the decoder.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the decode video state interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the [ID3D12VideoDecoder1](nn-d3d12video-id3d12videodecoder1.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice2-createvideodecoder1
     */
    CreateVideoDecoder1(pDesc, pProtectedResourceSession, riid) {
        result := ComCall(9, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", &ppVideoDecoder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoDecoder
    }

    /**
     * Allocates a video decoder heap that contains the resolution-dependent driver resources and state, with support for protected resources.
     * @param {Pointer<D3D12_VIDEO_DECODER_HEAP_DESC>} pVideoDecoderHeapDesc A pointer to a [D3D12\_VIDEO\_DECODER\_HEAP\_DESC](ns-d3d12video-d3d12_video_decoder_heap_desc.md) describing the decoding configuration.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the decode video state interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the [ID3D12VideoDecoderHeap1](nn-d3d12video-id3d12videodecoderheap1.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice2-createvideodecoderheap1
     */
    CreateVideoDecoderHeap1(pVideoDecoderHeapDesc, pProtectedResourceSession, riid) {
        result := ComCall(10, this, "ptr", pVideoDecoderHeapDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", &ppVideoDecoderHeap := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoDecoderHeap
    }

    /**
     * Creates a video processor instance with support for protected resources.
     * @remarks
     * To change the parameters set during creation, you must recreate the video processor object.
     * @param {Integer} NodeMask The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC>} pOutputStreamDesc A pointer to a D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC(ns-d3d12video-d3d12_video_process_output_stream_desc) structure describing the output stream.
     * @param {Integer} NumInputStreamDescs The number of input streams provided in the *pInputStreamDescs* parameter.
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC>} pInputStreamDescs A pointer to a list of D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC(ns-d3d12video-d3d12_video_process_input_stream_desc) structures the input streams. The number of structures provided should match the value specified in the *NumInputStreamDescs* parameter.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the video processor interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the [ID3D12VideoProcessor1](nn-d3d12video-id3d12videoprocessor1.md) interface
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice2-createvideoprocessor1
     */
    CreateVideoProcessor1(NodeMask, pOutputStreamDesc, NumInputStreamDescs, pInputStreamDescs, pProtectedResourceSession, riid) {
        result := ComCall(11, this, "uint", NodeMask, "ptr", pOutputStreamDesc, "uint", NumInputStreamDescs, "ptr", pInputStreamDescs, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", &ppVideoProcessor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoProcessor
    }

    /**
     * Creates a video extension command.
     * @param {Pointer<D3D12_VIDEO_EXTENSION_COMMAND_DESC>} pDesc The [D3D12_VIDEO_EXTENSION_COMMAND_DESC](ns-d3d12video-d3d12_video_extension_command_desc.md) describing the command to be created.
     * @param {Pointer} pCreationParameters A pointer to the creation parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CREATION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} CreationParametersDataSizeInBytes The size of the *pCreationParameters* parameter structure, in bytes.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) interface.
     * @returns {Pointer<Pointer<Void>>} A  pointer to a memory block that receives a pointer to the [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice2-createvideoextensioncommand
     */
    CreateVideoExtensionCommand(pDesc, pCreationParameters, CreationParametersDataSizeInBytes, pProtectedResourceSession, riid) {
        result := ComCall(12, this, "ptr", pDesc, "ptr", pCreationParameters, "ptr", CreationParametersDataSizeInBytes, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", &ppVideoExtensionCommand := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoExtensionCommand
    }

    /**
     * Executes a video extension command.
     * @remarks
     * Video extension commands executed through this method must complete before this method returns. For efficiency, extension implementations should schedule work in command lists instead of using this method, whenever possible. Each video command list type provides an **ExecuteExtensionCommand** for scheduled work. These include:
     * 
     * - [ID3D12VideoDecodeComandlist2::ExecuteExtensionCommand](nf-d3d12video-id3d12videodecodecommandlist2-executeextensioncommand.md)
     * - [ID3D12VideoEncodeComandlist1::ExecuteExtensionCommand](/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice2-executeextensioncommand)
     * - [ID3D12VideoProcessComandlist2::ExecuteExtensionCommand](nf-d3d12video-id3d12videoprocesscommandlist2-executeextensioncommand.md)
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand Pointer to an [ID3D12VideoExtensionCommand](nn-d3d12video-id3d12videoextensioncommand.md) representing the video extension command to execute.  The caller is responsible for maintaining object lifetime until command execution is complete.
     * @param {Pointer} pExecutionParameters A pointer to the execution input parameters structure, which is defined by the command.  The parameters structure must match the parameters enumerated by a call to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature value of [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) and a parameter stage value of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md).
     * @param {Pointer} ExecutionParametersSizeInBytes The size of the *pExecutionParameters* parameter structure, in bytes.
     * @param {Pointer} pOutputData A pointer to the execution output parameters structure, which is defined by the command.
     * @param {Pointer} OutputDataSizeInBytes Receives the size of the *pExecutionParameters* parameter structure, in bytes.
     * @returns {HRESULT} This method returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice2-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes, pOutputData, OutputDataSizeInBytes) {
        result := ComCall(13, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes, "ptr", pOutputData, "ptr", OutputDataSizeInBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
