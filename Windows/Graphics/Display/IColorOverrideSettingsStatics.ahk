#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ColorOverrideSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IColorOverrideSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorOverrideSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{b068e05f-c41f-4ac9-afab-827ab6248f9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromDisplayColorOverrideScenario"]

    /**
     * 
     * @param {Integer} overrideScenario 
     * @returns {ColorOverrideSettings} 
     */
    CreateFromDisplayColorOverrideScenario(overrideScenario) {
        result := ComCall(6, this, "int", overrideScenario, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ColorOverrideSettings(result_)
    }
}
