#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for copying all or subsets of metadata items from a source SpatialAudioMetadataItems into a destination SpatialAudioMetadataItems.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatacopier
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataCopier extends IUnknown{
    /**
     * The interface identifier for ISpatialAudioMetadataCopier
     * @type {Guid}
     */
    static IID => Guid("{d224b233-e251-4fd0-9ca2-d5ecf9a68404}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataItems>} metadataItems 
     * @returns {HRESULT} 
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} copyFrameCount 
     * @param {Integer} copyMode 
     * @param {Pointer<ISpatialAudioMetadataItems>} dstMetadataItems 
     * @param {Pointer<UInt16>} itemsCopied 
     * @returns {HRESULT} 
     */
    CopyMetadataForFrames(copyFrameCount, copyMode, dstMetadataItems, itemsCopied) {
        result := ComCall(4, this, "ushort", copyFrameCount, "int", copyMode, "ptr", dstMetadataItems, "ushort*", itemsCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
