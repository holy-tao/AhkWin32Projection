#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IButtonStaticsWithFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IButtonStaticsWithFlyout
     * @type {Guid}
     */
    static IID => Guid("{90143898-a16c-4759-b2f0-a5f7e625169e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FlyoutProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FlyoutProperty {
        get => this.get_FlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FlyoutProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
