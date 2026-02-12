#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Style.ahk
#Include Primitives\CommandBarTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBar2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBar2
     * @type {Guid}
     */
    static IID => Guid("{57662f58-5b32-475d-be64-4ca36e7b97d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommandBarOverflowPresenterStyle", "put_CommandBarOverflowPresenterStyle", "get_CommandBarTemplateSettings"]

    /**
     * @type {Style} 
     */
    CommandBarOverflowPresenterStyle {
        get => this.get_CommandBarOverflowPresenterStyle()
        set => this.put_CommandBarOverflowPresenterStyle(value)
    }

    /**
     * @type {CommandBarTemplateSettings} 
     */
    CommandBarTemplateSettings {
        get => this.get_CommandBarTemplateSettings()
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CommandBarOverflowPresenterStyle() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CommandBarOverflowPresenterStyle(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CommandBarTemplateSettings} 
     */
    get_CommandBarTemplateSettings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CommandBarTemplateSettings(value)
    }
}
