#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a buffer of spatial audio metadata items.
 * @remarks
 * 
  * Get an instance of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems">ISpatialAudioMetadataClient::ActivateSpatialAudioMetadataItems</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataItems extends IUnknown{
    /**
     * The interface identifier for ISpatialAudioMetadataItems
     * @type {Guid}
     */
    static IID => Guid("{bcd7c78f-3098-4f22-b547-a2f25a381269}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt16>} frameCount 
     * @returns {HRESULT} 
     */
    GetFrameCount(frameCount) {
        result := ComCall(3, this, "ushort*", frameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} itemCount 
     * @returns {HRESULT} 
     */
    GetItemCount(itemCount) {
        result := ComCall(4, this, "ushort*", itemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} maxItemCount 
     * @returns {HRESULT} 
     */
    GetMaxItemCount(maxItemCount) {
        result := ComCall(5, this, "ushort*", maxItemCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} maxValueBufferLength 
     * @returns {HRESULT} 
     */
    GetMaxValueBufferLength(maxValueBufferLength) {
        result := ComCall(6, this, "uint*", maxValueBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SpatialAudioMetadataItemsInfo>} info 
     * @returns {HRESULT} 
     */
    GetInfo(info) {
        result := ComCall(7, this, "ptr", info, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
