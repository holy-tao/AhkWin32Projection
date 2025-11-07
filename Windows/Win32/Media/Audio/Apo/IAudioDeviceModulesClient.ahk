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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAudioDeviceModulesManager"]

    /**
     * 
     * @param {IUnknown} pAudioDeviceModulesManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiodevicemodulesclient-setaudiodevicemodulesmanager
     */
    SetAudioDeviceModulesManager(pAudioDeviceModulesManager) {
        result := ComCall(3, this, "ptr", pAudioDeviceModulesManager, "HRESULT")
        return result
    }
}
