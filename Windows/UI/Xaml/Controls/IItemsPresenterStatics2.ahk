#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsPresenterStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsPresenterStatics2
     * @type {Guid}
     */
    static IID => Guid("{8971632e-7867-4d66-9630-29f1c5f7403f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FooterProperty", "get_FooterTemplateProperty", "get_FooterTransitionsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FooterProperty {
        get => this.get_FooterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FooterTemplateProperty {
        get => this.get_FooterTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FooterTransitionsProperty {
        get => this.get_FooterTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FooterProperty() {
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
    get_FooterTemplateProperty() {
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
    get_FooterTransitionsProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
