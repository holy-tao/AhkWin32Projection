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
     * 
     * @param {Integer} maxItemCount 
     * @param {Integer} frameCount 
     * @param {Pointer<ISpatialAudioMetadataItemsBuffer>} metadataItemsBuffer 
     * @param {Pointer<ISpatialAudioMetadataItems>} metadataItems 
     * @returns {HRESULT} 
     */
    ActivateSpatialAudioMetadataItems(maxItemCount, frameCount, metadataItemsBuffer, metadataItems) {
        result := ComCall(3, this, "ushort", maxItemCount, "ushort", frameCount, "ptr", metadataItemsBuffer, "ptr", metadataItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} maxItemCount 
     * @param {Pointer<UInt32>} bufferLength 
     * @returns {HRESULT} 
     */
    GetSpatialAudioMetadataItemsBufferLength(maxItemCount, bufferLength) {
        result := ComCall(4, this, "ushort", maxItemCount, "uint*", bufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} overflowMode 
     * @param {Pointer<ISpatialAudioMetadataWriter>} metadataWriter 
     * @returns {HRESULT} 
     */
    ActivateSpatialAudioMetadataWriter(overflowMode, metadataWriter) {
        result := ComCall(5, this, "int", overflowMode, "ptr", metadataWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataCopier>} metadataCopier 
     * @returns {HRESULT} 
     */
    ActivateSpatialAudioMetadataCopier(metadataCopier) {
        result := ComCall(6, this, "ptr", metadataCopier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataReader>} metadataReader 
     * @returns {HRESULT} 
     */
    ActivateSpatialAudioMetadataReader(metadataReader) {
        result := ComCall(7, this, "ptr", metadataReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
