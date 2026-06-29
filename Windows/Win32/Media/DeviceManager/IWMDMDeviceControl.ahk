#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDMDeviceControl interface provides methods for controlling playback on a device.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmdevicecontrol
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMDeviceControl extends IUnknown {
    /**
     * The interface identifier for IWMDMDeviceControl
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a04-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMDeviceControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus       : IntPtr
        GetCapabilities : IntPtr
        Play            : IntPtr
        Record          : IntPtr
        Pause           : IntPtr
        Resume          : IntPtr
        Stop            : IntPtr
        Seek            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMDeviceControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetStatus method retrieves the control status of the device.
     * @remarks
     * This call returns status values specific to the device control operations of this interface. The control status can provide information about the state of control-related activities of the device, such as playing, recording, and so on. However, it cannot provide information about the global status of the device, such as whether the device is downloading data or being accessed for some other reason. If the device is busy for any reason other than device control, you receive a busy code and must call the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice-getstatus">IWMDMDeviceControl::GetStatus</a> method for more detailed information.
     * 
     * You must not attempt to call the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-play">Play</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-record">Record</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-pause">Pause</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-resume">Resume</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-stop">Stop</a> methods of this interface if the status value WMDM_STATUS_BUSY is returned and the status value does not contain any other values from the table of status values.
     * @returns {Integer} Pointer to a <b>DWORD</b> that specifies the control status of the device. The control status value specifies one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_READY</td>
     * <td>Windows Media Device Manager and its subcomponents are in a ready state.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_BUSY</td>
     * <td>An operation is currently being performed. Evaluate the other status values to determine which operation it is.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_DEVICECONTROL_PLAYING</td>
     * <td>The device is currently playing.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_DEVICECONTROL_RECORDING</td>
     * <td>The device is currently recording.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_DEVICECONTROL_PAUSED</td>
     * <td>The device is currently paused.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_DEVICECONTROL_REMOTE</td>
     * <td>The play or record operation of the device is being remotely controlled by the application.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_DEVICECONTROL_STREAM</td>
     * <td>The play or record method is streaming data to or from the media device.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-getstatus
     */
    GetStatus() {
        result := ComCall(3, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The GetCapabilities method retrieves the device capabilities to determine what operations the device can perform. The capabilities describe the methods of the device control that are supported by the media device.
     * @remarks
     * Currently, not many devices report their capabilities correctly.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the capabilities of the device. The following flags can be returned in this variable.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANPLAY</td>
     * <td>The media device can play MP3 audio.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANSTREAMPLAY</td>
     * <td>The media device can play streaming audio directly from the host computer.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANRECORD</td>
     * <td>The media device can record audio.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANSTREAMRECORD</td>
     * <td>The media device can record streaming audio directly to the host computer.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANPAUSE</td>
     * <td>The media device can pause during play or record operations.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANRESUME</td>
     * <td>The media device can resume an operation that was paused.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANSTOP</td>
     * <td>The media device can stop playing before the end of a file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_CANSEEK</td>
     * <td>The media device can seek to a position other than the beginning of a file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICECAP_HASSECURECLOCK</td>
     * <td>The media device has a secure clock.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(4, this, "uint*", &pdwCapabilitiesMask := 0, "HRESULT")
        return pdwCapabilitiesMask
    }

    /**
     * The Play method begins playing at the current seek position. If the IWMDMDeviceControl::Seek method has not been called, then playing begins at the beginning of the first file, and the play length is not defined.
     * @remarks
     * This method is used to invoke both device playback (playing an audio track on a storage medium of the media device) and streaming audio playback (streaming audio data from the user's computer to the media device, where it is played). The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-seek">Seek</a> method determines the form of playback that occurs.
     * 
     * Some devices do not support either device playback or streaming audio playback. Before attempting to start playback of a particular type, the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-getcapabilities">GetCapabilities</a> method must be called. If unsupported playback is attempted, this method returns WMDM_E_NOTSUPPORTED.
     * 
     * To determine before invoking the play operation whether an audio format can be played by the media device, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice-getformatsupport">GetFormatSupport</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is busy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The play function is not implemented on this device.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-play
     */
    Play() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Record method begins recording from the device's external record input at the current seek position. The IWMDMDeviceControl::Seek method must be called first.
     * @remarks
     * This method is used to invoke both device recording (recording of an audio track to be stored on the media device) and streaming audio data from the media device to be recorded on the computer. The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-seek">Seek</a> method determines which form of recording occurs.
     * 
     * Some devices do not support either type of recording. The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-getcapabilities">GetCapabilities</a> method must be called before you start recording. If an unsupported type of recording is attempted, this method returns WMDM_E_NOTSUPPORTED.
     * 
     * An argument can be supplied for the <i>pFormat</i> parameter to specify an audio format for recording. To determine the formats supported by the device, see <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice-getformatsupport">GetFormatSupport</a>. If the <i>pFormat</i> parameter is set to <b>NULL</b>, the device records audio data in the default format.
     * 
     * When you use device recording, you must enumerate the storage medium contents to find the new object after the record operation is finished.
     * @param {Pointer<WAVEFORMATEX>} pFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure specifying the format in which the data must be recorded.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is already performing an operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record function is not implemented on this device.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-record
     */
    Record(pFormat) {
        result := ComCall(6, this, WAVEFORMATEX.Ptr, pFormat, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the current play or record session at the current position within the content. (IWMDMDeviceControl.Pause)
     * @remarks
     * The current playback or record session is paused and the current file position is saved. A subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-resume">Resume</a> method restarts the play or record operation at the saved file position.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is already paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pause function is not implemented on this device.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-pause
     */
    Pause() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes the current play or record operation from the file position saved during the call to Pause.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resume function is not implemented on this device.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-resume
     */
    Resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the current record or play operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is busy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stop function is not implemented on this device.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-stop
     */
    Stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The Seek method seeks to a position that is used as the starting point by the Play or Record methods. (IWMDMDeviceControl.Seek)
     * @remarks
     * The seek position is defined by passing either an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface pointing to a location on a storage medium of the device, or an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmoperation">IWMDMOperation</a> interface that has been implemented to support streaming audio. The <b>IWMDMObjectInfo</b> interface can also be passed to describe some point within the object to which the specified interface points.
     * 
     * For device playback, if <b>Seek</b> is not called before <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-play">Play</a>, then playback starts at the first audio track on the first storage medium on the media device.
     * 
     * For device recording, if <b>Seek</b> is not called before <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-record">Record</a>, the record operation fails. The recording length can be limited by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmobjectinfo-setplaylength">IWMDMObjectInfo::SetPlayLength</a> method after returning from the <b>Seek</b> call.
     * @param {Integer} fuMode Mode for the seek operation being performed. The <i>fuMode</i> parameter must be one of the following modes.
     * 
     * <table>
     * <tr>
     * <th>Mode
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_SEEK_BEGIN</td>
     * <td>Seek to a position that is <i>nOffset</i> units after the beginning of the file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SEEK_CURRENT</td>
     * <td>Seek to a position that is <i>nOffset</i> units from the current position.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SEEK_END</td>
     * <td>Seek to a position that is <i>nOffset</i> units before the end of the file.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SEEK_REMOTECONTROL</td>
     * <td>Seek the removable control.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SEEK_STREAMINGAUDIO</td>
     * <td>Seek the streaming audio.</td>
     * </tr>
     * </table>
     * @param {Integer} nOffset Number of units by which the seek operation moves the starting position away from the origin specified by <i>fuMode</i>. The units of <i>nOffset</i> are defined by the content. They can be milliseconds for music, pages for electronic books, and so on.
     * 
     * A positive value for <i>nOffset</i> indicates seeking forward through the file. A negative value indicates seeking backward through the file. Any combination of <i>nOffset</i> and <i>fuMode</i> that indicates seeking to a position before the beginning of the file or after the end of the file is not valid, and causes the method to return E_INVALIDARG.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Seek is not implemented on this device.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-seek
     */
    Seek(fuMode, nOffset) {
        result := ComCall(10, this, "uint", fuMode, "int", nOffset, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMDeviceControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetCapabilities := CallbackCreate(GetMethod(implObj, "GetCapabilities"), flags, 2)
        this.vtbl.Play := CallbackCreate(GetMethod(implObj, "Play"), flags, 1)
        this.vtbl.Record := CallbackCreate(GetMethod(implObj, "Record"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetCapabilities)
        CallbackFree(this.vtbl.Play)
        CallbackFree(this.vtbl.Record)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.Seek)
    }
}
