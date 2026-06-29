#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * This interface represents a physical device. You use this interface to retrieve information about a CD and DVD device installed on the computer and to perform operations such as closing the tray or eject the media.
 * @remarks
 * To create the <b>MsftDiscRecorder2</b> object in a script, use IMAPI2.MsftDiscRecorder2 as the program identifier when calling <b>CreateObject</b>.
 * 
 * To write data to media, you need to attach a recorder to a format writer, for example, to attach the recorder to a data writer, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_recorder">IDiscFormat2Data::put_Recorder</a> method.
 * 
 * Several properties of this interface return packet data defined by Multimedia Command (MMC). For information on the format of the packet data, see the latest revision of the MMC specification at ftp://ftp.t10.org/t10/drafts/mmc5.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-idiscrecorder2
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IDiscRecorder2 extends IDispatch {
    /**
     * The interface identifier for IDiscRecorder2
     * @type {Guid}
     */
    static IID := Guid("{27354133-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiscRecorder2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EjectMedia                : IntPtr
        CloseTray                 : IntPtr
        AcquireExclusiveAccess    : IntPtr
        ReleaseExclusiveAccess    : IntPtr
        DisableMcn                : IntPtr
        EnableMcn                 : IntPtr
        InitializeDiscRecorder    : IntPtr
        get_ActiveDiscRecorder    : IntPtr
        get_VendorId              : IntPtr
        get_ProductId             : IntPtr
        get_ProductRevision       : IntPtr
        get_VolumeName            : IntPtr
        get_VolumePathNames       : IntPtr
        get_DeviceCanLoadMedia    : IntPtr
        get_LegacyDeviceNumber    : IntPtr
        get_SupportedFeaturePages : IntPtr
        get_CurrentFeaturePages   : IntPtr
        get_SupportedProfiles     : IntPtr
        get_CurrentProfiles       : IntPtr
        get_SupportedModePages    : IntPtr
        get_ExclusiveAccessOwner  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiscRecorder2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ActiveDiscRecorder {
        get => this.get_ActiveDiscRecorder()
    }

    /**
     * @type {BSTR} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * @type {BSTR} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * @type {BSTR} 
     */
    ProductRevision {
        get => this.get_ProductRevision()
    }

    /**
     * @type {BSTR} 
     */
    VolumeName {
        get => this.get_VolumeName()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    VolumePathNames {
        get => this.get_VolumePathNames()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DeviceCanLoadMedia {
        get => this.get_DeviceCanLoadMedia()
    }

    /**
     * @type {Integer} 
     */
    LegacyDeviceNumber {
        get => this.get_LegacyDeviceNumber()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedFeaturePages {
        get => this.get_SupportedFeaturePages()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CurrentFeaturePages {
        get => this.get_CurrentFeaturePages()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedProfiles {
        get => this.get_SupportedProfiles()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CurrentProfiles {
        get => this.get_CurrentProfiles()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedModePages {
        get => this.get_SupportedModePages()
    }

    /**
     * @type {BSTR} 
     */
    ExclusiveAccessOwner {
        get => this.get_ExclusiveAccessOwner()
    }

    /**
     * Ejects media from the device.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-ejectmedia
     */
    EjectMedia() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Closes the media tray.
     * @remarks
     * <div class="alert"><b>Note</b>  Some drives, such as those with slot-loading mechanisms, do not support this method. To determine if the device supports this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-get_devicecanloadmedia">IDiscRecorder2::get_DeviceCanLoadMedia</a> property.</div>
     * <div> </div>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-closetray
     */
    CloseTray() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Acquires exclusive access to the device.
     * @remarks
     * You should not have to call this method to acquire the lock yourself because the write operations, such as <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-write">IDiscFormat2Data::Write</a>, acquires the lock for you.
     * 
     * Each recorder has a lock count. The first call to a recorder locks the device for exclusive access. Applications can use the <b>AcquireExclusiveAccess</b> method multiple times to apply multiple locks on a device. Each call increments the lock count by one. 
     * 
     * When unlocking a recorder, the lock count must reach zero to free the device for other clients. Calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-releaseexclusiveaccess">IDiscRecorder2::ReleaseExclusiveAccess</a> method decrements the lock count by one.
     * 
     * An equal number of calls to the  <b>AcquireExclusiveAccess</b> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-releaseexclusiveaccess">ReleaseExclusiveAccess</a> methods are needed to free a device. Should the application exit unexpectedly or crash while holding the exclusive access, the CDROM.SYS driver will automatically release these exclusive locks.
     * 
     * If the device is already locked, you can call <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-get_exclusiveaccessowner">IDiscRecorder2::get_ExclusiveAccessOwner</a> to retrieve the name of the client application that currently has exclusive access.
     * @param {VARIANT_BOOL} force Set to VARIANT_TRUE to gain exclusive access to the volume whether the file system volume can or cannot be dismounted. If VARIANT_FALSE, this method  gains exclusive access only when there is no file system mounted on the volume.
     * @param {BSTR} __MIDL__IDiscRecorder20000 String that contains the friendly name of the client application requesting exclusive access. Cannot be <b>NULL</b> or a zero-length string. The string must conform to the restrictions for the IOCTL_CDROM_EXCLUSIVE_ACCESS control code found in the DDK.
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
     * <dt><b>E_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is currently being used by another application.
     * 
     * Value: 0x80070005
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
     * The device associated with this recorder during the last operation has been exclusively locked, causing this operation to fail.
     * 
     * Value: 0xC0AA0210
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-acquireexclusiveaccess
     */
    AcquireExclusiveAccess(force, __MIDL__IDiscRecorder20000) {
        __MIDL__IDiscRecorder20000 := __MIDL__IDiscRecorder20000 is String ? BSTR.Alloc(__MIDL__IDiscRecorder20000).Value : __MIDL__IDiscRecorder20000

        result := ComCall(9, this, VARIANT_BOOL, force, BSTR, __MIDL__IDiscRecorder20000, "HRESULT")
        return result
    }

    /**
     * Releases exclusive access to the device.
     * @remarks
     * Each recorder has a lock count. The first call to a recorder locks the device for exclusive access. Applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-acquireexclusiveaccess">IDiscRecorder2::AcquireExclusiveAccess</a> method multiple times to apply multiple locks on a device. Each call increments the lock count by one.
     * 
     * When unlocking a recorder, the lock count must reach zero to free the device for other clients. Calling the <b>ReleaseExclusiveAccess</b> method decrements the lock count by one.
     * 
     * An equal number of  calls to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-acquireexclusiveaccess">AcquireExclusiveAccess</a> and <b>ReleaseExclusiveAccess</b> methods are needed to free a device. When the lock count reaches zero, recording device is free; the last lock has been removed.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-releaseexclusiveaccess
     */
    ReleaseExclusiveAccess() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Disables Media Change Notification (MCN) for the device.
     * @remarks
     * MCN is the CD-ROM device driver's method of detecting media change and state changes in the CD-ROM device. For example, when you change the media in a CD-ROM device, a MCN message is sent to trigger media features, such as Autoplay. To disable the features, call this method. 
     * 
     * To enable notifications, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-enablemcn">IDiscRecorder2::EnableMcn</a> method. If the application crashes or closes unexpectedly, then MCN is automatically re-enabled by the driver.
     * 
     * Note that DisableMcn increments a reference count each time it is called. The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-enablemcn">EnableMcn</a> method decrements the count. The device is enabled when the reference count is zero.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-disablemcn
     */
    DisableMcn() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Enables Media Change Notification (MCN) for the device.
     * @remarks
     * MCN is the CD-ROM device driver's method of detecting media change and state changes in the CD-ROM device. For example, when you change the media in a CD-ROM device, a MCN message is sent to trigger media features, such as Autoplay. MCN is enabled by default. Call this method to enable notifications when the notifications have been disabled using <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-disablemcn">IDiscRecorder2::DisableMcn</a>.
     * 
     * Note that <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-disablemcn">DisableMcn</a> increments a reference count each time it is called. The EnableMcn method decrements the count. The device is enabled when the reference count is zero.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-enablemcn
     */
    EnableMcn() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Associates the object with the specified disc device.
     * @remarks
     * You must initialize the recorder before calling any of the methods of this interface. 
     * 
     * To retrieve a list of devices on the computer and their unique identifiers, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscmaster2-get__newenum">IDiscMaster2::get__NewEnum</a> method.
     * 
     * This method will not fail on a drive that is exclusively locked.  However, if the drive is exclusively locked, several of the methods of this interface may return E_IMAPI_RECORDER_LOCKED. To determine who has exclusive access, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-get_exclusiveaccessowner">IDiscRecorder2::get_ExclusiveAccessOwner</a> method.
     * @param {BSTR} recorderUniqueId String that contains the unique identifier for the device.
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
     * <dt><b>STRSAFE_E_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value in cchDest is either 0 or larger than STRSAFE_MAX_CCH.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-initializediscrecorder
     */
    InitializeDiscRecorder(recorderUniqueId) {
        recorderUniqueId := recorderUniqueId is String ? BSTR.Alloc(recorderUniqueId).Value : recorderUniqueId

        result := ComCall(13, this, BSTR, recorderUniqueId, "HRESULT")
        return result
    }

    /**
     * Retrieves the unique identifier used to initialize the disc device.
     * @returns {BSTR} Unique identifier for the device. This is the identifier you specified when calling <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-initializediscrecorder">IDiscRecorder2::InitializeDiscRecorder</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_activediscrecorder
     */
    get_ActiveDiscRecorder() {
        value := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves the vendor ID for the device.
     * @returns {BSTR} String that contains the vendor ID for the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_vendorid
     */
    get_VendorId() {
        value := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves the product ID of the device.
     * @returns {BSTR} String that contains the product ID of the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_productid
     */
    get_ProductId() {
        value := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves the product revision code of the device.
     * @returns {BSTR} String that contains the product revision code of the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_productrevision
     */
    get_ProductRevision() {
        value := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves the unique volume name associated with the device.
     * @remarks
     * To retrieve the drive letter assignment, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscrecorder2-get_volumepathnames">IDiscRecorder2::get_VolumePathNames</a> method.
     * @returns {BSTR} String that contains the unique volume name associated with the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_volumename
     */
    get_VolumeName() {
        value := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves a list of drive letters and NTFS mount points for the device.
     * @returns {Pointer<SAFEARRAY>} List of drive letters and NTFS mount points for the device. Each element of the list is a <b>VARIANT</b> of type <b>VT_BSTR</b>. The <b>bstrVal</b> member of the variant contains the path.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_volumepathnames
     */
    get_VolumePathNames() {
        result := ComCall(19, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the device can eject and subsequently reload media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the device can eject and subsequently reload media. If VARIANT_FALSE, loading media must be done manually.
     * 
     * <div class="alert"><b>Note</b>  For slim drives or laptop drives, which utilize a manual tray-loading mechanism, this parameter can indicate an  incorrect value of VARIANT_TRUE.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_devicecanloadmedia
     */
    get_DeviceCanLoadMedia() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the legacy device number for a CD or DVD device.
     * @returns {Integer} Zero-based index number of the device, based on the order the device was installed on the computer.
     * 
     * This value can change during PNP activity when devices are added or removed from the computer,  or across boot sessions and should not be considered a unique identifier for the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_legacydevicenumber
     */
    get_LegacyDeviceNumber() {
        result := ComCall(21, this, "int*", &legacyDeviceNumber := 0, "HRESULT")
        return legacyDeviceNumber
    }

    /**
     * Retrieves the list of features that the device supports.
     * @returns {Pointer<SAFEARRAY>} List of features that the device supports. Each element of the list is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the feature page type value. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_feature_page_type">IMAPI_FEATURE_PAGE_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_supportedfeaturepages
     */
    get_SupportedFeaturePages() {
        result := ComCall(22, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the list of feature pages of the device that are marked as current.
     * @returns {Pointer<SAFEARRAY>} List of supported feature pages that are marked as current for the device. Each element of the list is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the feature page type. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_feature_page_type">IMAPI_FEATURE_PAGE_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_currentfeaturepages
     */
    get_CurrentFeaturePages() {
        result := ComCall(23, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the list of MMC profiles that the device supports.
     * @returns {Pointer<SAFEARRAY>} List of MMC profiles that the device supports. Each element of the list is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the profile type value. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_profile_type">IMAPI_PROFILE_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_supportedprofiles
     */
    get_SupportedProfiles() {
        result := ComCall(24, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves all MMC profiles of the device that are marked as current.
     * @returns {Pointer<SAFEARRAY>} List of supported profiles that are marked as current for the device. Each element of the list is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the profile type. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_profile_type">IMAPI_PROFILE_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_currentprofiles
     */
    get_CurrentProfiles() {
        result := ComCall(25, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the list of MMC mode pages that the device supports.
     * @returns {Pointer<SAFEARRAY>} List of MMC mode pages that the device supports. Each element of the list is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of the variant contains the mode page type value. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_mode_page_type">IMAPI_MODE_PAGE_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_supportedmodepages
     */
    get_SupportedModePages() {
        result := ComCall(26, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the name of the client application that has exclusive access to the device.
     * @remarks
     * This property returns the current exclusive access owner of the device.  This value comes directly from CDROM.SYS and should be queried anytime an operation fails with error E_IMAPI_RECORDER_LOCKED.
     * @returns {BSTR} String that contains the name of the client application that has exclusive access to the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_exclusiveaccessowner
     */
    get_ExclusiveAccessOwner() {
        value := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IDiscRecorder2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EjectMedia := CallbackCreate(GetMethod(implObj, "EjectMedia"), flags, 1)
        this.vtbl.CloseTray := CallbackCreate(GetMethod(implObj, "CloseTray"), flags, 1)
        this.vtbl.AcquireExclusiveAccess := CallbackCreate(GetMethod(implObj, "AcquireExclusiveAccess"), flags, 3)
        this.vtbl.ReleaseExclusiveAccess := CallbackCreate(GetMethod(implObj, "ReleaseExclusiveAccess"), flags, 1)
        this.vtbl.DisableMcn := CallbackCreate(GetMethod(implObj, "DisableMcn"), flags, 1)
        this.vtbl.EnableMcn := CallbackCreate(GetMethod(implObj, "EnableMcn"), flags, 1)
        this.vtbl.InitializeDiscRecorder := CallbackCreate(GetMethod(implObj, "InitializeDiscRecorder"), flags, 2)
        this.vtbl.get_ActiveDiscRecorder := CallbackCreate(GetMethod(implObj, "get_ActiveDiscRecorder"), flags, 2)
        this.vtbl.get_VendorId := CallbackCreate(GetMethod(implObj, "get_VendorId"), flags, 2)
        this.vtbl.get_ProductId := CallbackCreate(GetMethod(implObj, "get_ProductId"), flags, 2)
        this.vtbl.get_ProductRevision := CallbackCreate(GetMethod(implObj, "get_ProductRevision"), flags, 2)
        this.vtbl.get_VolumeName := CallbackCreate(GetMethod(implObj, "get_VolumeName"), flags, 2)
        this.vtbl.get_VolumePathNames := CallbackCreate(GetMethod(implObj, "get_VolumePathNames"), flags, 2)
        this.vtbl.get_DeviceCanLoadMedia := CallbackCreate(GetMethod(implObj, "get_DeviceCanLoadMedia"), flags, 2)
        this.vtbl.get_LegacyDeviceNumber := CallbackCreate(GetMethod(implObj, "get_LegacyDeviceNumber"), flags, 2)
        this.vtbl.get_SupportedFeaturePages := CallbackCreate(GetMethod(implObj, "get_SupportedFeaturePages"), flags, 2)
        this.vtbl.get_CurrentFeaturePages := CallbackCreate(GetMethod(implObj, "get_CurrentFeaturePages"), flags, 2)
        this.vtbl.get_SupportedProfiles := CallbackCreate(GetMethod(implObj, "get_SupportedProfiles"), flags, 2)
        this.vtbl.get_CurrentProfiles := CallbackCreate(GetMethod(implObj, "get_CurrentProfiles"), flags, 2)
        this.vtbl.get_SupportedModePages := CallbackCreate(GetMethod(implObj, "get_SupportedModePages"), flags, 2)
        this.vtbl.get_ExclusiveAccessOwner := CallbackCreate(GetMethod(implObj, "get_ExclusiveAccessOwner"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EjectMedia)
        CallbackFree(this.vtbl.CloseTray)
        CallbackFree(this.vtbl.AcquireExclusiveAccess)
        CallbackFree(this.vtbl.ReleaseExclusiveAccess)
        CallbackFree(this.vtbl.DisableMcn)
        CallbackFree(this.vtbl.EnableMcn)
        CallbackFree(this.vtbl.InitializeDiscRecorder)
        CallbackFree(this.vtbl.get_ActiveDiscRecorder)
        CallbackFree(this.vtbl.get_VendorId)
        CallbackFree(this.vtbl.get_ProductId)
        CallbackFree(this.vtbl.get_ProductRevision)
        CallbackFree(this.vtbl.get_VolumeName)
        CallbackFree(this.vtbl.get_VolumePathNames)
        CallbackFree(this.vtbl.get_DeviceCanLoadMedia)
        CallbackFree(this.vtbl.get_LegacyDeviceNumber)
        CallbackFree(this.vtbl.get_SupportedFeaturePages)
        CallbackFree(this.vtbl.get_CurrentFeaturePages)
        CallbackFree(this.vtbl.get_SupportedProfiles)
        CallbackFree(this.vtbl.get_CurrentProfiles)
        CallbackFree(this.vtbl.get_SupportedModePages)
        CallbackFree(this.vtbl.get_ExclusiveAccessOwner)
    }
}
