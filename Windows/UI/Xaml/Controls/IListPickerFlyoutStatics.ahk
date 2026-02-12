#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListPickerFlyoutStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListPickerFlyoutStatics
     * @type {Guid}
     */
    static IID => Guid("{fee25b97-8b96-4602-81d2-82fd8e0f7ea8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemsSourceProperty", "get_ItemTemplateProperty", "get_DisplayMemberPathProperty", "get_SelectionModeProperty", "get_SelectedIndexProperty", "get_SelectedItemProperty", "get_SelectedValueProperty", "get_SelectedValuePathProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ItemsSourceProperty {
        get => this.get_ItemsSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemTemplateProperty {
        get => this.get_ItemTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisplayMemberPathProperty {
        get => this.get_DisplayMemberPathProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionModeProperty {
        get => this.get_SelectionModeProperty()
    }

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
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemsSourceProperty() {
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
    get_ItemTemplateProperty() {
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
    get_DisplayMemberPathProperty() {
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
    get_SelectionModeProperty() {
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
    get_SelectedIndexProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr*", &value := 0, "int")
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
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
