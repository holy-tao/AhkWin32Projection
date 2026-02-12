#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IEdgeUIThemeTransition.ahk
#Include .\IEdgeUIThemeTransitionStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior for an edge UI transition. 
  * <!--such as app bar appear disappear?-->
 * @remarks
 * We recommend that you include edge UI by adding an [AppBar](../windows.ui.xaml.controls/appbar.md) via the [BottomAppBar](../windows.ui.xaml.controls/page_bottomappbar.md) and [TopAppBar](../windows.ui.xaml.controls/page_topappbar.md) properties, which will automatically apply all appropriate transitions and interaction behavior for you.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.edgeuithemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EdgeUIThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEdgeUIThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEdgeUIThemeTransition.IID

    /**
     * Identifies the [Edge](edgeuithemetransition_edge.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.edgeuithemetransition.edgeproperty
     * @type {DependencyProperty} 
     */
    static EdgeProperty {
        get => EdgeUIThemeTransition.get_EdgeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EdgeProperty() {
        if (!EdgeUIThemeTransition.HasProp("__IEdgeUIThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EdgeUIThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEdgeUIThemeTransitionStatics.IID)
            EdgeUIThemeTransition.__IEdgeUIThemeTransitionStatics := IEdgeUIThemeTransitionStatics(factoryPtr)
        }

        return EdgeUIThemeTransition.__IEdgeUIThemeTransitionStatics.get_EdgeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the edge position to use for the transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.edgeuithemetransition.edge
     * @type {Integer} 
     */
    Edge {
        get => this.get_Edge()
        set => this.put_Edge(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EdgeUIThemeTransition](edgeuithemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EdgeUIThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Edge() {
        if (!this.HasProp("__IEdgeUIThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEdgeUIThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeUIThemeTransition := IEdgeUIThemeTransition(outPtr)
        }

        return this.__IEdgeUIThemeTransition.get_Edge()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Edge(value) {
        if (!this.HasProp("__IEdgeUIThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEdgeUIThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeUIThemeTransition := IEdgeUIThemeTransition(outPtr)
        }

        return this.__IEdgeUIThemeTransition.put_Edge(value)
    }

;@endregion Instance Methods
}
