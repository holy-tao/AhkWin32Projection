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
     * Creates an ISpatialAudioMetadataItems object for storing spatial audio metadata items.
     * @param {Integer} maxItemCount The maximum number of metadata items that can be stored in the returned <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a>.
     * @param {Integer} frameCount The valid range of frame offset positions for metadata items stored in the returned <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a>.
     * @param {Pointer<ISpatialAudioMetadataItemsBuffer>} metadataItemsBuffer If a pointer is supplied, returns an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitemsbuffer">ISpatialAudioMetadataItemsBuffer</a> interface which provides methods for attaching caller-provided memory for storage of metadata items.  If this parameter is NULL, the object will allocate internal storage for the items.   This interface cannot be obtained via <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>.
     * @param {Pointer<ISpatialAudioMetadataItems>} metadataItems Receives an instance <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object which can be populated with metadata items using an  by <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter">ISpatialAudioMetadataWriter</a> or <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatacopier">ISpatialAudioMetadataCopier</a> and can be read with an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader">ISpatialAudioMetadataReader</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer provided in the <i>metadataItems</i> parameter  is not valid.
     * 
     * The value of <i>maxItemCount</i> or <i>frameCount</i> is 0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems
     */
    ActivateSpatialAudioMetadataItems(maxItemCount, frameCount, metadataItemsBuffer, metadataItems) {
        result := ComCall(3, this, "ushort", maxItemCount, "ushort", frameCount, "ptr*", metadataItemsBuffer, "ptr*", metadataItems, "HRESULT")
        return result
    }

    /**
     * Gets the length of the buffer required to store the specified number of spatial audio metadata items.
     * @param {Integer} maxItemCount The maximum number of metadata items to be stored in an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object.
     * @returns {Integer} The length of the buffer required to store the number of spatial audio metadata items specified in the <i>maxItemCount</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-getspatialaudiometadataitemsbufferlength
     */
    GetSpatialAudioMetadataItemsBufferLength(maxItemCount) {
        result := ComCall(4, this, "ushort", maxItemCount, "uint*", &bufferLength := 0, "HRESULT")
        return bufferLength
    }

    /**
     * Creates an ISpatialAudioMetadataWriter object for writing spatial audio metadata items to an ISpatialAudioMetadataItems object.
     * @param {Integer} overflowMode A value that specifies the behavior when attempting to write more metadata items to the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> than the maximum number of items specified when calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems">ActivateSpatialAudioMetadataItems</a>.
     * @returns {ISpatialAudioMetadataWriter} Receives a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter">ISpatialAudioMetadataWriter</a>.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatawriter
     */
    ActivateSpatialAudioMetadataWriter(overflowMode) {
        result := ComCall(5, this, "int", overflowMode, "ptr*", &metadataWriter := 0, "HRESULT")
        return ISpatialAudioMetadataWriter(metadataWriter)
    }

    /**
     * Creates an ISpatialAudioMetadataWriter object for copying spatial audio metadata items from one ISpatialAudioMetadataItems object to another.
     * @returns {ISpatialAudioMetadataCopier} Receives a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter">ISpatialAudioMetadataWriter</a>.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatacopier
     */
    ActivateSpatialAudioMetadataCopier() {
        result := ComCall(6, this, "ptr*", &metadataCopier := 0, "HRESULT")
        return ISpatialAudioMetadataCopier(metadataCopier)
    }

    /**
     * Creates an ISpatialAudioMetadataWriter object for reading spatial audio metadata items from an ISpatialAudioMetadataItems object.
     * @returns {ISpatialAudioMetadataReader} Receives a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader">ISpatialAudioMetadataReader</a>.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadatareader
     */
    ActivateSpatialAudioMetadataReader() {
        result := ComCall(7, this, "ptr*", &metadataReader := 0, "HRESULT")
        return ISpatialAudioMetadataReader(metadataReader)
    }
}
