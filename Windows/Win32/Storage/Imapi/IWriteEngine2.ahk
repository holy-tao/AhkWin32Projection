#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDiscRecorder2Ex.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to write a data stream to a device.
 * @remarks
 * 
 * To create the <b>MsftWriteEngine2</b> object in a script, use IMAPI2.MsftWriteEngine2 as the program identifier when calling <b>CreateObject</b>.
 * 
 *  It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iwriteengine2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IWriteEngine2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteEngine2
     * @type {Guid}
     */
    static IID => Guid("{27354135-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteSection", "CancelWrite", "put_Recorder", "get_Recorder", "put_UseStreamingWrite12", "get_UseStreamingWrite12", "put_StartingSectorsPerSecond", "get_StartingSectorsPerSecond", "put_EndingSectorsPerSecond", "get_EndingSectorsPerSecond", "put_BytesPerSector", "get_BytesPerSector", "get_WriteInProgress"]

    /**
     * @type {IDiscRecorder2Ex} 
     */
    Recorder {
        get => this.get_Recorder()
        set => this.put_Recorder(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseStreamingWrite12 {
        get => this.get_UseStreamingWrite12()
        set => this.put_UseStreamingWrite12(value)
    }

    /**
     * @type {Integer} 
     */
    StartingSectorsPerSecond {
        get => this.get_StartingSectorsPerSecond()
        set => this.put_StartingSectorsPerSecond(value)
    }

    /**
     * @type {Integer} 
     */
    EndingSectorsPerSecond {
        get => this.get_EndingSectorsPerSecond()
        set => this.put_EndingSectorsPerSecond(value)
    }

    /**
     * @type {Integer} 
     */
    BytesPerSector {
        get => this.get_BytesPerSector()
        set => this.put_BytesPerSector(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    WriteInProgress {
        get => this.get_WriteInProgress()
    }

    /**
     * Writes a data stream to the current recorder.
     * @param {IStream} data An <b>IStream</b> interface of the data stream to write to the recorder.
     * @param {Integer} startingBlockAddress Starting logical block address (LBA) of the write operation. Negative values are supported.
     * @param {Integer} numberOfBlocks Number of blocks from the data stream to write.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the required memory.
     * 
     * Value: 0x8007000E
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
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_REQUEST_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was canceled.
     * 
     * Value: 0xC0AA0002
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-writesection
     */
    WriteSection(data, startingBlockAddress, numberOfBlocks) {
        result := ComCall(7, this, "ptr", data, "int", startingBlockAddress, "int", numberOfBlocks, "HRESULT")
        return result
    }

    /**
     * Cancels a write operation that is in progress.
     * @returns {HRESULT} The following values are returned on success, but other success codes may be returned as a result of implementation: The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_WRITE_NOT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 'write' operation initiated by the last call to <a href="/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-writesection">IWriteEngine2::WriteSection</a> has not yet begun, and cannot be canceled.   It is recommended to call  <a href="/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-cancelwrite">IWriteEngine2::CancelWrite</a>  until a different success code is returned.
     * 
     * Value: 0x00AA0302L
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure.
     * 
     * Value: 0x80004005
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-cancelwrite
     */
    CancelWrite() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Sets a recording device for the write operation.
     * @param {IDiscRecorder2Ex} value An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2ex">IDiscRecorder2Ex</a> interface that identifies the recording device to use in the write operation.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure.
     * 
     * Value: 0x80004005
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the required memory.
     * 
     * Value: 0x8007000E
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
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_COMMAND_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device failed to accept the command within the timeout period. This may be caused by the device having entered an inconsistent state, or the timeout value for the command may need to be increased.
     * 
     * Value: 0xC0AA020D
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_INVALID_RESPONSE_FROM_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device reported unexpected or invalid data for a command.
     * 
     * Value: 0xC0AA02FF
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_UPSIDE_DOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media is inserted upside down.
     * 
     * Value: 0xC0AA0204
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_BECOMING_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive reported that it is in the process of becoming ready. Please try the request again later.
     * 
     * Value: 0xC0AA0205
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_NO_MEDIA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no media in the device.
     * 
     * Value: 0xC0AA0202
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_FORMAT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media is currently being formatted. Please wait for the format to complete before attempting to use the media.
     * 
     * Value: 0xC0AA0206
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive reported that it is performing a long-running operation, such as finishing a write. The drive may be unusable for a long period of time.
     * 
     * Value: 0xC0AA0207
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_LOSS_OF_STREAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The write failed because the drive did not receive data quickly enough to continue writing. Moving the source data to the local computer, reducing the write speed, or enabling a "buffer underrun free" setting may resolve this issue.
     * 
     * Value: 0xC0AA0300
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_INCOMPATIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media is not compatible or of unknown physical format.
     * 
     * Value: 0xC0AA0203
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_DVD_STRUCTURE_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DVD structure is not present. This may be caused by incompatible drive/medium used.
     * 
     * Value: 0xC0AA020E
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_NO_SUCH_MODE_PAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device reported that the requested mode page (and type) is not present.
     * 
     * Value: 0xC0AA0201
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_INVALID_MODE_PARAMETERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive reported that the combination of parameters provided in the mode page for a MODE SELECT command were not supported.
     * 
     * Value: 0xC0AA0208
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_WRITE_PROTECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive reported that the media is write protected.
     * 
     * Value: 0xC0AA0209
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_MEDIA_SPEED_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media's speed is incompatible with the device. This may be caused by using higher or lower speed media than the range of speeds supported by the device.
     * 
     * Value: 0xC0AA020F
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * Value: 6
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_DEV_NOT_EXIST)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified network resource or device is no longer available.
     * 
     * Value: 55
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_RECORDER_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device associated with this recorder during the last operation has been exclusively locked, causing this operation to failed.
     * 
     * Value: 0xC0AA0210
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the recording device to use in the write operation.
     * @returns {IDiscRecorder2Ex} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2ex">IDiscRecorder2Ex</a> interface that identifies the recording device to use in the write operation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-get_recorder
     */
    get_Recorder() {
        result := ComCall(10, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2Ex(value)
    }

    /**
     * Sets a value that indicates if the write operations use the WRITE12 or WRITE10 command.
     * @param {VARIANT_BOOL} value Set to  VARIANT_TRUE to use the WRITE12 command with the streaming bit set to one when writing to disc. Otherwise, set VARIANT_FALSE to use the WRITE10 command. The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting this property to VARIANT_TRUE is currently not supported.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure.
     * 
     * Value: 0x80004005
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-put_usestreamingwrite12
     */
    put_UseStreamingWrite12(value) {
        result := ComCall(11, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates if the write operations use the WRITE12 or WRITE10 command.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, the write operations use the WRITE12 command with the streaming bit set to one. Otherwise, if VARIANT_FALSE, the write operations use the WRITE10 command.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-get_usestreamingwrite12
     */
    get_UseStreamingWrite12() {
        result := ComCall(12, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the estimated number of sectors per second that the recording device can write to the media at the start of the writing process.
     * @param {Integer} value Approximate number of sectors per second that the recording device can write to the media at the start of the writing process. The default is -1 for maximum speed.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure.
     * 
     * Value: 0x80004005
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
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-put_startingsectorspersecond
     */
    put_StartingSectorsPerSecond(value) {
        result := ComCall(13, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the estimated number of sectors per second that the recording device can write to the media at the start of the writing process.
     * @returns {Integer} Approximate number of sectors per second that the recording device can write to the media at the start of the writing process.
     * 
     * A value of -1 indicates maximum speed.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-get_startingsectorspersecond
     */
    get_StartingSectorsPerSecond() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the estimated number of sectors per second that the recording device can write to the media at the end of the writing process.
     * @param {Integer} value Approximate number of sectors per second that the recording device can write to the media at the end of the writing process. The default is -1 for maximum speed.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure.
     * 
     * Value: 0x80004005
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
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-put_endingsectorspersecond
     */
    put_EndingSectorsPerSecond(value) {
        result := ComCall(15, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the estimated number of sectors per second that the recording device can write to the media at the end of the writing process.
     * @returns {Integer} Approximate number of sectors per second that the recording device can write to the media at the end of the writing process.
     * 
     * A value of -1 indicates maximum speed.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-get_endingsectorspersecond
     */
    get_EndingSectorsPerSecond() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the number of bytes to use for each sector during writing.
     * @param {Integer} value Number of bytes to use for each sector during writing. The minimum size is 1 byte and the maximum is MAXLONG bytes. Typically, this value is 2,048 bytes for CD media, although any arbitrary size is supported (such as 2352 or 2448). This value is limited to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2ex-getmaximumpagealignedtransfersize">IDiscRecorder2Ex::GetMaximumPageAlignedTransferSize</a>, which is typically 65,536 (64K) bytes.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified failure.
     * 
     * Value: 0x80004005
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
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-put_bytespersector
     */
    put_BytesPerSector(value) {
        result := ComCall(17, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of bytes to use for each sector during writing. The returned value indicates what the value previously set with IWriteEngine2::put_BytesPerSector, and does not return a current bytes per sector value for media.
     * @returns {Integer} Number of bytes to use for each sector during writing.
     * 
     * <div class="alert"><b>Note</b>  If <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-put_bytespersector">IWriteEngine2::put_BytesPerSector</a> has not been called, this parameter will indicate a value of  '-1'.
     * </div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-get_bytespersector
     */
    get_BytesPerSector() {
        result := ComCall(18, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a value that indicates whether the recorder is currently writing data to the disc.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, the recorder is currently writing data to the disc. Otherwise, if VARIANT_FALSE, the recorder is not currently writing to disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2-get_writeinprogress
     */
    get_WriteInProgress() {
        result := ComCall(19, this, "short*", &value := 0, "HRESULT")
        return value
    }
}
