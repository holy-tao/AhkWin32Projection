#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1 }
#Import ".\ID3D12VideoProcessCommandList.ahk" { ID3D12VideoProcessCommandList }
#Import ".\D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS.ahk" { D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS }
#Import ".\ID3D12VideoProcessor.ahk" { ID3D12VideoProcessor }

/**
 * Encapsulates a list of graphics commands for video processing. (ID3D12VideoProcessCommandList1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoprocesscommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoProcessCommandList1 extends ID3D12VideoProcessCommandList {
    /**
     * The interface identifier for ID3D12VideoProcessCommandList1
     * @type {Guid}
     */
    static IID := Guid("{542c5c4d-7596-434f-8c93-4efa6766f267}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoProcessCommandList1 interfaces
    */
    struct Vtbl extends ID3D12VideoProcessCommandList.Vtbl {
        ProcessFrames1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoProcessCommandList1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Records a video processing operation to the command list, operating on one or more input samples and writing the result to an output surface. (ID3D12VideoProcessCommandList1::ProcessFrames1)
     * @param {ID3D12VideoProcessor} pVideoProcessor A pointer to an [ID3D12VideoProcessor](nn-d3d12video-id3d12videoprocessor.md) interface representing a video processor instance.
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS>} pOutputArguments A [D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_process_output_stream_arguments.md) structure specifying the output surface and output arguments.
     * @param {Integer} NumInputStreams The count of input streams.
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1>} pInputArguments A pointer to an array of [D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1](ns-d3d12video-d3d12_video_process_input_stream_arguments1.md) structures specifying the input parameters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist1-processframes1
     */
    ProcessFrames1(pVideoProcessor, pOutputArguments, NumInputStreams, pInputArguments) {
        ComCall(23, this, "ptr", pVideoProcessor, D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS.Ptr, pOutputArguments, "uint", NumInputStreams, D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1.Ptr, pInputArguments)
    }

    Query(iid) {
        if (ID3D12VideoProcessCommandList1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessFrames1 := CallbackCreate(GetMethod(implObj, "ProcessFrames1"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessFrames1)
    }
}
