#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBarStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarStatics2
     * @type {Guid}
     */
    static IID => Guid("{3d9ec8e3-51a9-4e34-956c-7081d06f26f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommandBarOverflowPresenterStyleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CommandBarOverflowPresenterStyleProperty {
        get => this.get_CommandBarOverflowPresenterStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CommandBarOverflowPresenterStyleProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
