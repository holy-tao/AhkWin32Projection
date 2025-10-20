#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Audio Processing Objects (APOs) implement this interface to obtain a reference to an **IAudioDeviceModulesManager** instance.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudiodevicemodulesclient
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioDeviceModulesClient extends IUnknown{
    /**
     * The interface identifier for IAudioDeviceModulesClient
     * @type {Guid}
     */
    static IID => Guid("{98f37dac-d0b6-49f5-896a-aa4d169a4c48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pAudioDeviceModulesManager 
     * @returns {HRESULT} 
     */
    SetAudioDeviceModulesManager(pAudioDeviceModulesManager) {
        result := ComCall(3, this, "ptr", pAudioDeviceModulesManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
