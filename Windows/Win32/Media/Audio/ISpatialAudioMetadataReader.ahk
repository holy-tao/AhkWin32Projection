#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISpatialAudioMetadataItems.ahk" { ISpatialAudioMetadataItems }

/**
 * Provides methods for extracting spatial audio metadata items and item command value pairs from an ISpatialAudioMetadataItems object.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioMetadataReader extends IUnknown {
    /**
     * The interface identifier for ISpatialAudioMetadataReader
     * @type {Guid}
     */
    static IID := Guid("{b78e86a2-31d9-4c32-94d2-7df40fc7ebec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioMetadataReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Open                : IntPtr
        ReadNextItem        : IntPtr
        ReadNextItemCommand : IntPtr
        Close               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioMetadataReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * <b>Open</b> has already been called on the supplied <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> since the object was created or since the last call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close">Close</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * Gets the number of commands and the sample offset for the metadata item being read.
     * @remarks
     * Before calling <b>ReadNextItem</b>, you must open the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader">ISpatialAudioMetadataReader</a> for reading by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a> after the object is created and after <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/ispatialaudiometadatawriter-close">Close</a> has been called. You must also call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt798194(v=vs.85)">ReadItemCountInFrames</a> before calling <b>ReadNextItem</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader">ISpatialAudioMetadataReader</a> keeps an internal pointer to the current position within the total range of frames contained by the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> with which the reader is associated. Each call to this method causes the pointer to be advanced by the number of frames specified in the <i>readFrameCount</i> parameter.
     * 
     * The process for reading commands and the associated values is recursive. After each call to <b>ReadItemCountInFrames</b>, call <b>ReadNextItem</b> to get the number of commands in the next item. After every call to <b>ReadNextItem</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitemcommand">ReadNextItemCommand</a> to read each command for the  item. Repeat this process until the entire frame range of the <b>ISpatialAudioMetadataItems</b> has been read.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for reading with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close">Close</a>.
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
     * There are no more metadata items in the frame range specified in the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt798194(v=vs.85)">ReadItemCountInFrames</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitem
     */
    ReadNextItem(commandCount, frameOffset) {
        commandCountMarshal := commandCount is VarRef ? "char*" : "ptr"
        frameOffsetMarshal := frameOffset is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, commandCountMarshal, commandCount, frameOffsetMarshal, frameOffset, "HRESULT")
        return result
    }

    /**
     * Reads metadata commands and value data for the current item.
     * @remarks
     * Before calling <b>ReadNextItem</b>, you must open the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader">ISpatialAudioMetadataReader</a> for reading by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a> after the object is created and after <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/ispatialaudiometadatawriter-close">Close</a> has been called. You must also call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt798194(v=vs.85)">ReadItemCountInFrames</a> and then call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitem">ReadNextItem</a> before calling <b>ReadNextItem</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader">ISpatialAudioMetadataReader</a> keeps an internal pointer to the current position within the total range of frames contained by the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> with which the reader is associated. Each call to this method causes the pointer to be advanced by the number of frames specified in the <i>readFrameCount</i> parameter.
     * 
     * The process for reading commands and the associated values is recursive. After each call to <b>ReadItemCountInFrames</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitem">ReadNextItem</a> to get the number of commands in the next item. After every call to <b>ReadNextItem</b>, call <b>ReadNextItemCommand</b> to read each command for the  item. Repeat this process until the entire frame range of the <b>ISpatialAudioMetadataItems</b> has been read.
     * @param {Pointer<Integer>} commandID Receives the command ID for the current command.
     * @param {Integer} valueBuffer A pointer to a buffer which receives data specific to the command as specified by the
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for reading with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close">Close</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitemcommand
     */
    ReadNextItemCommand(commandID, valueBuffer, maxValueBufferLength, valueBufferLength) {
        commandIDMarshal := commandID is VarRef ? "char*" : "ptr"
        valueBufferLengthMarshal := valueBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, commandIDMarshal, commandID, "ptr", valueBuffer, "uint", maxValueBufferLength, valueBufferLengthMarshal, valueBufferLength, "HRESULT")
        return result
    }

    /**
     * Completes any necessary operations on the SpatialAudioMetadataItems object and releases the object. (ISpatialAudioMetadataReader.Close)
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for reading with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close">Close</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpatialAudioMetadataReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 2)
        this.vtbl.ReadNextItem := CallbackCreate(GetMethod(implObj, "ReadNextItem"), flags, 3)
        this.vtbl.ReadNextItemCommand := CallbackCreate(GetMethod(implObj, "ReadNextItemCommand"), flags, 5)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.ReadNextItem)
        CallbackFree(this.vtbl.ReadNextItemCommand)
        CallbackFree(this.vtbl.Close)
    }
}
