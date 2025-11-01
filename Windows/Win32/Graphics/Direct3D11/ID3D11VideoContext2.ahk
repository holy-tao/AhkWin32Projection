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
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} Type 
     * @param {Integer} Size 
     * @param {Pointer} pHDRMetaData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorsetoutputhdrmetadata
     */
    VideoProcessorSetOutputHDRMetaData(pVideoProcessor, Type, Size, pHDRMetaData) {
        ComCall(79, this, "ptr", pVideoProcessor, "int", Type, "uint", Size, "ptr", pHDRMetaData)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<Integer>} pType 
     * @param {Integer} Size 
     * @param {Pointer} pMetaData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorgetoutputhdrmetadata
     */
    VideoProcessorGetOutputHDRMetaData(pVideoProcessor, pType, Size, pMetaData) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        ComCall(80, this, "ptr", pVideoProcessor, pTypeMarshal, pType, "uint", Size, "ptr", pMetaData)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Type 
     * @param {Integer} Size 
     * @param {Pointer} pHDRMetaData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorsetstreamhdrmetadata
     */
    VideoProcessorSetStreamHDRMetaData(pVideoProcessor, StreamIndex, Type, Size, pHDRMetaData) {
        ComCall(81, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Type, "uint", Size, "ptr", pHDRMetaData)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Integer>} pType 
     * @param {Integer} Size 
     * @param {Pointer} pMetaData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext2-videoprocessorgetstreamhdrmetadata
     */
    VideoProcessorGetStreamHDRMetaData(pVideoProcessor, StreamIndex, pType, Size, pMetaData) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        ComCall(82, this, "ptr", pVideoProcessor, "uint", StreamIndex, pTypeMarshal, pType, "uint", Size, "ptr", pMetaData)
    }
}
