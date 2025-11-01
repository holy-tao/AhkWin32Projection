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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "CopyMetadataForFrames", "Close"]

    /**
     * 
     * @param {ISpatialAudioMetadataItems} metadataItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} copyFrameCount 
     * @param {Integer} copyMode 
     * @param {ISpatialAudioMetadataItems} dstMetadataItems 
     * @param {Pointer<Integer>} itemsCopied 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-copymetadataforframes
     */
    CopyMetadataForFrames(copyFrameCount, copyMode, dstMetadataItems, itemsCopied) {
        result := ComCall(4, this, "ushort", copyFrameCount, "int", copyMode, "ptr", dstMetadataItems, "ushort*", itemsCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
