#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for attaching buffers to SpatialAudioMetadataItems for in-place storage of data.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitemsbuffer
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataItemsBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioMetadataItemsBuffer
     * @type {Guid}
     */
    static IID => Guid("{42640a16-e1bd-42d9-9ff6-031ab71a2dba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachToBuffer", "AttachToPopulatedBuffer", "DetachBuffer"]

    /**
     * Attaches caller-provided memory for storage of ISpatialAudioMetadataItems objects.
     * @param {Pointer} buffer A pointer to memory to use for storage.
     * @param {Integer} bufferLength The length of the supplied buffer. This size must match the length required for the metadata format and maximum metadata item count.
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
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for copying with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open">Open</a> or the object has been closed for writing with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_ATTACH_FAILED_INTERNAL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> was created to use a media pipeline internal buffer, so an external buffer can't be attached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_BUFFER_ALREADY_ATTACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer has already been attached.
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
     * The supplied buffer is not large enough to hold the maximum number of metadata items.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-attachtobuffer
     */
    AttachToBuffer(buffer, bufferLength) {
        result := ComCall(3, this, "ptr", buffer, "uint", bufferLength, "HRESULT")
        return result
    }

    /**
     * Attaches a previously populated buffer for storage of ISpatialAudioMetadataItems objects. The metadata items already in the buffer are retained.
     * @param {Pointer} buffer A pointer to memory to use for storage.
     * @param {Integer} bufferLength The length of the supplied buffer. This size must match the length required for the metadata format and maximum metadata item count.
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
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for copying with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open">Open</a> or the object has been closed for writing with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_BUFFER_ALREADY_ATTACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer has already been attached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_ATTACH_FAILED_INTERNAL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> was created to use a media pipeline internal buffer, so an external buffer can't be attached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied populated buffer uses a format that is different from the current format.
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
     * The supplied buffer is not large enough to hold the maximum number of metadata items. Call <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-getspatialaudiometadataitemsbufferlength">GetSpatialAudioMetadataItemsBufferLength</a> to determine the required buffer size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-attachtopopulatedbuffer
     */
    AttachToPopulatedBuffer(buffer, bufferLength) {
        result := ComCall(4, this, "ptr", buffer, "uint", bufferLength, "HRESULT")
        return result
    }

    /**
     * Detaches the buffer. Memory can only be attached to a single metadata item at a time.
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
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for copying with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open">Open</a> or the object has been closed for writing with a call to <a href="/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_ATTACH_FAILED_INTERNAL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> was created to use a media pipeline internal buffer which can't be detached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_BUFFER_NOT_ATTACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is not attached.
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
     * The supplied buffer is not large enough to hold the maximum number of metadata items.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-detachbuffer
     */
    DetachBuffer() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
