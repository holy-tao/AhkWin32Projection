#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ISemanticZoom.ahk
#Include .\ISemanticZoomStatics.ahk
#Include .\SemanticZoomViewChangedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\SemanticZoomViewChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a scrollable control that incorporates two views that have a semantic relationship. For example, the [ZoomedOutView](semanticzoom_zoomedoutview.md) might be an index of titles, and the [ZoomedInView](semanticzoom_zoomedinview.md) might include details and summaries for each of the title entries. Views can be changed using zoom or other interactions.
 * @remarks
 * The SemanticZoom control enables the user to zoom between two different views of the same content so that they can quickly navigate through a large data set. The *zoomed-in* view is the main view of the content. You show the complete data set in this view. The *zoomed-out* view is a higher-level view of the same content. You typically show the group headers for a grouped data set in this view. For example, when viewing an address book, the user could zoom in on a letter and see the names associated with that letter.
 * 
 * To define the zoomed-in view and the zoomed-out view of the SemanticZoom control, you can use any two controls that implement the [ISemanticZoomInformation](isemanticzoominformation.md) interface. The Extensible Application Markup Language (XAML) framework provides several controls that implement this interface: [ListView](/previous-versions/windows/apps/br211837(v=win.10)), [GridView](gridview.md), and [Hub](hub.md). You set these controls to the [ZoomedInView](semanticzoom_zoomedinview.md) and [ZoomedOutView](semanticzoom_zoomedoutview.md) properties of the SemanticZoom.
 * 
 * The user can switch between views with touch using the pinch-in and pinch-out gestures. By default, the zoomed-in view also shows a button that the user can press to activate the zoomed-out view. You can hide the zoom-out button by setting the [IsZoomOutButtonEnabled](semanticzoom_iszoomoutbuttonenabled.md) property to **false**. You can switch between views programmatically by setting the [IsZoomedInViewActive](semanticzoom_iszoomedinviewactive.md) property.
 * 
 * The [ZoomedInView](semanticzoom_zoomedinview.md) and [ZoomedOutView](semanticzoom_zoomedoutview.md) should be synchronized, so if a user selects a group in the [ZoomedOutView](semanticzoom_zoomedoutview.md), the details of that group are shown in the [ZoomedInView](semanticzoom_zoomedinview.md). You can use a [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) or add code to synchronize the views. Any controls that you bind to the same [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) will always have the same current item. If both views use the same [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) as the their data source, the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) will synchronize the views automatically. Otherwise, you can handle the [ViewChangeStarted](semanticzoom_viewchangestarted.md) event and synchronize the items in the event handler like this.
 * 
 * 
 * 
 * ```csharp
 * private void SemanticZoom_ViewChangeStarted(object sender, SemanticZoomViewChangedEventArgs e)
 * {
 *     if (e.IsSourceZoomedInView == false)
 *     {
 *         e.DestinationItem.Item = e.SourceItem.Item;
 *     }
 * }
 * ```
 * 
 * When you use a [GridView](gridview.md) in a SemanticZoom control, always set the [ScrollViewer.IsHorizontalScrollChainingEnabled](scrollviewer_ishorizontalscrollchainingenabled.md) attached property to **false** on the [ScrollViewer](scrollviewer.md) that's in the [GridView](gridview.md)'s control template, like this: `<GridView ScrollViewer.IsHorizontalScrollChainingEnabled="False">`. When you use a [ListView](listview.md) in a SemanticZoom control, always set the [ScrollViewer.IsVerticalScrollChainingEnabled](scrollviewer_isverticalscrollchainingenabled.md) attached property to **false**, like this: `<ListView ScrollViewer.IsVerticalScrollChainingEnabled="False">`.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SemanticZoom extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISemanticZoom

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISemanticZoom.IID

    /**
     * Identifies the [ZoomedInView](semanticzoom_zoomedinview.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.zoomedinviewproperty
     * @type {DependencyProperty} 
     */
    static ZoomedInViewProperty {
        get => SemanticZoom.get_ZoomedInViewProperty()
    }

    /**
     * Identifies the [ZoomedOutView](semanticzoom_zoomedoutview.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.zoomedoutviewproperty
     * @type {DependencyProperty} 
     */
    static ZoomedOutViewProperty {
        get => SemanticZoom.get_ZoomedOutViewProperty()
    }

    /**
     * Identifies the [IsZoomedInViewActive](semanticzoom_iszoomedinviewactive.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.iszoomedinviewactiveproperty
     * @type {DependencyProperty} 
     */
    static IsZoomedInViewActiveProperty {
        get => SemanticZoom.get_IsZoomedInViewActiveProperty()
    }

    /**
     * Identifies the [CanChangeViews](semanticzoom_canchangeviews.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.canchangeviewsproperty
     * @type {DependencyProperty} 
     */
    static CanChangeViewsProperty {
        get => SemanticZoom.get_CanChangeViewsProperty()
    }

    /**
     * Identifies the [IsZoomOutButtonEnabled](semanticzoom_iszoomoutbuttonenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.iszoomoutbuttonenabledproperty
     * @type {DependencyProperty} 
     */
    static IsZoomOutButtonEnabledProperty {
        get => SemanticZoom.get_IsZoomOutButtonEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomedInViewProperty() {
        if (!SemanticZoom.HasProp("__ISemanticZoomStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoom")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticZoomStatics.IID)
            SemanticZoom.__ISemanticZoomStatics := ISemanticZoomStatics(factoryPtr)
        }

        return SemanticZoom.__ISemanticZoomStatics.get_ZoomedInViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomedOutViewProperty() {
        if (!SemanticZoom.HasProp("__ISemanticZoomStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoom")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticZoomStatics.IID)
            SemanticZoom.__ISemanticZoomStatics := ISemanticZoomStatics(factoryPtr)
        }

        return SemanticZoom.__ISemanticZoomStatics.get_ZoomedOutViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomedInViewActiveProperty() {
        if (!SemanticZoom.HasProp("__ISemanticZoomStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoom")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticZoomStatics.IID)
            SemanticZoom.__ISemanticZoomStatics := ISemanticZoomStatics(factoryPtr)
        }

        return SemanticZoom.__ISemanticZoomStatics.get_IsZoomedInViewActiveProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanChangeViewsProperty() {
        if (!SemanticZoom.HasProp("__ISemanticZoomStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoom")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticZoomStatics.IID)
            SemanticZoom.__ISemanticZoomStatics := ISemanticZoomStatics(factoryPtr)
        }

        return SemanticZoom.__ISemanticZoomStatics.get_CanChangeViewsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomOutButtonEnabledProperty() {
        if (!SemanticZoom.HasProp("__ISemanticZoomStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoom")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticZoomStatics.IID)
            SemanticZoom.__ISemanticZoomStatics := ISemanticZoomStatics(factoryPtr)
        }

        return SemanticZoom.__ISemanticZoomStatics.get_IsZoomOutButtonEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the semantically more complete zoomed-in view of the [SemanticZoom](semanticzoom.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.zoomedinview
     * @type {ISemanticZoomInformation} 
     */
    ZoomedInView {
        get => this.get_ZoomedInView()
        set => this.put_ZoomedInView(value)
    }

    /**
     * Gets or sets the zoomed-out view of the [SemanticZoom](semanticzoom.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.zoomedoutview
     * @type {ISemanticZoomInformation} 
     */
    ZoomedOutView {
        get => this.get_ZoomedOutView()
        set => this.put_ZoomedOutView(value)
    }

    /**
     * Gets or sets a value that determines whether the [ZoomedInView](semanticzoom_zoomedinview.md) is the active view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.iszoomedinviewactive
     * @type {Boolean} 
     */
    IsZoomedInViewActive {
        get => this.get_IsZoomedInViewActive()
        set => this.put_IsZoomedInViewActive(value)
    }

    /**
     * Gets or sets a value that declares whether the [SemanticZoom](semanticzoom.md) can change display views.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.canchangeviews
     * @type {Boolean} 
     */
    CanChangeViews {
        get => this.get_CanChangeViews()
        set => this.put_CanChangeViews(value)
    }

    /**
     * Gets or sets a value that indicates whether the [ZoomedInView](semanticzoom_zoomedinview.md) shows a button that activates the [ZoomedOutView](semanticzoom_zoomedoutview.md).
     * @remarks
     * By default, when the zoomed in view is active and receives mouse or keyboard input, the [SemanticZoom](semanticzoom.md) control shows a button the user can click to activate the zoomed out view. To hide this button, set the IsZoomOutButtonEnabled property to **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.iszoomoutbuttonenabled
     * @type {Boolean} 
     */
    IsZoomOutButtonEnabled {
        get => this.get_IsZoomOutButtonEnabled()
        set => this.put_IsZoomOutButtonEnabled(value)
    }

    /**
     * Occurs when a view change is requested.
     * @type {SemanticZoomViewChangedEventHandler}
    */
    OnViewChangeStarted {
        get {
            if(!this.HasProp("__OnViewChangeStarted")){
                this.__OnViewChangeStarted := WinRTEventHandler(
                    SemanticZoomViewChangedEventHandler,
                    SemanticZoomViewChangedEventHandler.IID,
                    IInspectable,
                    SemanticZoomViewChangedEventArgs
                )
                this.__OnViewChangeStartedToken := this.add_ViewChangeStarted(this.__OnViewChangeStarted.iface)
            }
            return this.__OnViewChangeStarted
        }
    }

    /**
     * Occurs when a view change is complete and the view is displayed.
     * @type {SemanticZoomViewChangedEventHandler}
    */
    OnViewChangeCompleted {
        get {
            if(!this.HasProp("__OnViewChangeCompleted")){
                this.__OnViewChangeCompleted := WinRTEventHandler(
                    SemanticZoomViewChangedEventHandler,
                    SemanticZoomViewChangedEventHandler.IID,
                    IInspectable,
                    SemanticZoomViewChangedEventArgs
                )
                this.__OnViewChangeCompletedToken := this.add_ViewChangeCompleted(this.__OnViewChangeCompleted.iface)
            }
            return this.__OnViewChangeCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SemanticZoom](semanticzoom.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoom")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnViewChangeStartedToken")) {
            this.remove_ViewChangeStarted(this.__OnViewChangeStartedToken)
            this.__OnViewChangeStarted.iface.Dispose()
        }

        if(this.HasProp("__OnViewChangeCompletedToken")) {
            this.remove_ViewChangeCompleted(this.__OnViewChangeCompletedToken)
            this.__OnViewChangeCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ISemanticZoomInformation} 
     */
    get_ZoomedInView() {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.get_ZoomedInView()
    }

    /**
     * 
     * @param {ISemanticZoomInformation} value 
     * @returns {HRESULT} 
     */
    put_ZoomedInView(value) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.put_ZoomedInView(value)
    }

    /**
     * 
     * @returns {ISemanticZoomInformation} 
     */
    get_ZoomedOutView() {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.get_ZoomedOutView()
    }

    /**
     * 
     * @param {ISemanticZoomInformation} value 
     * @returns {HRESULT} 
     */
    put_ZoomedOutView(value) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.put_ZoomedOutView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomedInViewActive() {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.get_IsZoomedInViewActive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomedInViewActive(value) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.put_IsZoomedInViewActive(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanChangeViews() {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.get_CanChangeViews()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanChangeViews(value) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.put_CanChangeViews(value)
    }

    /**
     * 
     * @param {SemanticZoomViewChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChangeStarted(handler) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.add_ViewChangeStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewChangeStarted(token) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.remove_ViewChangeStarted(token)
    }

    /**
     * 
     * @param {SemanticZoomViewChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChangeCompleted(handler) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.add_ViewChangeCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewChangeCompleted(token) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.remove_ViewChangeCompleted(token)
    }

    /**
     * Changes from the current active view to the other possible view. For example, if [IsZoomedInViewActive](semanticzoom_iszoomedinviewactive.md) is true, calling this method changes to zoomed-out view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoom.toggleactiveview
     */
    ToggleActiveView() {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.ToggleActiveView()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomOutButtonEnabled() {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.get_IsZoomOutButtonEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomOutButtonEnabled(value) {
        if (!this.HasProp("__ISemanticZoom")) {
            if ((queryResult := this.QueryInterface(ISemanticZoom.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoom := ISemanticZoom(outPtr)
        }

        return this.__ISemanticZoom.put_IsZoomOutButtonEnabled(value)
    }

;@endregion Instance Methods
}
