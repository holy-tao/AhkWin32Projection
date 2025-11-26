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
     * Opens an ISpatialAudioMetadataItems object for copying.
     * @param {ISpatialAudioMetadataItems} metadataItems A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object to be opened for copying
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
     * <dt><b>SPTLAUD_MD_CLNT_E_ITEMS_ALREADY_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Open</b> has already been called on the supplied <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> since the object was created or since the last call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided pointer is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * Copies metadata items from the source ISpatialAudioMetadataItems, provided to the Open method, object to the destination ISpatialAudioMetadataItems object, specified with the dstMetadataItems parameter.
     * @param {Integer} copyFrameCount The number of frames from the current copy position for which metadata items are copied. After the copy, the internal copy position within the source <b>SpatialAudioMetadataItems</b> is advanced the value specified in this parameter. Set this value to 0 to copy the entire frame range contained in the  source <b>SpatialAudioMetadataItems</b>.
     * @param {Integer} copyMode A value that specifies the copy mode for the operation.
     * @param {ISpatialAudioMetadataItems} dstMetadataItems A pointer to the  destination <b>SpatialAudioMetadataItems</b> for the copy operation.
     * @returns {Integer} Receives number of metadata items copied in the operation.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-copymetadataforframes
     */
    CopyMetadataForFrames(copyFrameCount, copyMode, dstMetadataItems) {
        result := ComCall(4, this, "ushort", copyFrameCount, "int", copyMode, "ptr", dstMetadataItems, "ushort*", &itemsCopied := 0, "HRESULT")
        return itemsCopied
    }

    /**
     * Completes any necessary operations on the SpatialAudioMetadataItems object and releases the object.
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
     * <dt><b>SPTLAUD_MD_CLNT_E_NO_ITEMS_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for reading with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open">Open</a> or the object has been closed for writing with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close">Close</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
