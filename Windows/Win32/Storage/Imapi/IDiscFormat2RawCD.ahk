#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscRecorder2.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to write raw images to a disc device using Disc At Once (DAO) mode (also known as uninterrupted recording).
 * @remarks
 * To create the <b>MsftDiscFormat2RawCD</b> object in a script, use IMAPI2.MsftDiscFormat2RawCD as the program identifier when calling <b>CreateObject</b>.
 * 
 * It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-idiscformat2rawcd
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2RawCD extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2RawCD
     * @type {Guid}
     */
    static IID => Guid("{27354155-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareMedia", "WriteMedia", "WriteMedia2", "CancelWrite", "ReleaseMedia", "SetWriteSpeed", "put_Recorder", "get_Recorder", "put_BufferUnderrunFreeDisabled", "get_BufferUnderrunFreeDisabled", "get_StartOfNextSession", "get_LastPossibleStartOfLeadout", "get_CurrentPhysicalMediaType", "get_SupportedSectorTypes", "put_RequestedSectorType", "get_RequestedSectorType", "put_ClientName", "get_ClientName", "get_RequestedWriteSpeed", "get_RequestedRotationTypeIsPureCAV", "get_CurrentWriteSpeed", "get_CurrentRotationTypeIsPureCAV", "get_SupportedWriteSpeeds", "get_SupportedWriteSpeedDescriptors"]

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
    BufferUnderrunFreeDisabled {
        get => this.get_BufferUnderrunFreeDisabled()
        set => this.put_BufferUnderrunFreeDisabled(value)
    }

    /**
     * @type {Integer} 
     */
    StartOfNextSession {
        get => this.get_StartOfNextSession()
    }

    /**
     * @type {Integer} 
     */
    LastPossibleStartOfLeadout {
        get => this.get_LastPossibleStartOfLeadout()
    }

    /**
     * @type {Integer} 
     */
    CurrentPhysicalMediaType {
        get => this.get_CurrentPhysicalMediaType()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedSectorTypes {
        get => this.get_SupportedSectorTypes()
    }

    /**
     * @type {Integer} 
     */
    RequestedSectorType {
        get => this.get_RequestedSectorType()
        set => this.put_RequestedSectorType(value)
    }

    /**
     * @type {BSTR} 
     */
    ClientName {
        get => this.get_ClientName()
        set => this.put_ClientName(value)
    }

    /**
     * @type {Integer} 
     */
    RequestedWriteSpeed {
        get => this.get_RequestedWriteSpeed()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RequestedRotationTypeIsPureCAV {
        get => this.get_RequestedRotationTypeIsPureCAV()
    }

    /**
     * @type {Integer} 
     */
    CurrentWriteSpeed {
        get => this.get_CurrentWriteSpeed()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    CurrentRotationTypeIsPureCAV {
        get => this.get_CurrentRotationTypeIsPureCAV()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedWriteSpeeds {
        get => this.get_SupportedWriteSpeeds()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedWriteSpeedDescriptors {
        get => this.get_SupportedWriteSpeedDescriptors()
    }

    /**
     * Locks the current media for exclusive access. (IDiscFormat2RawCD.PrepareMedia)
     * @remarks
     * Before calling this method, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-put_clientname">IDiscFormat2RawCD::put_ClientName</a> method. 
     * 
     * Also, you must call the <b>IDiscFormat2RawCD::PrepareMedia</b> method before calling either the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia">IDiscFormat2RawCD::WriteMedia</a> or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia2">IDiscFormat2RawCD::WriteMedia2</a> method. 
     * 
     * After the write is complete or you cancel the write operation, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-releasemedia">IDiscFormat2RawCD::ReleaseMedia</a> method to release the lock.
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
     * <dt><b>E_IMAPI_DF2RAW_NO_RECORDER_SPECIFIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot prepare the media until you choose a recorder to use.
     * 
     * Value: 0xC0AA060A
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is not valid when media has been "prepared" but not released.
     * 
     * Value: 0xC0AA0603
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
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only blank CD-R/RW media is supported.
     * 
     * Value: 0xC0AA0606
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only blank CD-R/RW media is supported.
     * 
     * Value: 0xC0AA0607
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client name is not valid.
     * 
     * Value: 0xC0AA0604
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_ROTATIONADJUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested rotation type was not supported by the drive and the rotation type was adjusted.
     * 
     * Value: 0x00AA0005
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_SPEEDADJUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested write speed was not supported by the drive and the speed was adjusted.
     * 
     * Value: 0x00AA0004
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_BOTHADJUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested write speed and rotation type were not supported by the drive and they were both adjusted.
     * 
     * Value: 0x00AA0006
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-preparemedia
     */
    PrepareMedia() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Writes a DAO-96 raw image to the blank media using MSF 95:00:00 as the starting address.
     * @remarks
     * Before calling this method, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-put_recorder">IDiscFormat2RawCD::put_Recorder</a> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-preparemedia">IDiscFormat2RawCD::PrepareMedia</a> methods.
     * 
     * You should also consider calling the following methods if their default values are not appropriate for your application:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-put_bufferunderrunfreedisabled">IDiscFormat2RawCD::put_BufferUnderrunFreeDisabled</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-put_clientname">IDiscFormat2RawCD::put_ClientName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-put_requestedsectortype">IDiscFormat2RawCD::put_RequestedSectorType</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-setwritespeed">IDiscFormat2RawCD::SetWriteSpeed</a>
     * </li>
     * </ul>
     * This method is synchronous. To determine the progress of the write operation, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscformat2rawcdevents">DDiscFormat2RawCDEvents</a> interface. For examples that show how to implement an event handler in a script, see <a href="https://docs.microsoft.com/windows/desktop/imapi/monitoring-progress-with-events">Monitoring Progress With Events</a>.
     * 
     * The first sector of the raw image is written at MSF 95:00:00. If your RAW image has a different first sector, please use the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia2">IDiscFormat2RawCD::WriteMedia2</a> method.
     * 
     * This method uses the <b>IStream::Seek</b> method to reach the appropriate starting location in the image for the current media. If the <b>IStream::Seek</b> method fails, the method will call the <b>IStream::Read</b> method repeatedly until reaching the starting sector.
     * 
     * The DAO-96 standard allows writing of any type of data to CD media. One common usage is to write audio CDs without a 2-second gap between tracks.
     * 
     * DAO-96 also supports variations in the subcode content, such as CD+G and CD-Text.
     * @param {IStream} data An <b>IStream</b> interface of the data stream to write.
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
     * <dt><b>E_IMAPI_DF2RAW_STREAM_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided audio stream is not valid.
     * 
     * Value: 0xC0AA060D
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is only valid when media has been "prepared".
     * 
     * Value: 0xC0AA0602
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only blank CD-R/RW media is supported.
     * 
     * Value: 0xC0AA0606
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_STREAM_LEADIN_TOO_SHORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream does not contain a sufficient number of sectors in the leadin for the current media.
     * 
     * Value: 0xC0AA060F
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
     * <dt><b>E_IMAPI_DF2RAW_NOT_ENOUGH_SPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough space on the media to add the provided session.
     * 
     * Value: 0xC0AA0609
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia
     */
    WriteMedia(data) {
        result := ComCall(13, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Writes a DAO-96 raw image to the blank media using a specified starting address.
     * @remarks
     * This method is identical in function to the <b>IDiscFormat2RawCD::WriteMedia</b> method, except that it allows for a starting time other than 95:00:00. For details, please see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia">IDiscFormat2RawCD::WriteMedia</a> method.
     * @param {IStream} data An <b>IStream</b> interface of the data stream to write.
     * @param {Integer} streamLeadInSectors Starting address at which to begin writing the data stream.
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
     * <dt><b>E_IMAPI_DF2RAW_STREAM_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided audio stream is not valid.
     * 
     * Value: 0xC0AA060D
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is only valid when media has been "prepared".
     * 
     * Value: 0xC0AA0602
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only blank CD-R/RW media is supported.
     * 
     * Value: 0xC0AA0606
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_STREAM_LEADIN_TOO_SHORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream does not contain a sufficient number of sectors in the leadin for the current media.
     * 
     * Value: 0xC0AA060F
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
     * <dt><b>E_IMAPI_DF2RAW_NOT_ENOUGH_SPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia2
     */
    WriteMedia2(data, streamLeadInSectors) {
        result := ComCall(14, this, "ptr", data, "int", streamLeadInSectors, "HRESULT")
        return result
    }

    /**
     * Cancels the current write operation. (IDiscFormat2RawCD.CancelWrite)
     * @remarks
     * To cancel the write operation, you must call this method from the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-ddiscformat2rawcdevents-update">DDiscFormat2RawCDEvents::Update</a> event handler that you implemented. 
     * 
     * You must also call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-releasemedia">IDiscFormat2RawCD::ReleaseMedia</a> method after calling this method.
     * 
     * Note that calling this method does not immediately cancel the write operation on all media due to media-specific requirements. For example, when writing to a CD, the write operation can continue for up to three more minutes.
     * 
     * This method leaves the media in an indeterminate state. For rewriteable media, you should call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2erase-erasemedia">IDiscFormat2Erase::EraseMedia</a> method after calling this method to prepare the media for future use.
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
     * <dt><b>E_IMAPI_DF2RAW_WRITE_NOT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no write operation currently in progress.
     * 
     * Value: 0xC0AA0601
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-cancelwrite
     */
    CancelWrite() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Closes a Disc-At-Once (DAO) writing session of a raw image and releases the lock.
     * @remarks
     * This method release the lock set when you called the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-preparemedia">IDiscFormat2RawCD::PrepareMedia</a> method. You must call this method after the write operation completes or after calling <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-cancelwrite">IDiscFormat2RawCD::CancelWrite</a> to cancel a writing operation.
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
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is only valid when media has been "prepared".
     * 
     * Value: 0xC0AA0602
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-releasemedia
     */
    ReleaseMedia() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Sets the write speed of the disc recorder. (IDiscFormat2RawCD.SetWriteSpeed)
     * @remarks
     * This method sets the write speed and type of rotational-speed control for a recorder. Requested values might differ from the values set in the recorder. To specify the recorder, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-put_recorder">IDiscFormat2RawCD::put_Recorder</a> method. 
     * 
     * If the recorder supports the requested write speed,  the disc device uses the requested value. If the recorder does not support the requested write speed,  the recorder uses a write speed that it does support that is closest to the requested value. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentwritespeed">IDiscFormat2RawCD::get_CurrentWriteSpeed</a> property contains the value used by the recorder.
     * 
     * To retrieve a list of the write speeds that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeds">IDiscFormat2RawCD::get_SupportedWriteSpeeds</a> method.
     * 
     * If you request constant angular velocity (CAV) for rotational-speed control type and the recorder does not support CAV,  the disc device uses another type of rotational-speed control type that it supports. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentrotationtypeispurecav">IDiscFormat2RawCD::get_CurrentRotationTypeIsPureCAV</a> property indicates the value used by the recorder.
     * 
     * To retrieve the requested values, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedwritespeed">IDiscFormat2RawCD::get_RequestedWriteSpeed</a> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedrotationtypeispurecav">IDiscFormat2RawCD::get_RequestedRotationTypeIsPureCAV</a> methods.
     * @param {Integer} RequestedSectorsPerSecond Requested write speed measured in disc sectors per second.
     * 
     * A value of 0xFFFFFFFF (-1) requests that the write occurs using the fastest supported speed for the media.  This is the default.
     * @param {VARIANT_BOOL} RotationTypeIsPureCAV Requested rotational-speed control type. Set to VARIANT_TRUE to request constant angular velocity (CAV)  rotational-speed control type. Set to VARIANT_FALSE to use another rotational-speed control type that the recorder supports. The default is VARIANT_FALSE.
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
     * <dt><b>E_IMAPI_RECORDER_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request requires a current disc recorder to be selected.
     * 
     * Value: 0xC0AA0003
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
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only blank CD-R/RW media is supported.
     * 
     * Value: 0xC0AA0606
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only blank CD-R/RW media is supported.
     * 
     * Value: 0xC0AA0607
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client name is not valid.
     * 
     * Value: 0xC0AA0604
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_ROTATIONADJUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested rotation type was not supported by the drive and the rotation type was adjusted.
     * 
     * Value: 0x00AA0005
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_SPEEDADJUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested write speed was not supported by the drive and the speed was adjusted.
     * 
     * Value: 0x00AA0004
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_IMAPI_BOTHADJUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested write speed and rotation type were not supported by the drive and they were both adjusted.
     * 
     * Value: 0x00AA0006
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-setwritespeed
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(17, this, "int", RequestedSectorsPerSecond, "short", RotationTypeIsPureCAV, "HRESULT")
        return result
    }

    /**
     * Sets the recording device to use for the write operation. (IDiscFormat2RawCD.put_Recorder)
     * @remarks
     * The recorder must be compatible with the format defined by this  interface. To determine compatibility, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-isrecordersupported">IDiscFormat2::IsRecorderSupported</a> method.
     * @param {IDiscRecorder2} value An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device to use in the write operation.
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
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is not valid when media has been "prepared" but not released.
     * 
     * Value:0xC0AA0603
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_RECORDER_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This device does not support the operations required by this disc format.
     * 
     * Value: 0xC0AA050E
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(18, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the recording device to use for the write operation. (IDiscFormat2RawCD.get_Recorder)
     * @returns {IDiscRecorder2} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device to use in the write operation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_recorder
     */
    get_Recorder() {
        result := ComCall(19, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2(value)
    }

    /**
     * Determines if Buffer Underrun Free recording is enabled. (IDiscFormat2RawCD.put_BufferUnderrunFreeDisabled)
     * @remarks
     * Buffer underrun can be an issue if the data stream does not enter the buffer fast enough to keep the device continuously writing. In turn, the stop and start action of writing can cause data on the disc to be unusable. Buffer Underrun Free (BUF) recording allows the laser to start and stop without damaging data already written to the disc. Disabling of BUF recording is possible only on CD-R/RW media.
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE to disable Buffer Underrun Free recording; otherwise, VARIANT_FALSE. The default is VARIANT_FALSE (enabled).
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
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is only valid when media has been "prepared".
     * 
     * Value: 0xC0AA0602
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_bufferunderrunfreedisabled
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(20, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if Buffer Underrun Free recording is enabled. (IDiscFormat2RawCD.get_BufferUnderrunFreeDisabled)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if Buffer Underrun Free recording is disabled; otherwise, VARIANT_FALSE (enabled).
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled() {
        result := ComCall(21, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the first sector of the next session.
     * @remarks
     * The client application that creates an image must provide appropriately sized lead-in and lead-out data. The application developer using the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2rawcd">IDiscFormat2RawCD</a> interface must understand the formats of lead-in and lead-out for the first and subsequent sessions. Note that lead-in LBA for the first session is negative.
     * @returns {Integer} Sector number for the start of the next write operation.  This value can be negative for blank media.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_startofnextsession
     */
    get_StartOfNextSession() {
        result := ComCall(22, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last possible starting position for the leadout area.
     * @returns {Integer} Sector address of the starting position for the leadout area.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_lastpossiblestartofleadout
     */
    get_LastPossibleStartOfLeadout() {
        result := ComCall(23, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the type of media in the disc device. (IDiscFormat2RawCD.get_CurrentPhysicalMediaType)
     * @returns {Integer} Type of media in the disc device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType() {
        result := ComCall(24, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the supported data sector types for the current recorder.
     * @returns {Pointer<SAFEARRAY>} List of data sector types for the current recorder. Each element of the list is a <b>VARIANT</b> of type <b>VT_UI4</b>. The <b>ulVal</b> member of the variant contains the data sector type. 
     * 
     * For a list of values of supported sector types, see <a href="https://docs.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type">IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedsectortypes
     */
    get_SupportedSectorTypes() {
        result := ComCall(25, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the requested data sector to use for writing the stream.
     * @remarks
     * For a list of supported data sector types, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedsectortypes">IDiscFormat2RawCD::get_SupportedSectorTypes</a> method.
     * @param {Integer} value Data sector to use for writing the stream. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type">IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE</a> enumeration type. The default is <b>IMAPI_FORMAT2_RAW_CD_SUBCODE_IS_COOKED</b>.
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
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is only valid when media has been "prepared".
     * 
     * Value: 0xC0AA0602
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_DATA_BLOCK_TYPE_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested data block type is not supported by the current device.
     * 
     * Value: 0xC0AA060E
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_requestedsectortype
     */
    put_RequestedSectorType(value) {
        result := ComCall(26, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the requested data sector to use during write of the stream.
     * @returns {Integer} Requested data sector type. For possible values, see <a href="https://docs.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_raw_cd_data_sector_type">IMAPI_FORMAT2_RAW_CD_DATA_SECTOR_TYPE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedsectortype
     */
    get_RequestedSectorType() {
        result := ComCall(27, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the friendly name of the client. (IDiscFormat2RawCD.put_ClientName)
     * @remarks
     * The name is used when the write operation requests exclusive access to the device. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-get_exclusiveaccessowner">IDiscRecorder2::get_ExclusiveAccessOwner</a> property contains the name of the client that has the lock.
     * 
     * Because any application with read/write access to the CDROM device during the write operation can use the IOCTL_CDROM_EXCLUSIVE_ACCESS (query) control code (see the Microsoft Windows Driver Development Kit (DDK)) to access the name, it is important that the name identify the program that is using this interface to write to the media. The name is restricted to the same character set as required by the IOCTL_CDROM_EXCLUSIVE_ACCESS control code.
     * @param {BSTR} value Name of the client application. Cannot be <b>NULL</b> or an empty string.
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
     * <dt><b>E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client name is not valid.
     * 
     * Value: 0xC0AA0604
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0600
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2RAW_MEDIA_IS_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation is not valid when media has been "prepared" but not released.
     * 
     * Value: 0xC0AA0603
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(28, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the friendly name of the client. (IDiscFormat2RawCD.get_ClientName)
     * @returns {BSTR} Name supplied by the client application.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_clientname
     */
    get_ClientName() {
        value := BSTR()
        result := ComCall(29, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Retrieves the requested write speed. (IDiscFormat2RawCD.get_RequestedWriteSpeed)
     * @remarks
     * This is the value specified in the most recent call to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-setwritespeed">IDiscFormat2RawCD::SetWriteSpeed</a> method.
     * @returns {Integer} Requested write speed measured in disc sectors per second.
     * 
     * A value of 0xFFFFFFFF (-1) requests that the write occurs using the fastest supported speed for the media.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedwritespeed
     */
    get_RequestedWriteSpeed() {
        result := ComCall(30, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the requested rotational-speed control type. (IDiscFormat2RawCD.get_RequestedRotationTypeIsPureCAV)
     * @remarks
     * This is the value specified in the most recent call to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-setwritespeed">IDiscFormat2RawCD::SetWriteSpeed</a> method.
     * @returns {VARIANT_BOOL} Requested rotational-speed control type. Is VARIANT_TRUE for constant angular velocity (CAV)  rotational-speed control type. Otherwise, is VARIANT_FALSE for any other rotational-speed control type that the recorder supports.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV() {
        result := ComCall(31, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the drive's current write speed. (IDiscFormat2RawCD.get_CurrentWriteSpeed)
     * @remarks
     * To retrieve the requested write speed, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedwritespeed">IDiscFormat2RawCD::get_RequestedWriteSpeed</a> method.
     * 
     * To retrieve a list of the write speeds that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeds">IDiscFormat2RawCD::get_SupportedWriteSpeeds</a> method.
     * 
     * Note that the write speed is based on the media write speeds. The value of this property can change when a media change occurs.
     * @returns {Integer} The write speed of the current media, measured in sectors per second.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentwritespeed
     */
    get_CurrentWriteSpeed() {
        result := ComCall(32, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current rotational-speed control used by the recorder. (IDiscFormat2RawCD.get_CurrentRotationTypeIsPureCAV)
     * @remarks
     * To retrieve the requested rotational-speed control, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedrotationtypeispurecav">IDiscFormat2RawCD::get_RequestedRotationTypeIsPureCAV</a> method.
     * 
     * Rotational-speed control types include the following:
     * 
     * <ul>
     * <li>	CLV (Constant Linear Velocity). The disc is written at a constant speed. Standard rotational control.</li>
     * <li>	CAV (Constant Angular Velocity). The disc is written at a constantly increasing speed.</li>
     * <li>	ZCAV (Zone Constant Linear Velocity). The disc is divided into zones. After each zone, the write speed increases. This is an impure form of CAV.</li>
     * <li>	PCAV (Partial Constant Angular Velocity). The disc speed increases up to a specified velocity. Once reached, the disc spins at the specified velocity for the duration of the disc writing.</li>
     * </ul>
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if constant angular velocity (CAV)  rotational-speed control is in use. Otherwise, VARIANT_FALSE to indicate that another rotational-speed control that the recorder supports is in use.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV() {
        result := ComCall(33, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a list of the write speeds supported by the disc recorder and current media. (IDiscFormat2RawCD.get_SupportedWriteSpeeds)
     * @remarks
     * You can use a speed from the list to set the write speed when calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-setwritespeed">IDiscFormat2RawCD::SetWriteSpeed</a> method.
     * 
     * To retrieve a list of the write configurations that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeddescriptors">IDiscFormat2RawCD::get_SupportedWriteSpeedDescriptors</a> method.
     * @returns {Pointer<SAFEARRAY>} List of the write speeds supported by the disc recorder and current media. Each element of the list is a <b>VARIANT</b> of type <b>VT_UI4</b>. The <b>ulVal</b> member of the variant contains the number of sectors written per second.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds() {
        result := ComCall(34, this, "ptr*", &supportedSpeeds := 0, "HRESULT")
        return supportedSpeeds
    }

    /**
     * Retrieves a list of the detailed write configurations supported by the disc recorder and current media. (IDiscFormat2RawCD.get_SupportedWriteSpeedDescriptors)
     * @remarks
     * To retrieve a list of the write speeds that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeds">IDiscFormat2RawCD::get_SupportedWriteSpeeds</a> method.
     * @returns {Pointer<SAFEARRAY>} List of the detailed write configurations supported by the disc recorder and current media. Each element of the list is a <b>VARIANT</b> of type <b>VT_Dispatch</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwritespeeddescriptor">IWriteSpeedDescriptor</a> interface, which contains the media type, write speed, rotational-speed control type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors() {
        result := ComCall(35, this, "ptr*", &supportedSpeedDescriptors := 0, "HRESULT")
        return supportedSpeedDescriptors
    }
}
