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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameCount", "GetItemCount", "GetMaxItemCount", "GetMaxValueBufferLength", "GetInfo"]

    /**
     * 
     * @param {Pointer<Integer>} frameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getframecount
     */
    GetFrameCount(frameCount) {
        result := ComCall(3, this, "ushort*", frameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} itemCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getitemcount
     */
    GetItemCount(itemCount) {
        result := ComCall(4, this, "ushort*", itemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} maxItemCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getmaxitemcount
     */
    GetMaxItemCount(maxItemCount) {
        result := ComCall(5, this, "ushort*", maxItemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} maxValueBufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getmaxvaluebufferlength
     */
    GetMaxValueBufferLength(maxValueBufferLength) {
        result := ComCall(6, this, "uint*", maxValueBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SpatialAudioMetadataItemsInfo>} info 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getinfo
     */
    GetInfo(info) {
        result := ComCall(7, this, "ptr", info, "HRESULT")
        return result
    }
}
