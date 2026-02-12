#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BrightnessOverrideSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IBrightnessOverrideSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrightnessOverrideSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{d487dc90-6f74-440b-b383-5fe96cf00b0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromLevel", "CreateFromNits", "CreateFromDisplayBrightnessOverrideScenario"]

    /**
     * 
     * @param {Float} level 
     * @returns {BrightnessOverrideSettings} 
     */
    CreateFromLevel(level) {
        result := ComCall(6, this, "double", level, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrightnessOverrideSettings(result_)
    }

    /**
     * 
     * @param {Float} nits 
     * @returns {BrightnessOverrideSettings} 
     */
    CreateFromNits(nits) {
        result := ComCall(7, this, "float", nits, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrightnessOverrideSettings(result_)
    }

    /**
     * 
     * @param {Integer} overrideScenario 
     * @returns {BrightnessOverrideSettings} 
     */
    CreateFromDisplayBrightnessOverrideScenario(overrideScenario) {
        result := ComCall(8, this, "int", overrideScenario, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrightnessOverrideSettings(result_)
    }
}
