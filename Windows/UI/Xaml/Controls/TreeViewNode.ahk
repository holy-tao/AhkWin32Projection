#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ITreeViewNode.ahk
#Include .\ITreeViewNodeStatics.ahk
#Include .\ITreeViewNodeFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a node in a [TreeView](treeview.md) control.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewNode extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewNode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewNode.IID

    /**
     * Identifies the Content dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.ContentProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.contentproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => TreeViewNode.get_ContentProperty()
    }

    /**
     * Identifies the Depth dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.DepthProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.depthproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.depthproperty
     * @type {DependencyProperty} 
     */
    static DepthProperty {
        get => TreeViewNode.get_DepthProperty()
    }

    /**
     * Identifies the IsExpanded dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.IsExpandedProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.isexpandedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.isexpandedproperty
     * @type {DependencyProperty} 
     */
    static IsExpandedProperty {
        get => TreeViewNode.get_IsExpandedProperty()
    }

    /**
     * Identifies the HasChildren dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.HasChildrenProperty](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.haschildrenproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.haschildrenproperty
     * @type {DependencyProperty} 
     */
    static HasChildrenProperty {
        get => TreeViewNode.get_HasChildrenProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!TreeViewNode.HasProp("__ITreeViewNodeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewNode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewNodeStatics.IID)
            TreeViewNode.__ITreeViewNodeStatics := ITreeViewNodeStatics(factoryPtr)
        }

        return TreeViewNode.__ITreeViewNodeStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DepthProperty() {
        if (!TreeViewNode.HasProp("__ITreeViewNodeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewNode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewNodeStatics.IID)
            TreeViewNode.__ITreeViewNodeStatics := ITreeViewNodeStatics(factoryPtr)
        }

        return TreeViewNode.__ITreeViewNodeStatics.get_DepthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsExpandedProperty() {
        if (!TreeViewNode.HasProp("__ITreeViewNodeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewNode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewNodeStatics.IID)
            TreeViewNode.__ITreeViewNodeStatics := ITreeViewNodeStatics(factoryPtr)
        }

        return TreeViewNode.__ITreeViewNodeStatics.get_IsExpandedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HasChildrenProperty() {
        if (!TreeViewNode.HasProp("__ITreeViewNodeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewNode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewNodeStatics.IID)
            TreeViewNode.__ITreeViewNodeStatics := ITreeViewNodeStatics(factoryPtr)
        }

        return TreeViewNode.__ITreeViewNodeStatics.get_HasChildrenProperty()
    }

    /**
     * 
     * @returns {TreeViewNode} 
     */
    static CreateInstance() {
        if (!TreeViewNode.HasProp("__ITreeViewNodeFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewNode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewNodeFactory.IID)
            TreeViewNode.__ITreeViewNodeFactory := ITreeViewNodeFactory(factoryPtr)
        }

        return TreeViewNode.__ITreeViewNodeFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the data content for the current node.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.Content](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.content) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.content
     * @type {IInspectable} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the node that is the parent of the current node.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.Parent](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.parent) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.parent
     * @type {TreeViewNode} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * Gets or sets a value that indicates whether the cuurent tree view node is expanded.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.IsExpanded](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.isexpanded) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.isexpanded
     * @type {Boolean} 
     */
    IsExpanded {
        get => this.get_IsExpanded()
        set => this.put_IsExpanded(value)
    }

    /**
     * Gets a value that indicates whether the current node has child items.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.HasChildren](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.haschildren) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.haschildren
     * @type {Boolean} 
     */
    HasChildren {
        get => this.get_HasChildren()
    }

    /**
     * Gets a value that indicates how far the current node is from the root node of the tree.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.Depth](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.depth) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.depth
     * @type {Integer} 
     */
    Depth {
        get => this.get_Depth()
    }

    /**
     * Gets or sets a value that indicates whether the current node has child items that haven't been shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.HasUnrealizedChildren](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.hasunrealizedchildren) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.hasunrealizedchildren
     * @type {Boolean} 
     */
    HasUnrealizedChildren {
        get => this.get_HasUnrealizedChildren()
        set => this.put_HasUnrealizedChildren(value)
    }

    /**
     * Gets the collection of nodes that are children of the current node.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewNode.Children](/windows/winui/api/microsoft.ui.xaml.controls.treeviewnode.children) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewnode.children
     * @type {IVector<TreeViewNode>} 
     */
    Children {
        get => this.get_Children()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Content() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_Content()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.put_Content(value)
    }

    /**
     * 
     * @returns {TreeViewNode} 
     */
    get_Parent() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_Parent()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExpanded() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_IsExpanded()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExpanded(value) {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.put_IsExpanded(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasChildren() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_HasChildren()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Depth() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_Depth()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUnrealizedChildren() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_HasUnrealizedChildren()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HasUnrealizedChildren(value) {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.put_HasUnrealizedChildren(value)
    }

    /**
     * 
     * @returns {IVector<TreeViewNode>} 
     */
    get_Children() {
        if (!this.HasProp("__ITreeViewNode")) {
            if ((queryResult := this.QueryInterface(ITreeViewNode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITreeViewNode := ITreeViewNode(outPtr)
        }

        return this.__ITreeViewNode.get_Children()
    }

;@endregion Instance Methods
}
