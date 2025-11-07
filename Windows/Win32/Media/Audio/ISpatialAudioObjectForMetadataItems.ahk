#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioMetadataItems.ahk
#Include .\ISpatialAudioObjectBase.ahk

/**
 * Used to write spatial audio metadata for applications that require multiple metadata items per buffer with frame-accurate placement.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadataitems
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectForMetadataItems extends ISpatialAudioObjectBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectForMetadataItems
     * @type {Guid}
     */
    static IID => Guid("{ddea49ff-3bc0-4377-8aad-9fbcfd808566}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSpatialAudioMetadataItems"]

    /**
     * 
     * @returns {ISpatialAudioMetadataItems} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectformetadataitems-getspatialaudiometadataitems
     */
    GetSpatialAudioMetadataItems() {
        result := ComCall(7, this, "ptr*", &metadataItems := 0, "HRESULT")
        return ISpatialAudioMetadataItems(metadataItems)
    }
}
