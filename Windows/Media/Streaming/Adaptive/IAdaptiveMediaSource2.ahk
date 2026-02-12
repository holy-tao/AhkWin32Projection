#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AdaptiveMediaSourceAdvancedSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSource2
     * @type {Guid}
     */
    static IID => Guid("{17890342-6760-4bb9-a58a-f7aa98b08c0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AdvancedSettings"]

    /**
     * @type {AdaptiveMediaSourceAdvancedSettings} 
     */
    AdvancedSettings {
        get => this.get_AdvancedSettings()
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceAdvancedSettings} 
     */
    get_AdvancedSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSourceAdvancedSettings(value)
    }
}
