#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPAudioRenderConfig interface provides methods for setting and retrieving the audio output device used by the Windows Media Player ActiveX control.
 * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nn-wmprealestate-iwmpaudiorenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPAudioRenderConfig extends IUnknown {
    /**
     * The interface identifier for IWMPAudioRenderConfig
     * @type {Guid}
     */
    static IID := Guid("{e79c6349-5997-4ce4-917c-22a3391ec564}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPAudioRenderConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_audioOutputDevice : IntPtr
        put_audioOutputDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPAudioRenderConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    audioOutputDevice {
        get => this.get_audioOutputDevice()
        set => this.put_audioOutputDevice(value)
    }

    /**
     * The get_audioOutputDevice method retrieves the current audio output device used by the Windows Media Player ActiveX control.
     * @remarks
     * If no default audio device is configured, this method retrieves an empty <b>BSTR</b>.  If the ActiveX control is hosted in the Windows Media Player, and the Player has configured an output device, this method retrieves the output device configured by the Player.
     * 
     * If this method retrieves an empty string, the Windows Media Player ActiveX control will render using the default audio rendering device.
     * @param {Pointer<BSTR>} pbstrOutputDevice An MMDeviceAPI device ID that represents the currently configured audio output device.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmpaudiorenderconfig-get_audiooutputdevice
     */
    get_audioOutputDevice(pbstrOutputDevice) {
        result := ComCall(3, this, BSTR.Ptr, pbstrOutputDevice, "HRESULT")
        return result
    }

    /**
     * The put_audioOutputDevice sets the current audio output device for the Windows Media Player ActiveX control.
     * @remarks
     * This method validates that the endpoint specified in <i>bstrOutputDevice</i> is a valid MMDeviceAPI device identifier string for an audio output endpoint. If it is not a valid identifier, the method fails.  This method does not check to ensure that the specified endpoint is active.
     * @param {BSTR} bstrOutputDevice An MMDeviceAPI device ID that represents the device. If you pass <b>NULL</b> or an empty <b>BSTR</b> to this method, the Windows Media Player ActiveX control reverts to the default audio output device.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmpaudiorenderconfig-put_audiooutputdevice
     */
    put_audioOutputDevice(bstrOutputDevice) {
        bstrOutputDevice := bstrOutputDevice is String ? BSTR.Alloc(bstrOutputDevice).Value : bstrOutputDevice

        result := ComCall(4, this, BSTR, bstrOutputDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPAudioRenderConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_audioOutputDevice := CallbackCreate(GetMethod(implObj, "get_audioOutputDevice"), flags, 2)
        this.vtbl.put_audioOutputDevice := CallbackCreate(GetMethod(implObj, "put_audioOutputDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_audioOutputDevice)
        CallbackFree(this.vtbl.put_audioOutputDevice)
    }
}
