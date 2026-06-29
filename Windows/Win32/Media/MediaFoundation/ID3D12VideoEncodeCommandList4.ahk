#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoEncodeCommandList3.ahk" { ID3D12VideoEncodeCommandList3 }
#Import ".\D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS1.ahk" { D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS1 }
#Import ".\D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS1.ahk" { D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS1 }
#Import ".\ID3D12VideoEncoderHeap1.ahk" { ID3D12VideoEncoderHeap1 }
#Import ".\D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_INPUT_ARGUMENTS.ahk" { D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_INPUT_ARGUMENTS }
#Import ".\ID3D12VideoEncoder.ahk" { ID3D12VideoEncoder }
#Import ".\D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_OUTPUT_ARGUMENTS.ahk" { D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_OUTPUT_ARGUMENTS }
#Import ".\D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1.ahk" { D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1 }
#Import ".\D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS1.ahk" { D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS1 }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoEncodeCommandList4 extends ID3D12VideoEncodeCommandList3 {
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList4
     * @type {Guid}
     */
    static IID := Guid("{69aeb5b7-55f2-4012-8b73-3a88d65a204c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoEncodeCommandList4 interfaces
    */
    struct Vtbl extends ID3D12VideoEncodeCommandList3.Vtbl {
        EncodeFrame1                  : IntPtr
        ResolveEncoderOutputMetadata1 : IntPtr
        ResolveInputParamLayout       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoEncodeCommandList4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3D12VideoEncoder} pEncoder 
     * @param {ID3D12VideoEncoderHeap1} pHeap 
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS1>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS1>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    EncodeFrame1(pEncoder, pHeap, pInputArguments, pOutputArguments) {
        ComCall(30, this, "ptr", pEncoder, "ptr", pHeap, D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS1.Ptr, pInputArguments, D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS1.Ptr, pOutputArguments)
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS1>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveEncoderOutputMetadata1(pInputArguments, pOutputArguments) {
        ComCall(31, this, D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS1.Ptr, pInputArguments, D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1.Ptr, pOutputArguments)
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_INPUT_ARGUMENTS>} pInputArguments 
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_OUTPUT_ARGUMENTS>} pOutputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveInputParamLayout(pInputArguments, pOutputArguments) {
        ComCall(32, this, D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_INPUT_ARGUMENTS.Ptr, pInputArguments, D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_OUTPUT_ARGUMENTS.Ptr, pOutputArguments)
    }

    Query(iid) {
        if (ID3D12VideoEncodeCommandList4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EncodeFrame1 := CallbackCreate(GetMethod(implObj, "EncodeFrame1"), flags, 5)
        this.vtbl.ResolveEncoderOutputMetadata1 := CallbackCreate(GetMethod(implObj, "ResolveEncoderOutputMetadata1"), flags, 3)
        this.vtbl.ResolveInputParamLayout := CallbackCreate(GetMethod(implObj, "ResolveInputParamLayout"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EncodeFrame1)
        CallbackFree(this.vtbl.ResolveEncoderOutputMetadata1)
        CallbackFree(this.vtbl.ResolveInputParamLayout)
    }
}
