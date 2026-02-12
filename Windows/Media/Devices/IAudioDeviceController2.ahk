#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Effects\AudioCaptureEffectsManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceController2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceController2
     * @type {Guid}
     */
    static IID => Guid("{85326599-4c24-48b0-81dd-0c5cc79ddf05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioCaptureEffectsManager"]

    /**
     * @type {AudioCaptureEffectsManager} 
     */
    AudioCaptureEffectsManager {
        get => this.get_AudioCaptureEffectsManager()
    }

    /**
     * 
     * @returns {AudioCaptureEffectsManager} 
     */
    get_AudioCaptureEffectsManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioCaptureEffectsManager(value)
    }
}
