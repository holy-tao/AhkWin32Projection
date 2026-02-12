#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\AppBarToggleButtonTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarToggleButton5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarToggleButton5
     * @type {Guid}
     */
    static IID => Guid("{9dca3357-c130-4fb6-a1e2-d2b348fe43be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TemplateSettings"]

    /**
     * @type {AppBarToggleButtonTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * 
     * @returns {AppBarToggleButtonTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBarToggleButtonTemplateSettings(value)
    }
}
