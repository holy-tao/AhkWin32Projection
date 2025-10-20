#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method, SetDuckingOptionsForCurrentStream, that allows an app to specify that the system shouldn't duck the audio of other streams when the app's audio render stream is active.
 * @remarks
 * 
  * Get an instance of the [IAudioClientDuckingControl](nn-audioclient-iaudioclientduckingcontrol.md) interface by calling [IAudioClient::GetService](nf-audioclient-iaudioclient-getservice.md), passing in the interface ID constant **IID_IAudioClientDuckingControl**.
  * 
  * **IAudioClientDuckingControl** only controls the ducking caused by the audio stream (**IAudioClient**) that the interface is obtained from. 
  * 
  * Audio from applications could continue to be ducked if there are other concurrent applications with streams that cause ducking.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclientduckingcontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClientDuckingControl extends IUnknown{
    /**
     * The interface identifier for IAudioClientDuckingControl
     * @type {Guid}
     */
    static IID => Guid("{c789d381-a28c-4168-b28f-d3a837924dc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetDuckingOptionsForCurrentStream(options) {
        result := ComCall(3, this, "int", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
