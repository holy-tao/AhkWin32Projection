#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IContentThemeTransition.ahk
#Include .\IContentThemeTransitionStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior for when the content of a control is changing. This might be applied in addition to [AddDeleteThemeTransition](adddeletethemetransition.md).
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.contentthemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ContentThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentThemeTransition.IID

    /**
     * Identifies the [HorizontalOffset](contentthemetransition_horizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.contentthemetransition.horizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static HorizontalOffsetProperty {
        get => ContentThemeTransition.get_HorizontalOffsetProperty()
    }

    /**
     * Identifies the [VerticalOffset](contentthemetransition_verticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.contentthemetransition.verticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static VerticalOffsetProperty {
        get => ContentThemeTransition.get_VerticalOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalOffsetProperty() {
        if (!ContentThemeTransition.HasProp("__IContentThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContentThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentThemeTransitionStatics.IID)
            ContentThemeTransition.__IContentThemeTransitionStatics := IContentThemeTransitionStatics(factoryPtr)
        }

        return ContentThemeTransition.__IContentThemeTransitionStatics.get_HorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalOffsetProperty() {
        if (!ContentThemeTransition.HasProp("__IContentThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContentThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentThemeTransitionStatics.IID)
            ContentThemeTransition.__IContentThemeTransitionStatics := IContentThemeTransitionStatics(factoryPtr)
        }

        return ContentThemeTransition.__IContentThemeTransitionStatics.get_VerticalOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the transition is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.contentthemetransition.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
        set => this.put_HorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the transition is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.contentthemetransition.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
        set => this.put_VerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContentThemeTransition](contentthemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContentThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IContentThemeTransition")) {
            if ((queryResult := this.QueryInterface(IContentThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentThemeTransition := IContentThemeTransition(outPtr)
        }

        return this.__IContentThemeTransition.get_HorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalOffset(value) {
        if (!this.HasProp("__IContentThemeTransition")) {
            if ((queryResult := this.QueryInterface(IContentThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentThemeTransition := IContentThemeTransition(outPtr)
        }

        return this.__IContentThemeTransition.put_HorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IContentThemeTransition")) {
            if ((queryResult := this.QueryInterface(IContentThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentThemeTransition := IContentThemeTransition(outPtr)
        }

        return this.__IContentThemeTransition.get_VerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalOffset(value) {
        if (!this.HasProp("__IContentThemeTransition")) {
            if ((queryResult := this.QueryInterface(IContentThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentThemeTransition := IContentThemeTransition(outPtr)
        }

        return this.__IContentThemeTransition.put_VerticalOffset(value)
    }

;@endregion Instance Methods
}
