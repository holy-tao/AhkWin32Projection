#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ISelectorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectorStatics
     * @type {Guid}
     */
    static IID => Guid("{13300b06-bd10-4e09-bff7-71efb8bbb42b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedIndexProperty", "get_SelectedItemProperty", "get_SelectedValueProperty", "get_SelectedValuePathProperty", "get_IsSynchronizedWithCurrentItemProperty", "GetIsSelectionActive"]

    /**
     * @type {DependencyProperty} 
     */
    SelectedIndexProperty {
        get => this.get_SelectedIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedItemProperty {
        get => this.get_SelectedItemProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedValueProperty {
        get => this.get_SelectedValueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedValuePathProperty {
        get => this.get_SelectedValuePathProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSynchronizedWithCurrentItemProperty {
        get => this.get_IsSynchronizedWithCurrentItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedIndexProperty() {
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
    get_SelectedItemProperty() {
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
    get_SelectedValueProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedValuePathProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSynchronizedWithCurrentItemProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsSelectionActive(element) {
        result := ComCall(11, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
