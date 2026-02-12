#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscRecorder2.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to erase data from a disc.
 * @remarks
 * To create the <b>MsftDiscFormat2Erase</b> object in a script, use IMAPI2.MsftDiscFormat2Erase as the program identifier when calling <b>CreateObject</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nn-imapi2-idiscformat2erase
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2Erase extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2Erase
     * @type {Guid}
     */
    static IID => Guid("{27354156-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Recorder", "get_Recorder", "put_FullErase", "get_FullErase", "get_CurrentPhysicalMediaType", "put_ClientName", "get_ClientName", "EraseMedia"]

    /**
     * @type {IDiscRecorder2} 
     */
    Recorder {
        get => this.get_Recorder()
        set => this.put_Recorder(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FullErase {
        get => this.get_FullErase()
        set => this.put_FullErase(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentPhysicalMediaType {
        get => this.get_CurrentPhysicalMediaType()
    }

    /**
     * @type {BSTR} 
     */
    ClientName {
        get => this.get_ClientName()
        set => this.put_ClientName(value)
    }

    /**
     * Sets the recording device to use in the erase operation.
     * @remarks
     * The recorder must be compatible with the format defined by this  interface. To determine compatibility, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-isrecordersupported">IDiscFormat2::IsRecorderSupported</a> method.
     * @param {IDiscRecorder2} value An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device to use in the erase operation.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the recording device to use in the erase operation.
     * @returns {IDiscRecorder2} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device to use in the erase operation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-get_recorder
     */
    get_Recorder() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDiscRecorder2(value)
    }

    /**
     * Determines the quality of the disc erasure. (Put)
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE to fully erase the disc by overwriting the  entire medium at least once. 
     * 
     * Set to VARIANT_FALSE to overwrite the directory tracks, but not the entire disc. This option requires less time to perform than the full erase option. 
     * 
     * The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-put_fullerase
     */
    put_FullErase(value) {
        result := ComCall(14, this, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines the quality of the disc erasure. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the erase operation fully erases the disc by overwriting the  entire medium at least once. 
     * 
     * Is VARIANT_FALSE if the erase operation overwrites the  directory tracks, but not the entire disc. This option requires less time to perform than the full erase option.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-get_fullerase
     */
    get_FullErase() {
        result := ComCall(15, this, "short*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the type of media in the disc device. (IDiscFormat2Erase.get_CurrentPhysicalMediaType)
     * @returns {Integer} Type of media in the disc device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the friendly name of the client. (IDiscFormat2Erase.put_ClientName)
     * @remarks
     * The name is used when the write operation requests exclusive access to the device. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-get_exclusiveaccessowner">IDiscRecorder2::get_ExclusiveAccessOwner</a> property contains the name of the client that has the lock.
     * 
     * Because any application with read/write access to the CDROM device during the erase operation can use the IOCTL_CDROM_EXCLUSIVE_ACCESS (query) control code (see the Microsoft Windows Driver Development Kit (DDK)) to access the name, it is important that the name identify the program that is using this interface to erase to the media. The name is restricted to the same character set as required by the IOCTL_CDROM_EXCLUSIVE_ACCESS control code.
     * @param {BSTR} value Name of the client application.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-put_clientname
     */
    put_ClientName(value) {
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the friendly name of the client. (IDiscFormat2Erase.get_ClientName)
     * @returns {BSTR} Name of the client application.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-get_clientname
     */
    get_ClientName() {
        value := BSTR()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Erases the media in the active disc recorder.
     * @remarks
     * Synchronously erases the media.  Progress can be reported by calling into registered events of type <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscformat2eraseevents">DDiscFormat2EraseEvents</a>.
     * 
     * Before calling this method, you must call the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2erase-put_recorder">IDiscFormat2Erase::put_Recorder</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2erase-put_clientname">IDiscFormat2Erase::put_ClientName</a>
     * </li>
     * </ul>
     * You should also consider calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2erase-put_fullerase">IDiscFormat2Erase::put_FullErase</a> method if its default value is not appropriate for your application.
     * 
     * This method is synchronous. To determine the progress of the erase operation, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscformat2eraseevents">DDiscFormat2EraseEvents</a> interface. For examples that show how to implement an event handler in a script, see <a href="https://docs.microsoft.com/windows/desktop/imapi/monitoring-progress-with-events">Monitoring Progress With Events</a>.
     * 
     * Currently, the E_IMAPI_ERASE_TOOK_LONGER_THAN_ONE_HOUR value is returned if an attempt to perform an erase on CD-RW or DVD-RW media via the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2erase">IDiscFormat2Erase</a> interface fails as a result of the media being bad or a drive failure.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_ERASE_MEDIA_IS_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media type is unsupported.
     * 
     * Value: 0xC0AA0909
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_ERASE_DRIVE_FAILED_SPINUP_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive returned an error for a START UNIT (spinup) command.  Manual intervention may be required.
     * 
     * Value: 0x80AA0908
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_ERASE_TOOK_LONGER_THAN_ONE_HOUR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive did not complete the erase in one hour.  The drive may require a power cycle, media removal, or other manual intervention to resume proper operation.
     * 
     * <div class="alert"><b>Note</b>  Currently, this value will also be returned if an attempt to perform an erase on CD-RW or DVD-RW media via the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2erase">IDiscFormat2Erase</a> interface fails as a result of the media being bad.</div>
     * <div> </div>
     * Value: 0x80AA0906
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-idiscformat2erase-erasemedia
     */
    EraseMedia() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
