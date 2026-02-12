#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMenuFlyoutStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuFlyoutStatics
     * @type {Guid}
     */
    static IID => Guid("{3dbefba1-9522-4045-9e58-c99b13aab9b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MenuFlyoutPresenterStyleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MenuFlyoutPresenterStyleProperty {
        get => this.get_MenuFlyoutPresenterStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuFlyoutPresenterStyleProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
