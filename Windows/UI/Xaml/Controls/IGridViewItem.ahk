#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\GridViewItemTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGridViewItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridViewItem
     * @type {Guid}
     */
    static IID => Guid("{7d9901f1-e7c1-4e83-b470-c9d6d7bda9f5}")

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
     * @type {GridViewItemTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * 
     * @returns {GridViewItemTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GridViewItemTemplateSettings(value)
    }
}
