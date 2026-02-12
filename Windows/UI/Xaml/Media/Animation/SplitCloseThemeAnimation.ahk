#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\ISplitCloseThemeAnimation.ahk
#Include .\ISplitCloseThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that conceals a target UI using a *split* animation.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SplitCloseThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitCloseThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitCloseThemeAnimation.IID

    /**
     * Identifies the [OpenedTargetName](splitclosethemeanimation_openedtargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.openedtargetnameproperty
     * @type {DependencyProperty} 
     */
    static OpenedTargetNameProperty {
        get => SplitCloseThemeAnimation.get_OpenedTargetNameProperty()
    }

    /**
     * Identifies the [OpenedTarget](splitclosethemeanimation_openedtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.openedtargetproperty
     * @type {DependencyProperty} 
     */
    static OpenedTargetProperty {
        get => SplitCloseThemeAnimation.get_OpenedTargetProperty()
    }

    /**
     * Identifies the [ClosedTargetName](splitclosethemeanimation_closedtargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.closedtargetnameproperty
     * @type {DependencyProperty} 
     */
    static ClosedTargetNameProperty {
        get => SplitCloseThemeAnimation.get_ClosedTargetNameProperty()
    }

    /**
     * Identifies the [ClosedTarget](splitclosethemeanimation_closedtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.closedtargetproperty
     * @type {DependencyProperty} 
     */
    static ClosedTargetProperty {
        get => SplitCloseThemeAnimation.get_ClosedTargetProperty()
    }

    /**
     * Identifies the [ContentTargetName](splitclosethemeanimation_contenttargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttargetnameproperty
     * @type {DependencyProperty} 
     */
    static ContentTargetNameProperty {
        get => SplitCloseThemeAnimation.get_ContentTargetNameProperty()
    }

    /**
     * Identifies the [ContentTarget](splitclosethemeanimation_contenttarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttargetproperty
     * @type {DependencyProperty} 
     */
    static ContentTargetProperty {
        get => SplitCloseThemeAnimation.get_ContentTargetProperty()
    }

    /**
     * Identifies the [OpenedLength](splitclosethemeanimation_openedlength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.openedlengthproperty
     * @type {DependencyProperty} 
     */
    static OpenedLengthProperty {
        get => SplitCloseThemeAnimation.get_OpenedLengthProperty()
    }

    /**
     * Identifies the [ClosedLength](splitclosethemeanimation_closedlength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.closedlengthproperty
     * @type {DependencyProperty} 
     */
    static ClosedLengthProperty {
        get => SplitCloseThemeAnimation.get_ClosedLengthProperty()
    }

    /**
     * Identifies the [OffsetFromCenter](splitclosethemeanimation_offsetfromcenter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.offsetfromcenterproperty
     * @type {DependencyProperty} 
     */
    static OffsetFromCenterProperty {
        get => SplitCloseThemeAnimation.get_OffsetFromCenterProperty()
    }

    /**
     * Identifies the [ContentTranslationDirection](splitclosethemeanimation_contenttranslationdirection.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttranslationdirectionproperty
     * @type {DependencyProperty} 
     */
    static ContentTranslationDirectionProperty {
        get => SplitCloseThemeAnimation.get_ContentTranslationDirectionProperty()
    }

    /**
     * Identifies the [ContentTranslationOffset](splitclosethemeanimation_contenttranslationoffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttranslationoffsetproperty
     * @type {DependencyProperty} 
     */
    static ContentTranslationOffsetProperty {
        get => SplitCloseThemeAnimation.get_ContentTranslationOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenedTargetNameProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_OpenedTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenedTargetProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_OpenedTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedTargetNameProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ClosedTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedTargetProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ClosedTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTargetNameProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ContentTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTargetProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ContentTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenedLengthProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_OpenedLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedLengthProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ClosedLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffsetFromCenterProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_OffsetFromCenterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTranslationDirectionProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ContentTranslationDirectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTranslationOffsetProperty() {
        if (!SplitCloseThemeAnimation.HasProp("__ISplitCloseThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitCloseThemeAnimationStatics.IID)
            SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics := ISplitCloseThemeAnimationStatics(factoryPtr)
        }

        return SplitCloseThemeAnimation.__ISplitCloseThemeAnimationStatics.get_ContentTranslationOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the identifying name of the UI element that will be clipped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.openedtargetname
     * @type {HSTRING} 
     */
    OpenedTargetName {
        get => this.get_OpenedTargetName()
        set => this.put_OpenedTargetName(value)
    }

    /**
     * Gets or sets the UI element that will be clipped.
     * @remarks
     * Don't set this in XAML. For a XAML declaration, use [OpenedTargetName](splitclosethemeanimation_openedtargetname.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.openedtarget
     * @type {DependencyObject} 
     */
    OpenedTarget {
        get => this.get_OpenedTarget()
        set => this.put_OpenedTarget(value)
    }

    /**
     * Gets or sets the identifying name of the UI element that specifies the initial clip size.
     * @remarks
     * If this target is not provided, the animation runs assuming that the split will happen from the center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.closedtargetname
     * @type {HSTRING} 
     */
    ClosedTargetName {
        get => this.get_ClosedTargetName()
        set => this.put_ClosedTargetName(value)
    }

    /**
     * Gets or sets the UI element that specifies the initial clip size.
     * @remarks
     * Don't set this in XAML. For a XAML declaration, use [ClosedTargetName](splitclosethemeanimation_closedtargetname.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.closedtarget
     * @type {DependencyObject} 
     */
    ClosedTarget {
        get => this.get_ClosedTarget()
        set => this.put_ClosedTarget(value)
    }

    /**
     * Gets or sets the identifying name of the UI element that will be translated. Typically this is a child/part of the element identified by [OpenedTargetName](splitclosethemeanimation_openedtargetname.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttargetname
     * @type {HSTRING} 
     */
    ContentTargetName {
        get => this.get_ContentTargetName()
        set => this.put_ContentTargetName(value)
    }

    /**
     * Gets or sets the UI element that will be translated. Typically this is a child/part of the element identified by [OpenedTargetName](splitclosethemeanimation_openedtargetname.md) or [OpenedTarget](splitclosethemeanimation_openedtarget.md).
     * @remarks
     * Don't set this in XAML. For a XAML declaration, use [ContentTargetName](splitclosethemeanimation_contenttargetname.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttarget
     * @type {DependencyObject} 
     */
    ContentTarget {
        get => this.get_ContentTarget()
        set => this.put_ContentTarget(value)
    }

    /**
     * Gets or sets the final size of the target UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.openedlength
     * @type {Float} 
     */
    OpenedLength {
        get => this.get_OpenedLength()
        set => this.put_OpenedLength(value)
    }

    /**
     * Gets or sets the initial size of the target element in the animation direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.closedlength
     * @type {Float} 
     */
    ClosedLength {
        get => this.get_ClosedLength()
        set => this.put_ClosedLength(value)
    }

    /**
     * Gets or sets an offset from the center of the *opened* target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.offsetfromcenter
     * @type {Float} 
     */
    OffsetFromCenter {
        get => this.get_OffsetFromCenter()
        set => this.put_OffsetFromCenter(value)
    }

    /**
     * Gets or sets a value that determines which direction the content should translate when the animation runs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttranslationdirection
     * @type {Integer} 
     */
    ContentTranslationDirection {
        get => this.get_ContentTranslationDirection()
        set => this.put_ContentTranslationDirection(value)
    }

    /**
     * Gets or sets the pixels to translate by when the animation runs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitclosethemeanimation.contenttranslationoffset
     * @type {Float} 
     */
    ContentTranslationOffset {
        get => this.get_ContentTranslationOffset()
        set => this.put_ContentTranslationOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SplitCloseThemeAnimation](splitclosethemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OpenedTargetName() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_OpenedTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OpenedTargetName(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_OpenedTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OpenedTarget() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_OpenedTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_OpenedTarget(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_OpenedTarget(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClosedTargetName() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ClosedTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ClosedTargetName(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ClosedTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ClosedTarget() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ClosedTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ClosedTarget(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ClosedTarget(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentTargetName() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ContentTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentTargetName(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ContentTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ContentTarget() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ContentTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ContentTarget(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ContentTarget(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenedLength() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_OpenedLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OpenedLength(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_OpenedLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ClosedLength() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ClosedLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ClosedLength(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ClosedLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OffsetFromCenter() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_OffsetFromCenter()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OffsetFromCenter(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_OffsetFromCenter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentTranslationDirection() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ContentTranslationDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ContentTranslationDirection(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ContentTranslationDirection(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContentTranslationOffset() {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.get_ContentTranslationOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ContentTranslationOffset(value) {
        if (!this.HasProp("__ISplitCloseThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitCloseThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitCloseThemeAnimation := ISplitCloseThemeAnimation(outPtr)
        }

        return this.__ISplitCloseThemeAnimation.put_ContentTranslationOffset(value)
    }

;@endregion Instance Methods
}
