#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Audio Processing Objects (APOs) implement this interface to obtain a reference to an **IAudioDeviceModulesManager** instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iaudiodevicemodulesclient
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
     * Called by the system to pass an instance of **IAudioDeviceModulesManager** to Audio Processing Objects (APOs) that implement the **IAudioDeviceModulesClient** interface.
     * @remarks
     * The following code example illustrates an implementation of **IAudioDeviceModulesClient**.
     * 
     * ```cpp
     * STDMETHODIMP CTestModuleAPO::SetAudioDeviceModulesManager(_In_ IUnknown* pAudioDeviceModulesManager) 
     * {
     *     HRESULT hr = S_OK;
     *     CComQIPtr<Windows::Media::Devices::IAudioDeviceModulesManager> spModuleManager = pAudioDeviceModulesManager;
     *     ComPtr<IVectorView<AudioDeviceModule *>> spModules;
     * 
     *     // Cache the audio modules manager for later use within the apo
     *     m_AudioModulesManager = pAudioDeviceModulesManager;
     * 
     *     // Search the audio modules for a known module
     *     hr = m_pAudioDeviceModulesMgr->FindAllById(KNOWN_MODULE_ID, &spModules);
     * 
     *     if (SUCCEEDED(hr))
     *     {
     *         // do something with the module(s) returned or cache them for later usage
     *         m_KnownModules = spModules;
     *     }
     * 
     *     return hr;
     * }
     * 
     * ```
     * @param {IUnknown} pAudioDeviceModulesManager An **IUnknown** interface representing the **IAudioDeviceModulesManager**.
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiodevicemodulesclient-setaudiodevicemodulesmanager
     */
    SetAudioDeviceModulesManager(pAudioDeviceModulesManager) {
        result := ComCall(3, this, "ptr", pAudioDeviceModulesManager, "HRESULT")
        return result
    }
}
