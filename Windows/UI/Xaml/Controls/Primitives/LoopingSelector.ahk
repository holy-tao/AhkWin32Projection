#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Control.ahk
#Include .\ILoopingSelector.ahk
#Include .\ILoopingSelectorStatics.ahk
#Include ..\SelectionChangedEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\SelectionChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * An infinitely scrolling selection control.
 * @remarks
 * <!--No XAML syntax for this class. Can't be used as a XAML element because there is no public constructor. Properties of the class can be set indirectly though, because it is a Control and therefore has an implicit style via the key "primitives:LoopingSelector" in generic.xaml.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class LoopingSelector extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoopingSelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoopingSelector.IID

    /**
     * Identifies the [ShouldLoop](loopingselector_shouldloop.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.shouldloopproperty
     * @type {DependencyProperty} 
     */
    static ShouldLoopProperty {
        get => LoopingSelector.get_ShouldLoopProperty()
    }

    /**
     * Identifies the [Items](loopingselector_items.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemsproperty
     * @type {DependencyProperty} 
     */
    static ItemsProperty {
        get => LoopingSelector.get_ItemsProperty()
    }

    /**
     * Identifies the [SelectedIndex](loopingselector_selectedindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.selectedindexproperty
     * @type {DependencyProperty} 
     */
    static SelectedIndexProperty {
        get => LoopingSelector.get_SelectedIndexProperty()
    }

    /**
     * Identifies the [SelectedItem](loopingselector_selecteditem.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.selecteditemproperty
     * @type {DependencyProperty} 
     */
    static SelectedItemProperty {
        get => LoopingSelector.get_SelectedItemProperty()
    }

    /**
     * Identifies the [ItemWidth](loopingselector_itemwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemwidthproperty
     * @type {DependencyProperty} 
     */
    static ItemWidthProperty {
        get => LoopingSelector.get_ItemWidthProperty()
    }

    /**
     * Identifies the [ItemHeight](loopingselector_itemheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemheightproperty
     * @type {DependencyProperty} 
     */
    static ItemHeightProperty {
        get => LoopingSelector.get_ItemHeightProperty()
    }

    /**
     * Identifies the [ItemTemplate](loopingselector_itemtemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemtemplateproperty
     * @type {DependencyProperty} 
     */
    static ItemTemplateProperty {
        get => LoopingSelector.get_ItemTemplateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShouldLoopProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_ShouldLoopProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemsProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_ItemsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedIndexProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_SelectedIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedItemProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_SelectedItemProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemWidthProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_ItemWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemHeightProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_ItemHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ItemTemplateProperty() {
        if (!LoopingSelector.HasProp("__ILoopingSelectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LoopingSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoopingSelectorStatics.IID)
            LoopingSelector.__ILoopingSelectorStatics := ILoopingSelectorStatics(factoryPtr)
        }

        return LoopingSelector.__ILoopingSelectorStatics.get_ItemTemplateProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that determines whether the [LoopingSelector](loopingselector.md) loops indefinitely.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.shouldloop
     * @type {Boolean} 
     */
    ShouldLoop {
        get => this.get_ShouldLoop()
        set => this.put_ShouldLoop(value)
    }

    /**
     * Gets a list of the [LoopingSelectorItem](loopingselectoritem.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.items
     * @type {IVector<IInspectable>} 
     */
    Items {
        get => this.get_Items()
        set => this.put_Items(value)
    }

    /**
     * Gets or sets the index of the [LoopingSelectorItem](loopingselectoritem.md) that is displayed in the [LoopingSelector](loopingselector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    /**
     * Gets or sets the [LoopingSelectorItem](loopingselectoritem.md) that is displayed in the [LoopingSelector](loopingselector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * Gets or sets the width of a [LoopingSelectorItem](loopingselectoritem.md) that is contained in a [LoopingSelector](loopingselector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemwidth
     * @type {Integer} 
     */
    ItemWidth {
        get => this.get_ItemWidth()
        set => this.put_ItemWidth(value)
    }

    /**
     * Gets or sets the height of a [LoopingSelectorItem](loopingselectoritem.md) that is contained in a [LoopingSelector](loopingselector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemheight
     * @type {Integer} 
     */
    ItemHeight {
        get => this.get_ItemHeight()
        set => this.put_ItemHeight(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display each [LoopingSelectorItem](loopingselectoritem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselector.itemtemplate
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

    /**
     * Occurs when the currently selected item changes.
     * @type {SelectionChangedEventHandler}
    */
    OnSelectionChanged {
        get {
            if(!this.HasProp("__OnSelectionChanged")){
                this.__OnSelectionChanged := WinRTEventHandler(
                    SelectionChangedEventHandler,
                    SelectionChangedEventHandler.IID,
                    IInspectable,
                    SelectionChangedEventArgs
                )
                this.__OnSelectionChangedToken := this.add_SelectionChanged(this.__OnSelectionChanged.iface)
            }
            return this.__OnSelectionChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSelectionChangedToken")) {
            this.remove_SelectionChanged(this.__OnSelectionChangedToken)
            this.__OnSelectionChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldLoop() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_ShouldLoop()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldLoop(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_ShouldLoop(value)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_Items() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_Items()
    }

    /**
     * 
     * @param {IVector<IInspectable>} value 
     * @returns {HRESULT} 
     */
    put_Items(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_Items(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_SelectedIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_SelectedIndex(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_SelectedItem()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_SelectedItem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemWidth() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_ItemWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ItemWidth(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_ItemWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemHeight() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_ItemHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ItemHeight(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_ItemHeight(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.get_ItemTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemTemplate(value) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.put_ItemTemplate(value)
    }

    /**
     * 
     * @param {SelectionChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.add_SelectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        if (!this.HasProp("__ILoopingSelector")) {
            if ((queryResult := this.QueryInterface(ILoopingSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoopingSelector := ILoopingSelector(outPtr)
        }

        return this.__ILoopingSelector.remove_SelectionChanged(token)
    }

;@endregion Instance Methods
}
