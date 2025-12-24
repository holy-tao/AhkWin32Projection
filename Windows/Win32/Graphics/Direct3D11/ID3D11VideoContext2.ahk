#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoContext1.ahk

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11videocontext2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoContext2 extends ID3D11VideoContext1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoContext2
     * @type {Guid}
     */
    static IID => Guid("{c4e7374c-6243-4d1b-ae87-52b4f740e261}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 79

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VideoProcessorSetOutputHDRMetaData", "VideoProcessorGetOutputHDRMetaData", "VideoProcessorSetStreamHDRMetaData", "VideoProcessorGetStreamHDRMetaData"]

    /**
     * Sets the HDR metadata describing the display on which the content will be presented.
     * @remarks
     * 
     * When processing an HDR stream, the driver may use this metadata optimize the video for the output display.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} Type The type of HDR metadata supplied.
     * @param {Integer} Size The size of the HDR metadata supplied in <i>pHDRMetaData</i>.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, the size should be 0.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, the size is <c>sizeof(DXGI_HDR_METADATA_HDR10)</c>.
     * @param {Pointer} pHDRMetaData Pointer to the metadata information.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, this should be NULL.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, this is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10">DXGI_HDR_METADATA_HDR10</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorsetoutputhdrmetadata
     */
    VideoProcessorSetOutputHDRMetaData(pVideoProcessor, Type, Size, pHDRMetaData) {
        ComCall(79, this, "ptr", pVideoProcessor, "int", Type, "uint", Size, "ptr", pHDRMetaData)
    }

    /**
     * Gets the HDR metadata describing the display on which the content will be presented.
     * @remarks
     * 
     * This can be called multiple times, the first time to get the <i>Type</i> (in which case <i>Size</i> can be 0 and <i>pHDRMetaData</i> can be NULL) and then again to with non-NULL values to retrieve the actual metadata.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Pointer<Integer>} pType The type of HDR metadata supplied.
     * @param {Integer} Size The size of the memory referenced by <i>pHDRMetaData</i>.
     * 
     * If <i>pHDRMetaData</i> is NULL, <i>Size</i> should be 0.
     * @param {Pointer} pMetaData Pointer to a buffer that receives the HDR metadata.
     * 
     * This parameter can be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorgetoutputhdrmetadata
     */
    VideoProcessorGetOutputHDRMetaData(pVideoProcessor, pType, Size, pMetaData) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        ComCall(80, this, "ptr", pVideoProcessor, pTypeMarshal, pType, "uint", Size, "ptr", pMetaData)
    }

    /**
     * Sets the HDR metadata associated with the video stream.
     * @remarks
     * 
     * When processing an HDR stream, the driver may use this information to tone map the video content to optimize it for the output display.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Identifies the input stream.
     * @param {Integer} Type The type of HDR metadata supplied.
     * @param {Integer} Size The size of the HDR metadata supplied in <i>pHDRMetaData</i>.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, the size should be 0.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, the size is <c>sizeof(DXGI_HDR_METADATA_HDR10)</c>.
     * @param {Pointer} pHDRMetaData Pointer to the metadata information.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_NONE</b>, this should be NULL.
     * 
     * For <b>DXGI_HDR_METADATA_TYPE_HDR10</b>, this is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10">DXGI_HDR_METADATA_HDR10</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorsetstreamhdrmetadata
     */
    VideoProcessorSetStreamHDRMetaData(pVideoProcessor, StreamIndex, Type, Size, pHDRMetaData) {
        ComCall(81, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Type, "uint", Size, "ptr", pHDRMetaData)
    }

    /**
     * Gets the HDR metadata associated with the video stream.
     * @remarks
     * 
     * This can be called multiple times, the first time to get the <i>Type</i> (in which case <i>Size</i> can be 0 and <i>pHDRMetaData</i> can be NULL) and then again to with non-NULL values to retrieve the actual metadata.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Identifies the input stream.
     * @param {Pointer<Integer>} pType The type of the HDR metadata currently associated with the stream.
     * @param {Integer} Size The size of the memory referenced by <i>pHDRMetaData</i>.
     * 
     * If <i>pHDRMetaData</i> is NULL, <i>Size</i> should be 0.
     * @param {Pointer} pMetaData Pointer to a buffer that receives the HDR metadata.
     * 
     * This parameter can be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorgetstreamhdrmetadata
     */
    VideoProcessorGetStreamHDRMetaData(pVideoProcessor, StreamIndex, pType, Size, pMetaData) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        ComCall(82, this, "ptr", pVideoProcessor, "uint", StreamIndex, pTypeMarshal, pType, "uint", Size, "ptr", pMetaData)
    }
}
