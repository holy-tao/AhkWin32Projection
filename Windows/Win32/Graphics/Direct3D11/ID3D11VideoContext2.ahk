#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11VideoContext1.ahk" { ID3D11VideoContext1 }
#Import ".\ID3D11VideoProcessor.ahk" { ID3D11VideoProcessor }
#Import "..\Dxgi\DXGI_HDR_METADATA_TYPE.ahk" { DXGI_HDR_METADATA_TYPE }

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device. (ID3D11VideoContext2)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11videocontext2
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoContext2 extends ID3D11VideoContext1 {
    /**
     * The interface identifier for ID3D11VideoContext2
     * @type {Guid}
     */
    static IID := Guid("{c4e7374c-6243-4d1b-ae87-52b4f740e261}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoContext2 interfaces
    */
    struct Vtbl extends ID3D11VideoContext1.Vtbl {
        VideoProcessorSetOutputHDRMetaData : IntPtr
        VideoProcessorGetOutputHDRMetaData : IntPtr
        VideoProcessorSetStreamHDRMetaData : IntPtr
        VideoProcessorGetStreamHDRMetaData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the HDR metadata describing the display on which the content will be presented.
     * @remarks
     * When processing an HDR stream, the driver may use this metadata optimize the video for the output display.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {DXGI_HDR_METADATA_TYPE} Type The type of HDR metadata supplied.
     * @param {Integer} _Size The size of the HDR metadata supplied in <i>pHDRMetaData</i>.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, the size should be 0.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, the size is <c>sizeof(DXGI_HDR_METADATA_HDR10)</c>.
     * @param {Integer} pHDRMetaData Pointer to the metadata information.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, this should be NULL.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, this is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10">DXGI_HDR_METADATA_HDR10</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorsetoutputhdrmetadata
     */
    VideoProcessorSetOutputHDRMetaData(pVideoProcessor, Type, _Size, pHDRMetaData) {
        ComCall(79, this, "ptr", pVideoProcessor, DXGI_HDR_METADATA_TYPE, Type, "uint", _Size, "ptr", pHDRMetaData)
    }

    /**
     * Gets the HDR metadata describing the display on which the content will be presented.
     * @remarks
     * This can be called multiple times, the first time to get the <i>Type</i> (in which case <i>Size</i> can be 0 and <i>pHDRMetaData</i> can be NULL) and then again to with non-NULL values to retrieve the actual metadata.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Pointer<DXGI_HDR_METADATA_TYPE>} pType The type of HDR metadata supplied.
     * @param {Integer} _Size The size of the memory referenced by <i>pHDRMetaData</i>.
     * 
     * If <i>pHDRMetaData</i> is NULL, <i>Size</i> should be 0.
     * @param {Integer} pMetaData Pointer to a buffer that receives the HDR metadata.
     * 
     * This parameter can be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorgetoutputhdrmetadata
     */
    VideoProcessorGetOutputHDRMetaData(pVideoProcessor, pType, _Size, pMetaData) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        ComCall(80, this, "ptr", pVideoProcessor, pTypeMarshal, pType, "uint", _Size, "ptr", pMetaData)
    }

    /**
     * Sets the HDR metadata associated with the video stream.
     * @remarks
     * When processing an HDR stream, the driver may use this information to tone map the video content to optimize it for the output display.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Identifies the input stream.
     * @param {DXGI_HDR_METADATA_TYPE} Type The type of HDR metadata supplied.
     * @param {Integer} _Size The size of the HDR metadata supplied in <i>pHDRMetaData</i>.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, the size should be 0.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, the size is <c>sizeof(DXGI_HDR_METADATA_HDR10)</c>.
     * @param {Integer} pHDRMetaData Pointer to the metadata information.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, this should be NULL.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, this is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10">DXGI_HDR_METADATA_HDR10</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorsetstreamhdrmetadata
     */
    VideoProcessorSetStreamHDRMetaData(pVideoProcessor, StreamIndex, Type, _Size, pHDRMetaData) {
        ComCall(81, this, "ptr", pVideoProcessor, "uint", StreamIndex, DXGI_HDR_METADATA_TYPE, Type, "uint", _Size, "ptr", pHDRMetaData)
    }

    /**
     * Gets the HDR metadata associated with the video stream.
     * @remarks
     * This can be called multiple times, the first time to get the <i>Type</i> (in which case <i>Size</i> can be 0 and <i>pHDRMetaData</i> can be NULL) and then again to with non-NULL values to retrieve the actual metadata.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Identifies the input stream.
     * @param {Pointer<DXGI_HDR_METADATA_TYPE>} pType The type of the HDR metadata currently associated with the stream.
     * @param {Integer} _Size The size of the memory referenced by <i>pHDRMetaData</i>.
     * 
     * If <i>pHDRMetaData</i> is NULL, <i>Size</i> should be 0.
     * @param {Integer} pMetaData Pointer to a buffer that receives the HDR metadata.
     * 
     * This parameter can be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorgetstreamhdrmetadata
     */
    VideoProcessorGetStreamHDRMetaData(pVideoProcessor, StreamIndex, pType, _Size, pMetaData) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        ComCall(82, this, "ptr", pVideoProcessor, "uint", StreamIndex, pTypeMarshal, pType, "uint", _Size, "ptr", pMetaData)
    }

    Query(iid) {
        if (ID3D11VideoContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.VideoProcessorSetOutputHDRMetaData := CallbackCreate(GetMethod(implObj, "VideoProcessorSetOutputHDRMetaData"), flags, 5)
        this.vtbl.VideoProcessorGetOutputHDRMetaData := CallbackCreate(GetMethod(implObj, "VideoProcessorGetOutputHDRMetaData"), flags, 5)
        this.vtbl.VideoProcessorSetStreamHDRMetaData := CallbackCreate(GetMethod(implObj, "VideoProcessorSetStreamHDRMetaData"), flags, 6)
        this.vtbl.VideoProcessorGetStreamHDRMetaData := CallbackCreate(GetMethod(implObj, "VideoProcessorGetStreamHDRMetaData"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.VideoProcessorSetOutputHDRMetaData)
        CallbackFree(this.vtbl.VideoProcessorGetOutputHDRMetaData)
        CallbackFree(this.vtbl.VideoProcessorSetStreamHDRMetaData)
        CallbackFree(this.vtbl.VideoProcessorGetStreamHDRMetaData)
    }
}
