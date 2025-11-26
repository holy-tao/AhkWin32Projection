#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for extracting spatial audio metadata items and item command value pairs from an ISpatialAudioMetadataItems object.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioMetadataReader
     * @type {Guid}
     */
    static IID => Guid("{b78e86a2-31d9-4c32-94d2-7df40fc7ebec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "ReadNextItem", "ReadNextItemCommand", "Close"]

    /**
     * Opens an ISpatialAudioMetadataItems object for reading.
     * @param {ISpatialAudioMetadataItems} metadataItems A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object to be opened for reading
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
     * <b>Open</b> has already been called on the supplied <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> since the object was created or since the last call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close">Close</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * Gets the number of commands and the sample offset for the metadata item being read.
     * @param {Pointer<Integer>} commandCount Receives the number of command/value pairs in the metadata item being read.
     * @param {Pointer<Integer>} frameOffset Gets the frame offset associated with the metadata item being read.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more metadata items in the frame range specified in the call to <a href="/previous-versions/windows/desktop/legacy/mt798194(v=vs.85)">ReadItemCountInFrames</a>.
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
     * One of the provided pointers is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitem
     */
    ReadNextItem(commandCount, frameOffset) {
        commandCountMarshal := commandCount is VarRef ? "char*" : "ptr"
        frameOffsetMarshal := frameOffset is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, commandCountMarshal, commandCount, frameOffsetMarshal, frameOffset, "HRESULT")
        return result
    }

    /**
     * Reads metadata commands and value data for the current item.
     * @param {Pointer<Integer>} commandID Receives the command ID for the current command.
     * @param {Pointer} valueBuffer A pointer to a buffer which receives data specific to the command as specified by the
     * metadata format definition. The buffer must be at least <i>maxValueBufferLength</i> to ensure all commands can be successfully retrieved.
     * @param {Integer} maxValueBufferLength The maximum size of a command value.
     * @param {Pointer<Integer>} valueBufferLength The size, in bytes, of the data written to the  <i>valueBuffer</i> parameter.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the provided pointers is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitemcommand
     */
    ReadNextItemCommand(commandID, valueBuffer, maxValueBufferLength, valueBufferLength) {
        commandIDMarshal := commandID is VarRef ? "char*" : "ptr"
        valueBufferLengthMarshal := valueBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, commandIDMarshal, commandID, "ptr", valueBuffer, "uint", maxValueBufferLength, valueBufferLengthMarshal, valueBufferLength, "HRESULT")
        return result
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
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
