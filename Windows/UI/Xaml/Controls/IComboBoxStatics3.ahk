#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBoxStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBoxStatics3
     * @type {Guid}
     */
    static IID => Guid("{949e140f-ce7f-4e41-bdc5-d1d3388ad0a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LightDismissOverlayModeProperty", "get_IsTextSearchEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LightDismissOverlayModeProperty {
        get => this.get_LightDismissOverlayModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTextSearchEnabledProperty {
        get => this.get_IsTextSearchEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LightDismissOverlayModeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTextSearchEnabledProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
