#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\CommandBarFlyoutCommandBarTemplateSettings.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICommandBarFlyoutCommandBar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarFlyoutCommandBar
     * @type {Guid}
     */
    static IID => Guid("{14146e7c-38c4-55c4-b706-ce18f6061e7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FlyoutTemplateSettings"]

    /**
     * @type {CommandBarFlyoutCommandBarTemplateSettings} 
     */
    FlyoutTemplateSettings {
        get => this.get_FlyoutTemplateSettings()
    }

    /**
     * 
     * @returns {CommandBarFlyoutCommandBarTemplateSettings} 
     */
    get_FlyoutTemplateSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CommandBarFlyoutCommandBarTemplateSettings(value)
    }
}
