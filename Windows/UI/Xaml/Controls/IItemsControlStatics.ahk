#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include .\ItemsControl.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsControlStatics
     * @type {Guid}
     */
    static IID => Guid("{37dabd89-dcfb-45b8-9afe-874df097905e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemsSourceProperty", "get_ItemTemplateProperty", "get_ItemTemplateSelectorProperty", "get_ItemsPanelProperty", "get_DisplayMemberPathProperty", "get_ItemContainerStyleProperty", "get_ItemContainerStyleSelectorProperty", "get_ItemContainerTransitionsProperty", "get_GroupStyleSelectorProperty", "get_IsGroupingProperty", "GetItemsOwner", "ItemsControlFromItemContainer"]

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
    ItemTemplateSelectorProperty {
        get => this.get_ItemTemplateSelectorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemsPanelProperty {
        get => this.get_ItemsPanelProperty()
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
    ItemContainerStyleProperty {
        get => this.get_ItemContainerStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemContainerStyleSelectorProperty {
        get => this.get_ItemContainerStyleSelectorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemContainerTransitionsProperty {
        get => this.get_ItemContainerTransitionsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GroupStyleSelectorProperty {
        get => this.get_GroupStyleSelectorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsGroupingProperty {
        get => this.get_IsGroupingProperty()
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
    get_ItemTemplateSelectorProperty() {
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
    get_ItemsPanelProperty() {
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
    get_DisplayMemberPathProperty() {
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
    get_ItemContainerStyleProperty() {
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
    get_ItemContainerStyleSelectorProperty() {
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
    get_ItemContainerTransitionsProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GroupStyleSelectorProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsGroupingProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {ItemsControl} 
     */
    GetItemsOwner(element) {
        result := ComCall(16, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemsControl(result_)
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {ItemsControl} 
     */
    ItemsControlFromItemContainer(container) {
        result := ComCall(17, this, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemsControl(result_)
    }
}
