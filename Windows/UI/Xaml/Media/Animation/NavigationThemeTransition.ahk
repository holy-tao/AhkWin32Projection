#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\INavigationThemeTransition.ahk
#Include .\INavigationThemeTransitionStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides page navigation animations.
 * @remarks
 * With Windows 10, version 1803, a Frame uses **NavigationThemeTransition** to animate navigation between Pages by default. 
 * 
 * You can use NavigationThemeTransition to add animated transitions when your app navigates between different pieces of content in a [Frame](../windows.ui.xaml.controls/frame.md). You can add NavigationThemeTransition to the [Transitions](../windows.ui.xaml/uielement_transitions.md) collection of the [Page](../windows.ui.xaml.controls/page.md) that is being navigated to, or the [ContentTransitions](../windows.ui.xaml.controls/contentcontrol_contenttransitions.md) collection for the navigation [Frame](../windows.ui.xaml.controls/frame.md). In general, we recommend that you use the frame's [ContentTransitions](../windows.ui.xaml.controls/contentcontrol_contenttransitions.md) property to ensure that transitions occur for all navigation pages.
 * 
 * This example shows NavigationThemeTransition added to the [ContentTransitions](../windows.ui.xaml.controls/contentcontrol_contenttransitions.md) collection of a [Frame](../windows.ui.xaml.controls/frame.md).
 * 
 * ```xaml
 * <Frame ...>
 *     <Frame.ContentTransitions>
 *         <TransitionCollection>
 *             <NavigationThemeTransition/> 
 *         </TransitionCollection> 
 *     </Frame.ContentTransitions> 
 *     ...
 * </Frame> 
 * 
 * ```
 * 
 * ```csharp
 * var frame = new Frame(); 
 * frame.ContentTransitions = new TransitionCollection(); 
 * frame.ContentTransitions.Add(new NavigationThemeTransition()); 
 * 
 * ```
 * 
 * In Windows 10, two different animations are provided for navigation between pages in an app. The navigation animations are represented by subclasses of [NavigationTransitionInfo](navigationtransitioninfo.md).
 * 
 * + *Page Refresh*: Page refresh is the default animation for page navigation. It is a combination of a *slide up* animation and a *fade in* animation for the incoming content. You should use page refresh when you use top level navigation like a navigation menu.
 * 
 * The page refresh animation is represented by the [EntranceNavigationTransitionInfo](entrancenavigationtransitioninfo.md) class. You can use the [EntranceNavigationTransitionInfo.IsTargetElement](/uwp/api/windows.ui.xaml.media.animation.entrancenavigationtransitioninfo.istargetelement) attached property to apply the page refresh motion to a subset of the page; for example, all content excluding the commanding UI of the page.
 * 
 * + *Drill In*: You should use the drill in animation when a user interacts with UI on a page that represents a link to another page. For example, in a page that represents a list of albums, when a user clicks on an album item, there should be a drill in transition to the album page.
 * 
 * The drill in animation is represented by the [DrillInNavigationTransitionInfo](drillinnavigationtransitioninfo.md) class.
 * 
 * By default, NavigationThemeTransition plays a page refresh animation. However, you can override this behavior by setting the [DefaultNavigationTransitionInfo](navigationthemetransition_defaultnavigationtransitioninfo.md) property of NavigationThemeTransition. The [NavigationTransitionInfo](navigationtransitioninfo.md) value of this property is used for all navigation by default.
 * 
 * You can specify the animation to use for a particular navigation by using the overload of [Frame.Navigate](../windows.ui.xaml.controls/frame_navigate_1426351961.md) that takes 3 parameters.
 * 
 * In this example, when a user "drills in" from an album list to a page representing a particular album, a music browsing app requests a drill in animation.
 * 
 * ```csharp
 * void AlbumsListView_ItemClick(object sender, ItemClickEventArgs e) 
 * {
 *     // Get albumId from clicked item... 
 *     Frame.Navigate(typeof(AlbumPage), albumId, new DrillInNavigationTransitionInfo());
 * } 
 * 
 * ```
 * 
 * In addition, you can use the [Frame.GoBack(NavigationTransitionInfo)](../windows.ui.xaml.controls/frame_goback_1076978387.md) to play a specific transition when navigating back in the [Frame](../windows.ui.xaml.controls/frame.md) back stack. This can be useful when you modify navigation behavior dynamically based on screen size; for example, in a responsive master/detail scenario. For more examples, see the [XAML master/detail sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlMasterDetail).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.navigationthemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class NavigationThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationThemeTransition.IID

    /**
     * Identifies the [DefaultNavigationTransitionInfo](navigationthemetransition_defaultnavigationtransitioninfo.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.navigationthemetransition.defaultnavigationtransitioninfoproperty
     * @type {DependencyProperty} 
     */
    static DefaultNavigationTransitionInfoProperty {
        get => NavigationThemeTransition.get_DefaultNavigationTransitionInfoProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultNavigationTransitionInfoProperty() {
        if (!NavigationThemeTransition.HasProp("__INavigationThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.NavigationThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationThemeTransitionStatics.IID)
            NavigationThemeTransition.__INavigationThemeTransitionStatics := INavigationThemeTransitionStatics(factoryPtr)
        }

        return NavigationThemeTransition.__INavigationThemeTransitionStatics.get_DefaultNavigationTransitionInfoProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the default transition used when navigating between pages.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.navigationthemetransition.defaultnavigationtransitioninfo
     * @type {NavigationTransitionInfo} 
     */
    DefaultNavigationTransitionInfo {
        get => this.get_DefaultNavigationTransitionInfo()
        set => this.put_DefaultNavigationTransitionInfo(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [NavigationThemeTransition](navigationthemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.NavigationThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_DefaultNavigationTransitionInfo() {
        if (!this.HasProp("__INavigationThemeTransition")) {
            if ((queryResult := this.QueryInterface(INavigationThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationThemeTransition := INavigationThemeTransition(outPtr)
        }

        return this.__INavigationThemeTransition.get_DefaultNavigationTransitionInfo()
    }

    /**
     * 
     * @param {NavigationTransitionInfo} value 
     * @returns {HRESULT} 
     */
    put_DefaultNavigationTransitionInfo(value) {
        if (!this.HasProp("__INavigationThemeTransition")) {
            if ((queryResult := this.QueryInterface(INavigationThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INavigationThemeTransition := INavigationThemeTransition(outPtr)
        }

        return this.__INavigationThemeTransition.put_DefaultNavigationTransitionInfo(value)
    }

;@endregion Instance Methods
}
