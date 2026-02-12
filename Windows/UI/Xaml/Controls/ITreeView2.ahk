#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TreeViewNode.ahk
#Include ..\DependencyObject.ahk
#Include ..\DataTemplate.ahk
#Include .\DataTemplateSelector.ahk
#Include ..\Style.ahk
#Include .\StyleSelector.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITreeView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITreeView2
     * @type {Guid}
     */
    static IID => Guid("{4f33a2e6-2f29-55d3-a1ab-1f4a863bf960}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NodeFromContainer", "ContainerFromNode", "ItemFromContainer", "ContainerFromItem", "get_CanDragItems", "put_CanDragItems", "get_CanReorderItems", "put_CanReorderItems", "get_ItemTemplate", "put_ItemTemplate", "get_ItemTemplateSelector", "put_ItemTemplateSelector", "get_ItemContainerStyle", "put_ItemContainerStyle", "get_ItemContainerStyleSelector", "put_ItemContainerStyleSelector", "get_ItemContainerTransitions", "put_ItemContainerTransitions", "get_ItemsSource", "put_ItemsSource", "add_DragItemsStarting", "remove_DragItemsStarting", "add_DragItemsCompleted", "remove_DragItemsCompleted"]

    /**
     * @type {Boolean} 
     */
    CanDragItems {
        get => this.get_CanDragItems()
        set => this.put_CanDragItems(value)
    }

    /**
     * @type {Boolean} 
     */
    CanReorderItems {
        get => this.get_CanReorderItems()
        set => this.put_CanReorderItems(value)
    }

    /**
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

    /**
     * @type {DataTemplateSelector} 
     */
    ItemTemplateSelector {
        get => this.get_ItemTemplateSelector()
        set => this.put_ItemTemplateSelector(value)
    }

    /**
     * @type {Style} 
     */
    ItemContainerStyle {
        get => this.get_ItemContainerStyle()
        set => this.put_ItemContainerStyle(value)
    }

    /**
     * @type {StyleSelector} 
     */
    ItemContainerStyleSelector {
        get => this.get_ItemContainerStyleSelector()
        set => this.put_ItemContainerStyleSelector(value)
    }

    /**
     * @type {TransitionCollection} 
     */
    ItemContainerTransitions {
        get => this.get_ItemContainerTransitions()
        set => this.put_ItemContainerTransitions(value)
    }

    /**
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {TreeViewNode} 
     */
    NodeFromContainer(container) {
        result := ComCall(6, this, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TreeViewNode(result_)
    }

    /**
     * 
     * @param {TreeViewNode} node_ 
     * @returns {DependencyObject} 
     */
    ContainerFromNode(node_) {
        result := ComCall(7, this, "ptr", node_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {IInspectable} 
     */
    ItemFromContainer(container) {
        result := ComCall(8, this, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {IInspectable} item 
     * @returns {DependencyObject} 
     */
    ContainerFromItem(item) {
        result := ComCall(9, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDragItems() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDragItems(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReorderItems() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReorderItems(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplate(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ItemTemplateSelector() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplateSelector(value)
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplateSelector(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_ItemContainerStyle() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerStyle(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_ItemContainerStyleSelector() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StyleSelector(value)
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerStyleSelector(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ItemContainerTransitions() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerTransitions(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ItemsSource(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewDragItemsStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TreeView, TreeViewDragItemsCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
