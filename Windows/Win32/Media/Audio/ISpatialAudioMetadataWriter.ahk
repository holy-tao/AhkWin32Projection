#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for storing spatial audio metadata items positioned within a range of corresponding audio frames.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioMetadataWriter
     * @type {Guid}
     */
    static IID => Guid("{1b17ca01-2955-444d-a430-537dc589a844}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "WriteNextItem", "WriteNextItemCommand", "Close"]

    /**
     * Opens an ISpatialAudioMetadataItems object for writing.
     * @param {ISpatialAudioMetadataItems} metadataItems A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object to be opened for writing.
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
     * <b>Open</b> has already been called on the supplied <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> since the object was created or since the last call to <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/ispatialaudiometadatawriter-close">Close</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * Starts a new metadata item at the specified offset.
     * @remarks
     * Before calling <b>WriteNextItem</b>, you must open the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter">ISpatialAudioMetadataWriter</a> for writing by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a> after the object is created and after <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/ispatialaudiometadatawriter-close">Close</a> has been called. During a writing session demarcated by calls to <b>Open</b> and <b>Close</b>, the value of the <i>frameOffset</i> parameter must be greater than the value in the preceding call.  
     * 
     * Within a single writing session, you must not use <b>WriteNextItem</b> to write more items than the value supplied in the <b>MaxMetadataItemCount</b> field in the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/ns-spatialaudiometadata-spatialaudioobjectrenderstreamformetadataactivationparams">SpatialAudioObjectRenderStreamForMetadataActivationParam</a> passed into <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a> or an SPTLAUD_MD_CLNT_E_FRAMEOFFSET_OUT_OF_RANGE error will occur. 
     * 
     * If the overflow mode is set to <b>SpatialAudioMetadataWriterOverflow_Fail</b>, the value of the <i>frameOffset</i> parameter must be less than he value of the <i>frameCount</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems">ActivateSpatialAudioMetadataItems</a> or an SPTLAUD_MD_CLNT_E_FRAMEOFFSET_OUT_OF_RANGE error will occur.
     * 
     * After calling <b>WriteNextItem</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitemcommand">WriteNextItemCommand</a> to write metadata commands and value data for the item.
     * @param {Integer} frameOffset The frame offset of the item within the range specified with the <i>frameCount</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems">ActivateSpatialAudioMetadataItems</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/ispatialaudiometadatawriter-close">Close</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_FRAMEOFFSET_OUT_OF_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of items written in the writing session is greater than the value supplied in the <b>MaxMetadataItemCount</b> field in the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/ns-spatialaudiometadata-spatialaudioobjectrenderstreamformetadataactivationparams">SpatialAudioObjectRenderStreamForMetadataActivationParam</a> passed into <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a>. 
     * 
     * The <i>frameCount</i> value is greater than the value of the <i>frameCount</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems">ActivateSpatialAudioMetadataItems</a> and the overflow mode was set to  <b>SpatialAudioMetadataWriterOverflow_Fail</b>.
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
     * The value of <i>frameOffset</i> is not greater than the value provided  in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitem">WriteNextItem</a> within the same writing session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitem
     */
    WriteNextItem(frameOffset) {
        result := ComCall(4, this, "ushort", frameOffset, "HRESULT")
        return result
    }

    /**
     * Writes metadata commands and value data to the current item.
     * @remarks
     * You must open the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter">ISpatialAudioMetadataWriter</a> for writing by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a>, and set the current metadata item offset by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitem">WriteNextItem</a> before calling <b>WriteNextItemCommand</b>.
     * @param {Integer} commandID A command supported by the metadata format of the  object.  The call will fail if the command not defined by metadata format. Each command can
     * only be written once per item.
     * @param {Pointer} valueBuffer A pointer to a buffer which stores data specific to the command as specified by the
     * metadata format definition.
     * @param {Integer} valueBufferLength The size, in bytes, of the command data supplied in the  <i>valueBuffer</i> parameter.  The size must match command definition specified by the metadata format or the call will fail.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> has not been opened for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a> or the object has been closed for writing with a call to <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/ispatialaudiometadatawriter-close">Close</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUD_MD_CLNT_E_NO_ITEMOFFSET_WRITTEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitem">WriteNextItem</a> was not called after <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open">Open</a> was called and before the call to <b>WriteNextItemCommand</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitemcommand
     */
    WriteNextItemCommand(commandID, valueBuffer, valueBufferLength) {
        result := ComCall(5, this, "char", commandID, "ptr", valueBuffer, "uint", valueBufferLength, "HRESULT")
        return result
    }

    /**
     * Completes any needed operations on the metadata buffer and releases the specified ISpatialAudioMetadataItems object.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                                                     | Description                                                                                                                                                                   |
     * |---------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**SPTLAUD\_MD\_CLNT\_E\_NO\_ITEMS\_OPEN**</dt> </dl>            | The supplied [**ISpatialAudioMetadataItems**](/windows/desktop/api/SpatialAudioMetadata/nn-spatialaudiometadata-ispatialaudiometadataitems) has not been opened with a call to [**Open**](/windows/desktop/api/SpatialAudioMetadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open).<br/> |
     * | <dl> <dt>**SPTLAUD\_MD\_CLNT\_E\_NO\_ITEMS\_WRITTEN**</dt> </dl>         | No metadata items have been written to the supplied [**ISpatialAudioMetadataItems**](/windows/desktop/api/SpatialAudioMetadata/nn-spatialaudiometadata-ispatialaudiometadataitems).<br/>                                              |
     * | <dl> <dt>**SPTLAUD\_MD\_CLNT\_E\_ITEM\_MUST\_HAVE\_COMMANDS**</dt> </dl> | No metadata commands have been written to the supplied [**ISpatialAudioMetadataItems**](/windows/desktop/api/SpatialAudioMetadata/nn-spatialaudiometadata-ispatialaudiometadataitems).<br/>                                           |
     * @see https://learn.microsoft.com/windows/win32/CoreAudio/ispatialaudiometadatawriter-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
