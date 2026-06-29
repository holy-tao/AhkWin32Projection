#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoDecoder.ahk" { ID3D12VideoDecoder }
#Import ".\D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1.ahk" { D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1 }
#Import ".\ID3D12VideoDecodeCommandList.ahk" { ID3D12VideoDecodeCommandList }
#Import ".\D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS.ahk" { D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS }

/**
 * Encapsulates a list of graphics commands for video decoding. This interface inherits from ID3D12VideoDecodeCommandList and adds support for video decode histograms.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodecodecommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDecodeCommandList1 extends ID3D12VideoDecodeCommandList {
    /**
     * The interface identifier for ID3D12VideoDecodeCommandList1
     * @type {Guid}
     */
    static IID := Guid("{d52f011b-b56e-453c-a05a-a7f311c8f472}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDecodeCommandList1 interfaces
    */
    struct Vtbl extends ID3D12VideoDecodeCommandList.Vtbl {
        DecodeFrame1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDecodeCommandList1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Records a decode frame operation to the command list.  Inputs, outputs, and parameters for the decode are specified as arguments to this method.
     * @param {ID3D12VideoDecoder} pDecoder A pointer to an [ID3D12VideoDecoder](nn-d3d12video-id3d12videodecoder.md) interface representing a decoder instance.
     * @param {Pointer<D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1>} pOutputArguments A [D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1](ns-d3d12video-d3d12_video_decode_output_stream_arguments1.md) structure specifying the output surface and output arguments.
     * @param {Pointer<D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS>} pInputArguments A [D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_decode_input_stream_arguments.md) structure specifying the input bitstream, reference frames, and other input parameters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecodecommandlist1-decodeframe1
     */
    DecodeFrame1(pDecoder, pOutputArguments, pInputArguments) {
        ComCall(23, this, "ptr", pDecoder, D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1.Ptr, pOutputArguments, D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS.Ptr, pInputArguments)
    }

    Query(iid) {
        if (ID3D12VideoDecodeCommandList1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DecodeFrame1 := CallbackCreate(GetMethod(implObj, "DecodeFrame1"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DecodeFrame1)
    }
}
