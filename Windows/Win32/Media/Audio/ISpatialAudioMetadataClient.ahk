#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a class factory for creating ISpatialAudioMetadataItems, ISpatialAudioMetadataWriter, ISpatialAudioMetadataReader, and ISpatialAudioMetadataCopier objects.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioMetadataClient
     * @type {Guid}
     */
    static IID => Guid("{777d4a3b-f6ff-4a26-85dc-68d7cdeda1d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateSpatialAudioMetadataItems", "GetSpatialAudioMetadataItemsBufferLength", "ActivateSpatialAudioMetadataWriter", "ActivateSpatialAudioMetadataCopier", "ActivateSpatialAudioMetadataReader"]

    /**
     * 
     * @param {Integer} maxItemCount 
     * @param {Integer} frameCount 
     * @param {Pointer<ISpatialAudioMetadataItemsBuffer>} metadataItemsBuffer 
     * @param {Pointer<ISpatialAudioMetadataItems>} metadataItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems
     */
    ActivateSpatialAudioMetadataItems(maxItemCount, frameCount, metadataItemsBuffer, metadataItems) {
        result := ComCall(3, this, "ushort", maxItemCount, "ushort", frameCount, "ptr*", metadataItemsBuffer, "ptr*", metadataItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} maxItemCount 
     * @param {Pointer<Integer>} bufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-getspatialaudiometadataitemsbufferlength
     */
    GetSpatialAudioMetadataItemsBufferLength(maxItemCount, bufferLength) {
        result := ComCall(4, this, "ushort", maxItemCount, "uint*", bufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} overflowMode 
     * @param {Pointer<ISpatialAudioMetadataWriter>} metadataWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatawriter
     */
    ActivateSpatialAudioMetadataWriter(overflowMode, metadataWriter) {
        result := ComCall(5, this, "int", overflowMode, "ptr*", metadataWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataCopier>} metadataCopier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatacopier
     */
    ActivateSpatialAudioMetadataCopier(metadataCopier) {
        result := ComCall(6, this, "ptr*", metadataCopier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataReader>} metadataReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatareader
     */
    ActivateSpatialAudioMetadataReader(metadataReader) {
        result := ComCall(7, this, "ptr*", metadataReader, "HRESULT")
        return result
    }
}
