#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IIsoSpeedControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsoSpeedControl
     * @type {Guid}
     */
    static IID => Guid("{27b6c322-25ad-4f1b-aaab-524ab376ca33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_SupportedPresets", "get_Preset", "SetPresetAsync"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedPresets {
        get => this.get_SupportedPresets()
    }

    /**
     * @type {Integer} 
     */
    Preset {
        get => this.get_Preset()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPresets() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Preset() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} preset 
     * @returns {IAsyncAction} 
     */
    SetPresetAsync(preset) {
        result := ComCall(9, this, "int", preset, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
