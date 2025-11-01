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
     * 
     * @param {Pointer<BSTR>} pbstrOutputDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmpaudiorenderconfig-get_audiooutputdevice
     */
    get_audioOutputDevice(pbstrOutputDevice) {
        result := ComCall(3, this, "ptr", pbstrOutputDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOutputDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmpaudiorenderconfig-put_audiooutputdevice
     */
    put_audioOutputDevice(bstrOutputDevice) {
        bstrOutputDevice := bstrOutputDevice is String ? BSTR.Alloc(bstrOutputDevice).Value : bstrOutputDevice

        result := ComCall(4, this, "ptr", bstrOutputDevice, "HRESULT")
        return result
    }
}
