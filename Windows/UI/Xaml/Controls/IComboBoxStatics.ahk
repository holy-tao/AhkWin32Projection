#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBoxStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBoxStatics
     * @type {Guid}
     */
    static IID => Guid("{3e14c9b1-d15b-4dc9-8110-cf3a117b96e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDropDownOpenProperty", "get_MaxDropDownHeightProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsDropDownOpenProperty {
        get => this.get_IsDropDownOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxDropDownHeightProperty {
        get => this.get_MaxDropDownHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsDropDownOpenProperty() {
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
    get_MaxDropDownHeightProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
