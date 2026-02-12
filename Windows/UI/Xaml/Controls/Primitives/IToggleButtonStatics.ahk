#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IToggleButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToggleButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{af1eab12-0128-4f67-9c5a-82320c445d19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCheckedProperty", "get_IsThreeStateProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsCheckedProperty {
        get => this.get_IsCheckedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsThreeStateProperty {
        get => this.get_IsThreeStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsCheckedProperty() {
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
    get_IsThreeStateProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
