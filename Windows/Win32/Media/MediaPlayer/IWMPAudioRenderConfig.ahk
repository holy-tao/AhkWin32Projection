#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPAudioRenderConfig interface provides methods for setting and retrieving the audio output device used by the Windows Media Player ActiveX control.
 * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nn-wmprealestate-iwmpaudiorenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPAudioRenderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPAudioRenderConfig
     * @type {Guid}
     */
    static IID => Guid("{e79c6349-5997-4ce4-917c-22a3391ec564}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_audioOutputDevice", "put_audioOutputDevice"]

    /**
     */
    audioOutputDevice {
        get => this.get_audioOutputDevice()
        set => this.put_audioOutputDevice(value)
    }

    /**
     * The get_audioOutputDevice method retrieves the current audio output device used by the Windows Media Player ActiveX control.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nf-wmprealestate-iwmpaudiorenderconfig-get_audiooutputdevice
     */
    get_audioOutputDevice(pbstrOutputDevice) {
        result := ComCall(3, this, "ptr", pbstrOutputDevice, "HRESULT")
        return result
    }

    /**
     * The put_audioOutputDevice sets the current audio output device for the Windows Media Player ActiveX control.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmprealestate/nf-wmprealestate-iwmpaudiorenderconfig-put_audiooutputdevice
     */
    put_audioOutputDevice(bstrOutputDevice) {
        bstrOutputDevice := bstrOutputDevice is String ? BSTR.Alloc(bstrOutputDevice).Value : bstrOutputDevice

        result := ComCall(4, this, "ptr", bstrOutputDevice, "HRESULT")
        return result
    }
}
