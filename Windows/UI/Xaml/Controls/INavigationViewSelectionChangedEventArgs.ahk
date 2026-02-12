#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewSelectionChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewSelectionChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5aa509a0-3a5e-4f54-896c-98b85f819508}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedItem", "get_IsSettingsSelected"]

    /**
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
    }

    /**
     * @type {Boolean} 
     */
    IsSettingsSelected {
        get => this.get_IsSettingsSelected()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSettingsSelected() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
