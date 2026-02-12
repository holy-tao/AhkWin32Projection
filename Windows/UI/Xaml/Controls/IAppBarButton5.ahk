#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\AppBarButtonTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarButton5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarButton5
     * @type {Guid}
     */
    static IID => Guid("{4096fc7f-1aec-4b0f-a031-ca8c4e06d2ed}")

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
     * @type {AppBarButtonTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * 
     * @returns {AppBarButtonTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBarButtonTemplateSettings(value)
    }
}
