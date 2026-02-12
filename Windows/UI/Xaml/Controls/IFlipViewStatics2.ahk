#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFlipViewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlipViewStatics2
     * @type {Guid}
     */
    static IID => Guid("{70e3d93f-4308-4ba2-bbce-e2cb0ed34476}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseTouchAnimationsForAllNavigationProperty"]

    /**
     * @type {DependencyProperty} 
     */
    UseTouchAnimationsForAllNavigationProperty {
        get => this.get_UseTouchAnimationsForAllNavigationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_UseTouchAnimationsForAllNavigationProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
