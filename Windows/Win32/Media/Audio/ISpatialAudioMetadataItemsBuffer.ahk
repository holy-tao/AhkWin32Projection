#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for attaching buffers to SpatialAudioMetadataItems for in-place storage of data.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitemsbuffer
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioMetadataItemsBuffer extends IUnknown {
    /**
     * The interface identifier for ISpatialAudioMetadataItemsBuffer
     * @type {Guid}
     */
    static IID := Guid("{42640a16-e1bd-42d9-9ff6-031ab71a2dba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioMetadataItemsBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AttachToBuffer          : IntPtr
        AttachToPopulatedBuffer : IntPtr
        DetachBuffer            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioMetadataItemsBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Attaches caller-provided memory for storage of ISpatialAudioMetadataItems objects.
     * @param {Integer} _buffer A pointer to memory to use for storage.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for copying with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> was created to use a media pipeline internal buffer, so an external buffer can't be attached.
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
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-attachtobuffer
     */
    AttachToBuffer(_buffer, bufferLength) {
        result := ComCall(3, this, "ptr", _buffer, "uint", bufferLength, "HRESULT")
        return result
    }

    /**
     * Attaches a previously populated buffer for storage of ISpatialAudioMetadataItems objects. The metadata items already in the buffer are retained.
     * @param {Integer} _buffer A pointer to memory to use for storage.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for copying with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> was created to use a media pipeline internal buffer, so an external buffer can't be attached.
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
     * The supplied buffer is not large enough to hold the maximum number of metadata items. Call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-getspatialaudiometadataitemsbufferlength">GetSpatialAudioMetadataItemsBufferLength</a> to determine the required buffer size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-attachtopopulatedbuffer
     */
    AttachToPopulatedBuffer(_buffer, bufferLength) {
        result := ComCall(4, this, "ptr", _buffer, "uint", bufferLength, "HRESULT")
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for copying with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatacopier-close">Close</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> was created to use a media pipeline internal buffer which can't be detached.
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
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-detachbuffer
     */
    DetachBuffer() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpatialAudioMetadataItemsBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AttachToBuffer := CallbackCreate(GetMethod(implObj, "AttachToBuffer"), flags, 3)
        this.vtbl.AttachToPopulatedBuffer := CallbackCreate(GetMethod(implObj, "AttachToPopulatedBuffer"), flags, 3)
        this.vtbl.DetachBuffer := CallbackCreate(GetMethod(implObj, "DetachBuffer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AttachToBuffer)
        CallbackFree(this.vtbl.AttachToPopulatedBuffer)
        CallbackFree(this.vtbl.DetachBuffer)
    }
}
