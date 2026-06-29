#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDiscFormat2.ahk" { IDiscFormat2 }
#Import ".\IMAPI_FORMAT2_DATA_MEDIA_STATE.ahk" { IMAPI_FORMAT2_DATA_MEDIA_STATE }
#Import ".\IMAPI_MEDIA_PHYSICAL_TYPE.ahk" { IMAPI_MEDIA_PHYSICAL_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\IDiscRecorder2.ahk" { IDiscRecorder2 }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IMAPI_MEDIA_WRITE_PROTECT_STATE.ahk" { IMAPI_MEDIA_WRITE_PROTECT_STATE }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Use this interface to write a data stream to a disc.
 * @remarks
 * To create the <b>MsftDiscFormat2Data</b> object in a script, use IMAPI2.MsftDiscFormat2Data as the program identifier when calling <b>CreateObject</b>.
 * 
 * It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-idiscformat2data
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IDiscFormat2Data extends IDiscFormat2 {
    /**
     * The interface identifier for IDiscFormat2Data
     * @type {Guid}
     */
    static IID := Guid("{27354153-9f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiscFormat2Data interfaces
    */
    struct Vtbl extends IDiscFormat2.Vtbl {
        put_Recorder                            : IntPtr
        get_Recorder                            : IntPtr
        put_BufferUnderrunFreeDisabled          : IntPtr
        get_BufferUnderrunFreeDisabled          : IntPtr
        put_PostgapAlreadyInImage               : IntPtr
        get_PostgapAlreadyInImage               : IntPtr
        get_CurrentMediaStatus                  : IntPtr
        get_WriteProtectStatus                  : IntPtr
        get_TotalSectorsOnMedia                 : IntPtr
        get_FreeSectorsOnMedia                  : IntPtr
        get_NextWritableAddress                 : IntPtr
        get_StartAddressOfPreviousSession       : IntPtr
        get_LastWrittenAddressOfPreviousSession : IntPtr
        put_ForceMediaToBeClosed                : IntPtr
        get_ForceMediaToBeClosed                : IntPtr
        put_DisableConsumerDvdCompatibilityMode : IntPtr
        get_DisableConsumerDvdCompatibilityMode : IntPtr
        get_CurrentPhysicalMediaType            : IntPtr
        put_ClientName                          : IntPtr
        get_ClientName                          : IntPtr
        get_RequestedWriteSpeed                 : IntPtr
        get_RequestedRotationTypeIsPureCAV      : IntPtr
        get_CurrentWriteSpeed                   : IntPtr
        get_CurrentRotationTypeIsPureCAV        : IntPtr
        get_SupportedWriteSpeeds                : IntPtr
        get_SupportedWriteSpeedDescriptors      : IntPtr
        put_ForceOverwrite                      : IntPtr
        get_ForceOverwrite                      : IntPtr
        get_MultisessionInterfaces              : IntPtr
        Write                                   : IntPtr
        CancelWrite                             : IntPtr
        SetWriteSpeed                           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiscFormat2Data.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {IMAPI_FORMAT2_DATA_MEDIA_STATE} 
     */
    CurrentMediaStatus {
        get => this.get_CurrentMediaStatus()
    }

    /**
     * @type {IMAPI_MEDIA_WRITE_PROTECT_STATE} 
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
     * @type {IMAPI_MEDIA_PHYSICAL_TYPE} 
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
     * Sets the recording device to use for the write operation. (IDiscFormat2Data.put_Recorder)
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the recording device to use for the write operation. (IDiscFormat2Data.get_Recorder)
     * @returns {IDiscRecorder2} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the recording device to use in the write operation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_recorder
     */
    get_Recorder() {
        result := ComCall(13, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2(value)
    }

    /**
     * Determines if Buffer Underrun Free recording is enabled. (IDiscFormat2Data.put_BufferUnderrunFreeDisabled)
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_bufferunderrunfreedisabled
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(14, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines if Buffer Underrun Free recording is enabled for CDR, CD-RW, and DVD-R media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if Buffer Underrun Free recording is disabled; otherwise, VARIANT_FALSE (enabled).
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the data stream contains post-writing gaps. (Put)
     * @remarks
     * Note that writing to CD-R/RW media will automatically append a post-gap of 150 sectors, unless this property is explicitly disabled.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_postgapalreadyinimage
     */
    put_PostgapAlreadyInImage(value) {
        result := ComCall(16, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines if the data stream contains post-writing gaps. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the data stream contains post-writing gaps; otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_postgapalreadyinimage
     */
    get_PostgapAlreadyInImage() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current state of the media in the device.
     * @remarks
     * For an example that uses this property, see <a href="https://docs.microsoft.com/windows/desktop/imapi/checking-media-support">Checking Media Support</a>.
     * @returns {IMAPI_FORMAT2_DATA_MEDIA_STATE} State of the media in the disc device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_format2_data_media_state">IMAPI_FORMAT2_DATA_MEDIA_STATE</a> enumeration type. Note that more than one state can be set.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentmediastatus
     */
    get_CurrentMediaStatus() {
        result := ComCall(18, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current write protect state of the media in the device.
     * @returns {IMAPI_MEDIA_WRITE_PROTECT_STATE} The current write protect state of the media in the device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_write_protect_state">IMAPI_MEDIA_WRITE_PROTECT_STATE</a> enumeration type. 
     * 
     * Note that more than one state can be set.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_writeprotectstatus
     */
    get_WriteProtectStatus() {
        result := ComCall(19, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of sectors on the media in the device.
     * @remarks
     * This value does not necessarily reflect the total usable sectors on the media, not even for a blank disc.
     * @returns {Integer} Number of sectors on the media in the device. The number includes free sectors, used sectors, and the boot sector.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia() {
        result := ComCall(20, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of free sectors on the disc for incremental recording (without overwriting existing data).
     * @remarks
     * The value of this property is effectively the number of sectors available on disc for the write operation. The value filters sectors consumed in  managing the disc space and data quality, such as run-out blocks and postgaps.
     * 
     * <div class="alert"><b>Note</b>  For overwritable discs, which have only one physical session, the number of free sectors indicated by <i>value</i> will always be the total number of sectors on the disc.</div>
     * <div> </div>
     * If <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_forceoverwrite">IDiscFormat2Data::put_ForceOverwrite</a> is set to VARIANT_TRUE, use the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_totalsectorsonmedia">IDiscFormat2Data::get_TotalSectorsOnMedia</a> property instead.
     * @returns {Integer} Number of free sectors on the media in the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia() {
        result := ComCall(21, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the location for the next write operation.
     * @remarks
     * Blank media begin writing at location zero.
     * 
     * In multi-session writing, the next writable address is useful for setting up a correct file system.
     * @returns {Integer} Address where the next write operation begins.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_nextwritableaddress
     */
    get_NextWritableAddress() {
        result := ComCall(22, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the first sector of the previous write session.
     * @remarks
     * <div class="alert"><b>Note</b>  This property should not be used. Instead, you should use an interface derived from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a>, such as <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisessionsequential">IMultisessionSequential</a>, for importing file data from the previous session.</div>
     * <div> </div>
     * @returns {Integer} Address where the previous write operation began.  
     * 
     * The value is -1 if the media is blank or does not support multi-session writing (indicates that no previous session could be detected).
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_startaddressofprevioussession
     */
    get_StartAddressOfPreviousSession() {
        result := ComCall(23, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last sector of the previous write session.
     * @remarks
     * <div class="alert"><b>Note</b>  This property should not be used. Instead, you should use an interface derived from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a>, such as <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisessionsequential">IMultisessionSequential</a>, for importing file data from the previous session.</div>
     * <div> </div>
     * @returns {Integer} Address where the previous write operation ended.  
     * 
     * The value is -1 if the media is blank or does not support multi-session writing (indicates that no previous session could be detected).
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_lastwrittenaddressofprevioussession
     */
    get_LastWrittenAddressOfPreviousSession() {
        result := ComCall(24, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if further additions to the file system are prevented. (Put)
     * @remarks
     * When the free space on a disc reaches 2% or less, the write process marks the disc closed, regardless of the value of this property. This action ensures that a disc has enough free space to record a file system in a write session.
     * 
     * You can erase a rewritable disc that is marked closed.
     * 
     * Note that the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_disableconsumerdvdcompatibilitymode">IDiscFormat2Data::put_DisableConsumerDvdCompatibilityMode</a> property may supersede this property. Please refer to <b>put_DisableConsumerDvdCompatibilityMode</b> for details.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_forcemediatobeclosed
     */
    put_ForceMediaToBeClosed(value) {
        result := ComCall(25, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines if further additions to the file system are prevented. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the next write session ends by marking the disc as closed to subsequent write sessions. Otherwise, VARIANT_FALSE to keep the disc open for subsequent write sessions.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_forcemediatobeclosed
     */
    get_ForceMediaToBeClosed() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if a DVD recording session includes tasks that can increase the chance that a device can play the DVD. (Put)
     * @remarks
     * This property has no effect on CD media and DVD dash media.
     * 
     * For DVD+R and DVD+DL media, this property will also affect the media closing operation. 
     * 
     * <table>
     * <tr>
     * <th>Value of DisableConsumerDvdCompatibilityMode </th>
     * <th>Value of ForceMediaToBeClosed </th>
     * <th>Closure operation</th>
     * </tr>
     * <tr>
     * <td>False</td>
     * <td>True</td>
     * <td>Closes the disc in compatible mode</td>
     * </tr>
     * <tr>
     * <td>False</td>
     * <td>False</td>
     * <td>Closes the disc in compatible mode</td>
     * </tr>
     * <tr>
     * <td>True</td>
     * <td>True</td>
     * <td>Closes the disc normally</td>
     * </tr>
     * <tr>
     * <td>True</td>
     * <td>False</td>
     * <td>Closes the session for DVD+R Closes disc normally for DVD+R DL 
     * 
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_disableconsumerdvdcompatibilitymode
     */
    put_DisableConsumerDvdCompatibilityMode(value) {
        result := ComCall(27, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines if a DVD recording session includes tasks that can increase the chance that a device can play the DVD. (Get)
     * @remarks
     * This property has no effect on CD media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the session skips the tasks that allow the disc to play on more consumer devices
     * 
     * Is VARIANT_FALSE if the media will be written to maximize read compatibility with consumer devices.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_disableconsumerdvdcompatibilitymode
     */
    get_DisableConsumerDvdCompatibilityMode() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the type of media in the disc device. (IDiscFormat2Data.get_CurrentPhysicalMediaType)
     * @returns {IMAPI_MEDIA_PHYSICAL_TYPE} Type of media in the disc device. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType() {
        result := ComCall(29, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets the friendly name of the client. (IDiscFormat2Data.put_ClientName)
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(30, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Retrieves the friendly name of the client. (IDiscFormat2Data.get_ClientName)
     * @returns {BSTR} Name of the client application.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_clientname
     */
    get_ClientName() {
        value := BSTR.Owned()
        result := ComCall(31, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves the requested write speed. (IDiscFormat2Data.get_RequestedWriteSpeed)
     * @remarks
     * This is the value specified in the most recent call to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-setwritespeed">IDiscFormat2Data::SetWriteSpeed</a> method.
     * @returns {Integer} Requested write speed measured in disc sectors per second.
     * 
     * A value of 0xFFFFFFFF (-1) requests that the write occurs using the fastest supported speed for the media.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_requestedwritespeed
     */
    get_RequestedWriteSpeed() {
        result := ComCall(32, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the requested rotational-speed control type. (IDiscFormat2Data.get_RequestedRotationTypeIsPureCAV)
     * @remarks
     * This is the value specified in the most recent call to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-setwritespeed">IDiscFormat2Data::SetWriteSpeed</a> method.
     * @returns {VARIANT_BOOL} Requested rotational-speed control type. Is VARIANT_TRUE for constant angular velocity (CAV)  rotational-speed control type. Otherwise, is VARIANT_FALSE for any other rotational-speed control type that the recorder supports.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV() {
        result := ComCall(33, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the drive's current write speed. (IDiscFormat2Data.get_CurrentWriteSpeed)
     * @remarks
     * To retrieve the requested write speed, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_requestedwritespeed">IDiscFormat2Data::get_RequestedWriteSpeed</a> method.
     * 
     * To retrieve a list of the write speeds that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds">IDiscFormat2Data::get_SupportedWriteSpeeds</a> method.
     * 
     * Note that the write speed is based on the media write speeds. The value of this property can change when a media change occurs.
     * @returns {Integer} The write speed of the current media, measured in sectors per second.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentwritespeed
     */
    get_CurrentWriteSpeed() {
        result := ComCall(34, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the current rotational-speed control used by the recorder. (IDiscFormat2Data.get_CurrentRotationTypeIsPureCAV)
     * @remarks
     * To retrieve the requested rotational-speed control, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_requestedrotationtypeispurecav">IDiscFormat2Data::get_RequestedRotationTypeIsPureCAV</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV() {
        result := ComCall(35, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a list of the write speeds supported by the disc recorder and current media. (IDiscFormat2Data.get_SupportedWriteSpeeds)
     * @remarks
     * You can use a speed from the list to set the write speed when calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-setwritespeed">IDiscFormat2Data::SetWriteSpeed</a> method.
     * 
     * To retrieve a list of the write configurations that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeddescriptors">IDiscFormat2Data::get_SupportedWriteSpeedDescriptors</a> method.
     * @returns {Pointer<SAFEARRAY>} List of the write speeds supported by the disc recorder and current media. Each element of the array is a <b>VARIANT</b> of type <b>VT_UI4</b>. The <b>ulVal</b> member of the variant contains the number of sectors written per second.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds() {
        result := ComCall(36, this, "ptr*", &supportedSpeeds := 0, "HRESULT")
        return supportedSpeeds
    }

    /**
     * Retrieves a list of the detailed write configurations supported by the disc recorder and current media. (IDiscFormat2Data.get_SupportedWriteSpeedDescriptors)
     * @remarks
     * To retrieve a list of the write speeds that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds">IDiscFormat2Data::get_SupportedWriteSpeeds</a> method.
     * @returns {Pointer<SAFEARRAY>} List of the detailed write configurations supported by the disc recorder and current media. Each element of the array is a <b>VARIANT</b> of type <b>VT_Dispatch</b>. Query the <b>pdispVal</b> member of the variant for the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwritespeeddescriptor">IWriteSpeedDescriptor</a> interface, which contains the media type, write speed, rotational-speed control type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors() {
        result := ComCall(37, this, "ptr*", &supportedSpeedDescriptors := 0, "HRESULT")
        return supportedSpeedDescriptors
    }

    /**
     * Determines if the data writer must overwrite the disc on overwritable media types. (Put)
     * @param {VARIANT_BOOL} value Is VARIANT_TRUE if the data writer must overwrite the disc on overwritable media types; otherwise, VARIANT_FALSE. The default is VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_forceoverwrite
     */
    put_ForceOverwrite(value) {
        result := ComCall(38, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines if the data writer must overwrite the disc on overwritable media types. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the data writer must overwrite the disc on overwritable media types; otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_forceoverwrite
     */
    get_ForceOverwrite() {
        result := ComCall(39, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a list of available multi-session interfaces.
     * @remarks
     * The array will always contain at least one element.
     * @returns {Pointer<SAFEARRAY>} List of available multi-session interfaces. Each element of the array is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for any interface that inherits from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisession">IMultisession</a> interface, for example, <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-imultisessionsequential">IMultisessionSequential</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_multisessioninterfaces
     */
    get_MultisessionInterfaces() {
        result := ComCall(40, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Writes the data stream to the device.
     * @remarks
     * Before calling this method, you must call the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-put_recorder">IDiscFormat2Data::put_Recorder</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_clientname">IDiscFormat2Data::put_ClientName</a>
     * </li>
     * </ul>
     * You should also consider calling the following methods if their default values are not appropriate for your application:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_bufferunderrunfreedisabled">IDiscFormat2Data::put_BufferUnderrunFreeDisabled</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_disableconsumerdvdcompatibilitymode">IDiscFormat2Data::put_DisableConsumerDvdCompatibilityMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_forcemediatobeclosed">IDiscFormat2Data::put_ForceMediaToBeClosed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_forceoverwrite">IDiscFormat2Data::put_ForceOverwrite</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_postgapalreadyinimage">IDiscFormat2Data::put_PostgapAlreadyInImage</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-setwritespeed">IDiscFormat2Data::SetWriteSpeed</a>
     * </li>
     * </ul>
     * This method is synchronous, which means that control is not returned until the provided <b>IStream</b> is recorded to the media. To determine the progress of the write operation, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscformat2dataevents">DDiscFormat2DataEvents</a> interface. For examples that show how to implement an event handler in a script, see <a href="https://docs.microsoft.com/windows/desktop/imapi/monitoring-progress-with-events">Monitoring Progress With Events</a>.
     * 
     * On sequentially recorded discs, the provided <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> is recorded as a new session. On rewritable discs, the provided <b>IStream</b> is always recorded starting from sector 0, but the object providing the <b>IStream</b> interface can also provide the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iblockrangelist">IBlockRangeList</a> interface listing the sectors that need to be recorded. The <b>IBlockRangeList</b> interface is used to avoid rewriting of sectors that have not changed in multisession scenarios. If the object providing <b>IStream</b> does not provide <b>IBlockRangeList</b>, it is assumed that the entire <b>IStream</b> needs to be recorded.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-write
     */
    Write(data) {
        result := ComCall(41, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Cancels the current write operation. (IDiscFormat2Data.CancelWrite)
     * @remarks
     * To cancel the write operation, you must call this method from the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-ddiscformat2dataevents-update">DDiscFormat2DataEvents::Update</a> event handler that you implemented. 
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-cancelwrite
     */
    CancelWrite() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * Sets the write speed of the disc recorder. (IDiscFormat2Data.SetWriteSpeed)
     * @remarks
     * This method sets the write speed and type of rotational-speed control for a recorder. Requested values might differ from the values set in the recorder. To specify the recorder, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_recorder">IDiscFormat2Data::put_Recorder</a> method. 
     * 
     * If the recorder supports the requested write speed,  the disc device uses the requested value. If the recorder does not support the requested write speed,  the recorder uses a write speed that it does support that is closest to the requested value. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_currentwritespeed">IDiscFormat2Data::get_CurrentWriteSpeed</a> property contains the value used by the recorder.
     * 
     * To retrieve a list of the write speeds that the recorder and current media supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds">IDiscFormat2Data::get_SupportedWriteSpeeds</a> method.
     * 
     * If you request constant angular velocity (CAV) for rotational-speed control type and the recorder does not support CAV,  the disc device uses another type of rotational-speed control type that it supports. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_currentrotationtypeispurecav">IDiscFormat2Data::get_CurrentRotationTypeIsPureCAV</a> property indicates the value used by the recorder.
     * 
     * To retrieve the requested values, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_requestedwritespeed">IDiscFormat2Data::get_RequestedWriteSpeed</a> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-get_requestedrotationtypeispurecav">IDiscFormat2Data::get_RequestedRotationTypeIsPureCAV</a> methods.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-setwritespeed
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(43, this, "int", RequestedSectorsPerSecond, VARIANT_BOOL, RotationTypeIsPureCAV, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDiscFormat2Data.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Recorder := CallbackCreate(GetMethod(implObj, "put_Recorder"), flags, 2)
        this.vtbl.get_Recorder := CallbackCreate(GetMethod(implObj, "get_Recorder"), flags, 2)
        this.vtbl.put_BufferUnderrunFreeDisabled := CallbackCreate(GetMethod(implObj, "put_BufferUnderrunFreeDisabled"), flags, 2)
        this.vtbl.get_BufferUnderrunFreeDisabled := CallbackCreate(GetMethod(implObj, "get_BufferUnderrunFreeDisabled"), flags, 2)
        this.vtbl.put_PostgapAlreadyInImage := CallbackCreate(GetMethod(implObj, "put_PostgapAlreadyInImage"), flags, 2)
        this.vtbl.get_PostgapAlreadyInImage := CallbackCreate(GetMethod(implObj, "get_PostgapAlreadyInImage"), flags, 2)
        this.vtbl.get_CurrentMediaStatus := CallbackCreate(GetMethod(implObj, "get_CurrentMediaStatus"), flags, 2)
        this.vtbl.get_WriteProtectStatus := CallbackCreate(GetMethod(implObj, "get_WriteProtectStatus"), flags, 2)
        this.vtbl.get_TotalSectorsOnMedia := CallbackCreate(GetMethod(implObj, "get_TotalSectorsOnMedia"), flags, 2)
        this.vtbl.get_FreeSectorsOnMedia := CallbackCreate(GetMethod(implObj, "get_FreeSectorsOnMedia"), flags, 2)
        this.vtbl.get_NextWritableAddress := CallbackCreate(GetMethod(implObj, "get_NextWritableAddress"), flags, 2)
        this.vtbl.get_StartAddressOfPreviousSession := CallbackCreate(GetMethod(implObj, "get_StartAddressOfPreviousSession"), flags, 2)
        this.vtbl.get_LastWrittenAddressOfPreviousSession := CallbackCreate(GetMethod(implObj, "get_LastWrittenAddressOfPreviousSession"), flags, 2)
        this.vtbl.put_ForceMediaToBeClosed := CallbackCreate(GetMethod(implObj, "put_ForceMediaToBeClosed"), flags, 2)
        this.vtbl.get_ForceMediaToBeClosed := CallbackCreate(GetMethod(implObj, "get_ForceMediaToBeClosed"), flags, 2)
        this.vtbl.put_DisableConsumerDvdCompatibilityMode := CallbackCreate(GetMethod(implObj, "put_DisableConsumerDvdCompatibilityMode"), flags, 2)
        this.vtbl.get_DisableConsumerDvdCompatibilityMode := CallbackCreate(GetMethod(implObj, "get_DisableConsumerDvdCompatibilityMode"), flags, 2)
        this.vtbl.get_CurrentPhysicalMediaType := CallbackCreate(GetMethod(implObj, "get_CurrentPhysicalMediaType"), flags, 2)
        this.vtbl.put_ClientName := CallbackCreate(GetMethod(implObj, "put_ClientName"), flags, 2)
        this.vtbl.get_ClientName := CallbackCreate(GetMethod(implObj, "get_ClientName"), flags, 2)
        this.vtbl.get_RequestedWriteSpeed := CallbackCreate(GetMethod(implObj, "get_RequestedWriteSpeed"), flags, 2)
        this.vtbl.get_RequestedRotationTypeIsPureCAV := CallbackCreate(GetMethod(implObj, "get_RequestedRotationTypeIsPureCAV"), flags, 2)
        this.vtbl.get_CurrentWriteSpeed := CallbackCreate(GetMethod(implObj, "get_CurrentWriteSpeed"), flags, 2)
        this.vtbl.get_CurrentRotationTypeIsPureCAV := CallbackCreate(GetMethod(implObj, "get_CurrentRotationTypeIsPureCAV"), flags, 2)
        this.vtbl.get_SupportedWriteSpeeds := CallbackCreate(GetMethod(implObj, "get_SupportedWriteSpeeds"), flags, 2)
        this.vtbl.get_SupportedWriteSpeedDescriptors := CallbackCreate(GetMethod(implObj, "get_SupportedWriteSpeedDescriptors"), flags, 2)
        this.vtbl.put_ForceOverwrite := CallbackCreate(GetMethod(implObj, "put_ForceOverwrite"), flags, 2)
        this.vtbl.get_ForceOverwrite := CallbackCreate(GetMethod(implObj, "get_ForceOverwrite"), flags, 2)
        this.vtbl.get_MultisessionInterfaces := CallbackCreate(GetMethod(implObj, "get_MultisessionInterfaces"), flags, 2)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 2)
        this.vtbl.CancelWrite := CallbackCreate(GetMethod(implObj, "CancelWrite"), flags, 1)
        this.vtbl.SetWriteSpeed := CallbackCreate(GetMethod(implObj, "SetWriteSpeed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Recorder)
        CallbackFree(this.vtbl.get_Recorder)
        CallbackFree(this.vtbl.put_BufferUnderrunFreeDisabled)
        CallbackFree(this.vtbl.get_BufferUnderrunFreeDisabled)
        CallbackFree(this.vtbl.put_PostgapAlreadyInImage)
        CallbackFree(this.vtbl.get_PostgapAlreadyInImage)
        CallbackFree(this.vtbl.get_CurrentMediaStatus)
        CallbackFree(this.vtbl.get_WriteProtectStatus)
        CallbackFree(this.vtbl.get_TotalSectorsOnMedia)
        CallbackFree(this.vtbl.get_FreeSectorsOnMedia)
        CallbackFree(this.vtbl.get_NextWritableAddress)
        CallbackFree(this.vtbl.get_StartAddressOfPreviousSession)
        CallbackFree(this.vtbl.get_LastWrittenAddressOfPreviousSession)
        CallbackFree(this.vtbl.put_ForceMediaToBeClosed)
        CallbackFree(this.vtbl.get_ForceMediaToBeClosed)
        CallbackFree(this.vtbl.put_DisableConsumerDvdCompatibilityMode)
        CallbackFree(this.vtbl.get_DisableConsumerDvdCompatibilityMode)
        CallbackFree(this.vtbl.get_CurrentPhysicalMediaType)
        CallbackFree(this.vtbl.put_ClientName)
        CallbackFree(this.vtbl.get_ClientName)
        CallbackFree(this.vtbl.get_RequestedWriteSpeed)
        CallbackFree(this.vtbl.get_RequestedRotationTypeIsPureCAV)
        CallbackFree(this.vtbl.get_CurrentWriteSpeed)
        CallbackFree(this.vtbl.get_CurrentRotationTypeIsPureCAV)
        CallbackFree(this.vtbl.get_SupportedWriteSpeeds)
        CallbackFree(this.vtbl.get_SupportedWriteSpeedDescriptors)
        CallbackFree(this.vtbl.put_ForceOverwrite)
        CallbackFree(this.vtbl.get_ForceOverwrite)
        CallbackFree(this.vtbl.get_MultisessionInterfaces)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.CancelWrite)
        CallbackFree(this.vtbl.SetWriteSpeed)
    }
}
