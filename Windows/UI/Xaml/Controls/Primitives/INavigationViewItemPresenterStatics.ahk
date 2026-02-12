#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class INavigationViewItemPresenterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewItemPresenterStatics
     * @type {Guid}
     */
    static IID => Guid("{52814604-cfc1-5ad5-a3aa-fa355be6bd76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IconProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IconProperty {
        get => this.get_IconProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IconProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
