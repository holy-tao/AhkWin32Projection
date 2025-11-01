#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice1.ahk

/**
 * Adds support for protected resources.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videodevice2
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
     * 
     * @param {Pointer<D3D12_VIDEO_DECODER_DESC>} pDesc 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice2-createvideodecoder1
     */
    CreateVideoDecoder1(pDesc, pProtectedResourceSession, riid, ppVideoDecoder) {
        result := ComCall(9, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", ppVideoDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_DECODER_HEAP_DESC>} pVideoDecoderHeapDesc 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoDecoderHeap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice2-createvideodecoderheap1
     */
    CreateVideoDecoderHeap1(pVideoDecoderHeapDesc, pProtectedResourceSession, riid, ppVideoDecoderHeap) {
        result := ComCall(10, this, "ptr", pVideoDecoderHeapDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", ppVideoDecoderHeap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NodeMask 
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC>} pOutputStreamDesc 
     * @param {Integer} NumInputStreamDescs 
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC>} pInputStreamDescs 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoProcessor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice2-createvideoprocessor1
     */
    CreateVideoProcessor1(NodeMask, pOutputStreamDesc, NumInputStreamDescs, pInputStreamDescs, pProtectedResourceSession, riid, ppVideoProcessor) {
        result := ComCall(11, this, "uint", NodeMask, "ptr", pOutputStreamDesc, "uint", NumInputStreamDescs, "ptr", pInputStreamDescs, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", ppVideoProcessor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_EXTENSION_COMMAND_DESC>} pDesc 
     * @param {Pointer} pCreationParameters 
     * @param {Pointer} CreationParametersDataSizeInBytes 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoExtensionCommand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice2-createvideoextensioncommand
     */
    CreateVideoExtensionCommand(pDesc, pCreationParameters, CreationParametersDataSizeInBytes, pProtectedResourceSession, riid, ppVideoExtensionCommand) {
        result := ComCall(12, this, "ptr", pDesc, "ptr", pCreationParameters, "ptr", CreationParametersDataSizeInBytes, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", ppVideoExtensionCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12VideoExtensionCommand} pExtensionCommand 
     * @param {Pointer} pExecutionParameters 
     * @param {Pointer} ExecutionParametersSizeInBytes 
     * @param {Pointer} pOutputData 
     * @param {Pointer} OutputDataSizeInBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice2-executeextensioncommand
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes, pOutputData, OutputDataSizeInBytes) {
        result := ComCall(13, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes, "ptr", pOutputData, "ptr", OutputDataSizeInBytes, "HRESULT")
        return result
    }
}
