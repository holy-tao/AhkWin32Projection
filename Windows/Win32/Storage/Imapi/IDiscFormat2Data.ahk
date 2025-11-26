#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscRecorder2.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to write a data stream to a disc.
 * @remarks
 * 
 * To create the <b>MsftDiscFormat2Data</b> object in a script, use IMAPI2.MsftDiscFormat2Data as the program identifier when calling <b>CreateObject</b>.
 * 
 * It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2data
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2Data extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2Data
     * @type {Guid}
     */
    static IID => Guid("{27354153-9f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Recorder", "get_Recorder", "put_BufferUnderrunFreeDisabled", "get_BufferUnderrunFreeDisabled", "put_PostgapAlreadyInImage", "get_PostgapAlreadyInImage", "get_CurrentMediaStatus", "get_WriteProtectStatus", "get_TotalSectorsOnMedia", "get_FreeSectorsOnMedia", "get_NextWritableAddress", "get_StartAddressOfPreviousSession", "get_LastWrittenAddressOfPreviousSession", "put_ForceMediaToBeClosed", "get_ForceMediaToBeClosed", "put_DisableConsumerDvdCompatibilityMode", "get_DisableConsumerDvdCompatibilityMode", "get_CurrentPhysicalMediaType", "put_ClientName", "get_ClientName", "get_RequestedWriteSpeed", "get_RequestedRotationTypeIsPureCAV", "get_CurrentWriteSpeed", "get_CurrentRotationTypeIsPureCAV", "get_SupportedWriteSpeeds", "get_SupportedWriteSpeedDescriptors", "put_ForceOverwrite", "get_ForceOverwrite", "get_MultisessionInterfaces", "Write", "CancelWrite", "SetWriteSpeed"]

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
     * @type {VARIANT_BOOL} 
     */
    PostgapAlreadyInImage {
        get => this.get_PostgapAlreadyInImage()
        set => this.put_PostgapAlreadyInImage(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentMediaStatus {
        get => this.get_CurrentMediaStatus()
    }

    /**
     * @type {Integer} 
     */
    WriteProtectStatus {
        get => this.get_WriteProtectStatus()
    }

    /**
     * @type {Integer} 
     */
    TotalSectorsOnMedia {
        get => this.get_TotalSectorsOnMedia()
    }

    /**
     * @type {Integer} 
     */
    FreeSectorsOnMedia {
        get => this.get_FreeSectorsOnMedia()
    }

    /**
     * @type {Integer} 
     */
    NextWritableAddress {
        get => this.get_NextWritableAddress()
    }

    /**
     * @type {Integer} 
     */
    StartAddressOfPreviousSession {
        get => this.get_StartAddressOfPreviousSession()
    }

    /**
     * @type {Integer} 
     */
    LastWrittenAddressOfPreviousSession {
        get => this.get_LastWrittenAddressOfPreviousSession()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ForceMediaToBeClosed {
        get => this.get_ForceMediaToBeClosed()
        set => this.put_ForceMediaToBeClosed(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisableConsumerDvdCompatibilityMode {
        get => this.get_DisableConsumerDvdCompatibilityMode()
        set => this.put_DisableConsumerDvdCompatibilityMode(value)
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
     * @type {VARIANT_BOOL} 
     */
    ForceOverwrite {
        get => this.get_ForceOverwrite()
        set => this.put_ForceOverwrite(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    MultisessionInterfaces {
        get => this.get_MultisessionInterfaces()
    }

    /**
     * Sets the recording device to use for the write operation.
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
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0400
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2DATA_RECORDER_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This device does not support the operations required by this disc format.
     * 
     * Value: 0xC0AA0407
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the recording device to use for the write operation.
     * @returns {IDiscRecorder2} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device to use in the write operation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_recorder
     */
    get_Recorder() {
        result := ComCall(13, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2(value)
    }

    /**
     * Determines if Buffer Underrun Free recording is enabled.
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
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0400
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_bufferunderrunfreedisabled
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(14, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if Buffer Underrun Free recording is enabled for CDR, CD-RW, and DVD-R media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if Buffer Underrun Free recording is disabled; otherwise, VARIANT_FALSE (enabled).
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled() {
        result := ComCall(15, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the data stream contains post-writing gaps.
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE if the data stream contains post-writing gaps; otherwise, VARIANT_FALSE. The default is VARIANT_FALSE.
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
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0400
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_postgapalreadyinimage
     */
    put_PostgapAlreadyInImage(value) {
        result := ComCall(16, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if the data stream contains post-writing gaps.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the data stream contains post-writing gaps; otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_postgapalreadyinimage
     */
    get_PostgapAlreadyInImage() {
        result := ComCall(17, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current state of the media in the device.
     * @returns {Integer} State of the media in the disc device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_format2_data_media_state">IMAPI_FORMAT2_DATA_MEDIA_STATE</a> enumeration type. Note that more than one state can be set.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_currentmediastatus
     */
    get_CurrentMediaStatus() {
        result := ComCall(18, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current write protect state of the media in the device.
     * @returns {Integer} The current write protect state of the media in the device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_write_protect_state">IMAPI_MEDIA_WRITE_PROTECT_STATE</a> enumeration type. 
     * 
     * Note that more than one state can be set.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_writeprotectstatus
     */
    get_WriteProtectStatus() {
        result := ComCall(19, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of sectors on the media in the device.
     * @returns {Integer} Number of sectors on the media in the device. The number includes free sectors, used sectors, and the boot sector.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia() {
        result := ComCall(20, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of free sectors on the disc for incremental recording (without overwriting existing data).
     * @returns {Integer} Number of free sectors on the media in the device.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia() {
        result := ComCall(21, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the location for the next write operation.
     * @returns {Integer} Address where the next write operation begins.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_nextwritableaddress
     */
    get_NextWritableAddress() {
        result := ComCall(22, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the first sector of the previous write session.
     * @returns {Integer} Address where the previous write operation began.  
     * 
     * The value is -1 if the media is blank or does not support multi-session writing (indicates that no previous session could be detected).
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_startaddressofprevioussession
     */
    get_StartAddressOfPreviousSession() {
        result := ComCall(23, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last sector of the previous write session.
     * @returns {Integer} Address where the previous write operation ended.  
     * 
     * The value is -1 if the media is blank or does not support multi-session writing (indicates that no previous session could be detected).
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_lastwrittenaddressofprevioussession
     */
    get_LastWrittenAddressOfPreviousSession() {
        result := ComCall(24, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if further additions to the file system are prevented.
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE to mark the disc as closed to prohibit additional writes when the next write session ends.
     * 
     * Set to VARIANT_FALSE to keep the disc open for subsequent write sessions. The default is VARIANT_FALSE.
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
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0400
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_forcemediatobeclosed
     */
    put_ForceMediaToBeClosed(value) {
        result := ComCall(25, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if further additions to the file system are prevented.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the next write session ends by marking the disc as closed to subsequent write sessions. Otherwise, VARIANT_FALSE to keep the disc open for subsequent write sessions.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_forcemediatobeclosed
     */
    get_ForceMediaToBeClosed() {
        result := ComCall(26, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if a DVD recording session includes tasks that can increase the chance that a device can play the DVD.
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE to skip the tasks that allow the disc to play on more consumer devices. Removing compatibility reduces the  recording session time and the need for less free space on disc.
     * 
     * Set to VARIANT_FALSE to increase the chance that a device can play the DVD. The default is VARIANT_FALSE.
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
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0400
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_disableconsumerdvdcompatibilitymode
     */
    put_DisableConsumerDvdCompatibilityMode(value) {
        result := ComCall(27, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if a DVD recording session includes tasks that can increase the chance that a device can play the DVD.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the session skips the tasks that allow the disc to play on more consumer devices
     * 
     * Is VARIANT_FALSE if the media will be written to maximize read compatibility with consumer devices.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_disableconsumerdvdcompatibilitymode
     */
    get_DisableConsumerDvdCompatibilityMode() {
        result := ComCall(28, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the type of media in the disc device.
     * @returns {Integer} Type of media in the disc device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a>enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType() {
        result := ComCall(29, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the friendly name of the client.
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
     * <dt><b>E_IMAPI_DF2DATA_CLIENT_NAME_IS_NOT_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client name is not valid.
     * 
     * Value: 0xC0AA0211
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0500
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(30, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the friendly name of the client.
     * @returns {BSTR} Name of the client application.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_clientname
     */
    get_ClientName() {
        value := BSTR()
        result := ComCall(31, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Retrieves the requested write speed.
     * @returns {Integer} Requested write speed measured in disc sectors per second.
     * 
     * A value of 0xFFFFFFFF (-1) requests that the write occurs using the fastest supported speed for the media.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_requestedwritespeed
     */
    get_RequestedWriteSpeed() {
        result := ComCall(32, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the requested rotational-speed control type.
     * @returns {VARIANT_BOOL} Requested rotational-speed control type. Is VARIANT_TRUE for constant angular velocity (CAV)  rotational-speed control type. Otherwise, is VARIANT_FALSE for any other rotational-speed control type that the recorder supports.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV() {
        result := ComCall(33, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the drive's current write speed.
     * @returns {Integer} The write speed of the current media, measured in sectors per second.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_currentwritespeed
     */
    get_CurrentWriteSpeed() {
        result := ComCall(34, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current rotational-speed control used by the recorder.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if constant angular velocity (CAV)  rotational-speed control is in use. Otherwise, VARIANT_FALSE to indicate that another rotational-speed control that the recorder supports is in use.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV() {
        result := ComCall(35, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a list of the write speeds supported by the disc recorder and current media.
     * @returns {Pointer<SAFEARRAY>} List of the write speeds supported by the disc recorder and current media. Each element of the array is a <b>VARIANT</b> of type <b>VT_UI4</b>. The <b>ulVal</b> member of the variant contains the number of sectors written per second.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds() {
        result := ComCall(36, this, "ptr*", &supportedSpeeds := 0, "HRESULT")
        return supportedSpeeds
    }

    /**
     * Retrieves a list of the detailed write configurations supported by the disc recorder and current media.
     * @returns {Pointer<SAFEARRAY>} List of the detailed write configurations supported by the disc recorder and current media. Each element of the array is a <b>VARIANT</b> of type <b>VT_Dispatch</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwritespeeddescriptor">IWriteSpeedDescriptor</a> interface, which contains the media type, write speed, rotational-speed control type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors() {
        result := ComCall(37, this, "ptr*", &supportedSpeedDescriptors := 0, "HRESULT")
        return supportedSpeedDescriptors
    }

    /**
     * Determines if the data writer must overwrite the disc on overwritable media types.
     * @param {VARIANT_BOOL} value Is VARIANT_TRUE if the data writer must overwrite the disc on overwritable media types; otherwise, VARIANT_FALSE. The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-put_forceoverwrite
     */
    put_ForceOverwrite(value) {
        result := ComCall(38, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if the data writer must overwrite the disc on overwritable media types.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the data writer must overwrite the disc on overwritable media types; otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_forceoverwrite
     */
    get_ForceOverwrite() {
        result := ComCall(39, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a list of available multi-session interfaces.
     * @returns {Pointer<SAFEARRAY>} List of available multi-session interfaces. Each element of the array is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for any interface that inherits from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface, for example, <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisessionsequential">IMultisessionSequential</a>.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-get_multisessioninterfaces
     */
    get_MultisessionInterfaces() {
        result := ComCall(40, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Writes the data stream to the device.
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
     * <dt><b>E_IMAPI_UNEXPECTED_RESPONSE_FROM_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The write failed because the drive returned error information that could not be recovered from.
     * 
     * Value: 0xC0AA0301
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2DATA_RECORDER_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This device does not support the operations required by this disc format.
     * 
     * Value: 0xC0AA0407
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2DATA_WRITE_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently a write operation in progress.
     * 
     * Value: 0xC0AA0400
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2DATA_STREAM_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the provided <b>IStream</b> object is invalid. The size must be a multiple of the sector size, 2048.
     * 
     * Value: 0xC0AA0403
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_IMAPI_DF2DATA_MEDIA_IS_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media type is unsupported.
     * 
     * Value: (HRESULT)0xC0AA0406
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-write
     */
    Write(data) {
        result := ComCall(41, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Cancels the current write operation.
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
     * <dt><b>E_IMAPI_DF2DATA_WRITE_NOT_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no write operation currently in progress.
     * 
     * Value: 0xC0AA0401
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-cancelwrite
     */
    CancelWrite() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * Sets the write speed of the disc recorder.
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
     * <dt><b>E_IMAPI_UNEXPECTED_RESPONSE_FROM_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The write failed because the drive returned error information that could not be recovered from.
     * 
     * Value: 0xC0AA0301
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2data-setwritespeed
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(43, this, "int", RequestedSectorsPerSecond, "short", RotationTypeIsPureCAV, "HRESULT")
        return result
    }
}
