#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeViewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeViewStatics2
     * @type {Guid}
     */
    static IID => Guid("{16b1c8f9-7aa1-5e38-8218-7bba3ea417c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanDragItemsProperty", "get_CanReorderItemsProperty", "get_ItemTemplateProperty", "get_ItemTemplateSelectorProperty", "get_ItemContainerStyleProperty", "get_ItemContainerStyleSelectorProperty", "get_ItemContainerTransitionsProperty", "get_ItemsSourceProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CanDragItemsProperty {
        get => this.get_CanDragItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanReorderItemsProperty {
        get => this.get_CanReorderItemsProperty()
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
    ItemsSourceProperty {
        get => this.get_ItemsSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CanDragItemsProperty() {
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
    get_CanReorderItemsProperty() {
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
    get_ItemTemplateProperty() {
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
    get_ItemTemplateSelectorProperty() {
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
    get_ItemContainerStyleProperty() {
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
    get_ItemContainerStyleSelectorProperty() {
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
    get_ItemContainerTransitionsProperty() {
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
    get_ItemsSourceProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
