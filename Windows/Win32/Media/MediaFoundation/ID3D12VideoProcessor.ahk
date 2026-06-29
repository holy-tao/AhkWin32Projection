#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC }
#Import "..\..\Graphics\Direct3D12\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Provides methods for getting information about the parameters to the call to ID3D12VideoDevice::CreateVideoProcessor that created the video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoProcessor extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12VideoProcessor
     * @type {Guid}
     */
    static IID := Guid("{304fdb32-bede-410a-8545-943ac6a46138}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoProcessor interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetNodeMask            : IntPtr
        GetNumInputStreamDescs : IntPtr
        GetInputStreamDescs    : IntPtr
        GetOutputStreamDesc    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the node mask provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @returns {Integer} This method returns a UINT.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocessor-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * Gets the number of input stream descriptions provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @returns {Integer} This method returns UINT. Use this value to determine the correct size of the array you pass in the *pInputStreamDescs* parameter to [ID3D12VideoProcessor::GetInputStreamDescs](nf-d3d12video-id3d12videoprocessor-getinputstreamdescs.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocessor-getnuminputstreamdescs
     */
    GetNumInputStreamDescs() {
        result := ComCall(9, this, UInt32)
        return result
    }

    /**
     * Gets the input stream descriptions provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @param {Integer} NumInputStreamDescs The size of the array pointed to by *pInputStreamDescs*. Get the number of input stream descriptions associated with the video processor by calling [ID3DVideoProcessor::GetNumInputStreamDescs](nf-d3d12video-id3d12videoprocessor-getnuminputstreamdescs.md).
     * @returns {D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC} An array of [D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC](ns-d3d12video-d3d12_video_process_input_stream_desc.md) structures that is populated with the input stream descriptions associated with the video processor.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocessor-getinputstreamdescs
     */
    GetInputStreamDescs(NumInputStreamDescs) {
        pInputStreamDescs := D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC()
        result := ComCall(10, this, "uint", NumInputStreamDescs, D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.Ptr, pInputStreamDescs, "HRESULT")
        return pInputStreamDescs
    }

    /**
     * Gets the output stream description provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @returns {D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC} This method returns [D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC](ns-d3d12video-d3d12_video_process_output_stream_desc.md).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocessor-getoutputstreamdesc
     */
    GetOutputStreamDesc() {
        result := ComCall(11, this, D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC)
        return result
    }

    Query(iid) {
        if (ID3D12VideoProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNodeMask := CallbackCreate(GetMethod(implObj, "GetNodeMask"), flags, 1)
        this.vtbl.GetNumInputStreamDescs := CallbackCreate(GetMethod(implObj, "GetNumInputStreamDescs"), flags, 1)
        this.vtbl.GetInputStreamDescs := CallbackCreate(GetMethod(implObj, "GetInputStreamDescs"), flags, 3)
        this.vtbl.GetOutputStreamDesc := CallbackCreate(GetMethod(implObj, "GetOutputStreamDesc"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNodeMask)
        CallbackFree(this.vtbl.GetNumInputStreamDescs)
        CallbackFree(this.vtbl.GetInputStreamDescs)
        CallbackFree(this.vtbl.GetOutputStreamDesc)
    }
}
