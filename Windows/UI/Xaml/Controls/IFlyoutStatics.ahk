#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFlyoutStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutStatics
     * @type {Guid}
     */
    static IID => Guid("{61364e0b-db75-47e1-b2c3-5b901c3d74b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentProperty", "get_FlyoutPresenterStyleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContentProperty {
        get => this.get_ContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FlyoutPresenterStyleProperty {
        get => this.get_FlyoutPresenterStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContentProperty() {
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
    get_FlyoutPresenterStyleProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
