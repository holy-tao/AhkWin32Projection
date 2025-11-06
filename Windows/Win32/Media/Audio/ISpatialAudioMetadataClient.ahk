#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioMetadataWriter.ahk
#Include .\ISpatialAudioMetadataCopier.ahk
#Include .\ISpatialAudioMetadataReader.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-getspatialaudiometadataitemsbufferlength
     */
    GetSpatialAudioMetadataItemsBufferLength(maxItemCount) {
        result := ComCall(4, this, "ushort", maxItemCount, "uint*", &bufferLength := 0, "HRESULT")
        return bufferLength
    }

    /**
     * 
     * @param {Integer} overflowMode 
     * @returns {ISpatialAudioMetadataWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatawriter
     */
    ActivateSpatialAudioMetadataWriter(overflowMode) {
        result := ComCall(5, this, "int", overflowMode, "ptr*", &metadataWriter := 0, "HRESULT")
        return ISpatialAudioMetadataWriter(metadataWriter)
    }

    /**
     * 
     * @returns {ISpatialAudioMetadataCopier} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatacopier
     */
    ActivateSpatialAudioMetadataCopier() {
        result := ComCall(6, this, "ptr*", &metadataCopier := 0, "HRESULT")
        return ISpatialAudioMetadataCopier(metadataCopier)
    }

    /**
     * 
     * @returns {ISpatialAudioMetadataReader} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatareader
     */
    ActivateSpatialAudioMetadataReader() {
        result := ComCall(7, this, "ptr*", &metadataReader := 0, "HRESULT")
        return ISpatialAudioMetadataReader(metadataReader)
    }
}
