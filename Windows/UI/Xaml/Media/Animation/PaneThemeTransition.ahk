#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IPaneThemeTransition.ahk
#Include .\IPaneThemeTransitionStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior for a panel UI transition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.panethemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PaneThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaneThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaneThemeTransition.IID

    /**
     * Identifies the [Edge](panethemetransition_edge.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.panethemetransition.edgeproperty
     * @type {DependencyProperty} 
     */
    static EdgeProperty {
        get => PaneThemeTransition.get_EdgeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EdgeProperty() {
        if (!PaneThemeTransition.HasProp("__IPaneThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PaneThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaneThemeTransitionStatics.IID)
            PaneThemeTransition.__IPaneThemeTransitionStatics := IPaneThemeTransitionStatics(factoryPtr)
        }

        return PaneThemeTransition.__IPaneThemeTransitionStatics.get_EdgeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the edge position to use for the transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.panethemetransition.edge
     * @type {Integer} 
     */
    Edge {
        get => this.get_Edge()
        set => this.put_Edge(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PaneThemeTransition](panethemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PaneThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Edge() {
        if (!this.HasProp("__IPaneThemeTransition")) {
            if ((queryResult := this.QueryInterface(IPaneThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaneThemeTransition := IPaneThemeTransition(outPtr)
        }

        return this.__IPaneThemeTransition.get_Edge()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Edge(value) {
        if (!this.HasProp("__IPaneThemeTransition")) {
            if ((queryResult := this.QueryInterface(IPaneThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaneThemeTransition := IPaneThemeTransition(outPtr)
        }

        return this.__IPaneThemeTransition.put_Edge(value)
    }

;@endregion Instance Methods
}
