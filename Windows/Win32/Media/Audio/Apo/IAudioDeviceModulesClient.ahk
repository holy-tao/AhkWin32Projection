#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Audio Processing Objects (APOs) implement this interface to obtain a reference to an **IAudioDeviceModulesManager** instance.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iaudiodevicemodulesclient
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioDeviceModulesClient extends IUnknown {
    /**
     * The interface identifier for IAudioDeviceModulesClient
     * @type {Guid}
     */
    static IID := Guid("{98f37dac-d0b6-49f5-896a-aa4d169a4c48}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioDeviceModulesClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAudioDeviceModulesManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioDeviceModulesClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IAudioDeviceModulesClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAudioDeviceModulesManager := CallbackCreate(GetMethod(implObj, "SetAudioDeviceModulesManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAudioDeviceModulesManager)
    }
}
