#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBoxStatics8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBoxStatics8
     * @type {Guid}
     */
    static IID => Guid("{58045172-106b-56a9-a8e4-4b74bf347d4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionFlyoutProperty", "get_ProofingMenuFlyoutProperty", "get_DescriptionProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectionFlyoutProperty {
        get => this.get_SelectionFlyoutProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ProofingMenuFlyoutProperty {
        get => this.get_ProofingMenuFlyoutProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DescriptionProperty {
        get => this.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionFlyoutProperty() {
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
    get_ProofingMenuFlyoutProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DescriptionProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
