#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\ISplitOpenThemeAnimation.ahk
#Include .\ISplitOpenThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that reveals a target UI using a *split* animation.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SplitOpenThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitOpenThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitOpenThemeAnimation.IID

    /**
     * Identifies the [OpenedTargetName](splitopenthemeanimation_openedtargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.openedtargetnameproperty
     * @type {DependencyProperty} 
     */
    static OpenedTargetNameProperty {
        get => SplitOpenThemeAnimation.get_OpenedTargetNameProperty()
    }

    /**
     * Identifies the [OpenedTarget](splitopenthemeanimation_openedtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.openedtargetproperty
     * @type {DependencyProperty} 
     */
    static OpenedTargetProperty {
        get => SplitOpenThemeAnimation.get_OpenedTargetProperty()
    }

    /**
     * Identifies the [ClosedTargetName](splitopenthemeanimation_closedtargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.closedtargetnameproperty
     * @type {DependencyProperty} 
     */
    static ClosedTargetNameProperty {
        get => SplitOpenThemeAnimation.get_ClosedTargetNameProperty()
    }

    /**
     * Identifies the [ClosedTarget](splitopenthemeanimation_closedtarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.closedtargetproperty
     * @type {DependencyProperty} 
     */
    static ClosedTargetProperty {
        get => SplitOpenThemeAnimation.get_ClosedTargetProperty()
    }

    /**
     * Identifies the [ContentTargetName](splitopenthemeanimation_contenttargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttargetnameproperty
     * @type {DependencyProperty} 
     */
    static ContentTargetNameProperty {
        get => SplitOpenThemeAnimation.get_ContentTargetNameProperty()
    }

    /**
     * Identifies the [ContentTarget](splitopenthemeanimation_contenttarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttargetproperty
     * @type {DependencyProperty} 
     */
    static ContentTargetProperty {
        get => SplitOpenThemeAnimation.get_ContentTargetProperty()
    }

    /**
     * Identifies the [OpenedLength](splitopenthemeanimation_openedlength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.openedlengthproperty
     * @type {DependencyProperty} 
     */
    static OpenedLengthProperty {
        get => SplitOpenThemeAnimation.get_OpenedLengthProperty()
    }

    /**
     * Identifies the [ClosedLength](splitopenthemeanimation_closedlength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.closedlengthproperty
     * @type {DependencyProperty} 
     */
    static ClosedLengthProperty {
        get => SplitOpenThemeAnimation.get_ClosedLengthProperty()
    }

    /**
     * Identifies the [OffsetFromCenter](splitopenthemeanimation_offsetfromcenter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.offsetfromcenterproperty
     * @type {DependencyProperty} 
     */
    static OffsetFromCenterProperty {
        get => SplitOpenThemeAnimation.get_OffsetFromCenterProperty()
    }

    /**
     * Identifies the [ContentTranslationDirection](splitopenthemeanimation_contenttranslationdirection.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttranslationdirectionproperty
     * @type {DependencyProperty} 
     */
    static ContentTranslationDirectionProperty {
        get => SplitOpenThemeAnimation.get_ContentTranslationDirectionProperty()
    }

    /**
     * Identifies the [ContentTranslationOffset](splitopenthemeanimation_contenttranslationoffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttranslationoffsetproperty
     * @type {DependencyProperty} 
     */
    static ContentTranslationOffsetProperty {
        get => SplitOpenThemeAnimation.get_ContentTranslationOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenedTargetNameProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_OpenedTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenedTargetProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_OpenedTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedTargetNameProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ClosedTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedTargetProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ClosedTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTargetNameProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ContentTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTargetProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ContentTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpenedLengthProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_OpenedLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClosedLengthProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ClosedLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffsetFromCenterProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_OffsetFromCenterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTranslationDirectionProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ContentTranslationDirectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTranslationOffsetProperty() {
        if (!SplitOpenThemeAnimation.HasProp("__ISplitOpenThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitOpenThemeAnimationStatics.IID)
            SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics := ISplitOpenThemeAnimationStatics(factoryPtr)
        }

        return SplitOpenThemeAnimation.__ISplitOpenThemeAnimationStatics.get_ContentTranslationOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the identifying name of the UI element that will be clipped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.openedtargetname
     * @type {HSTRING} 
     */
    OpenedTargetName {
        get => this.get_OpenedTargetName()
        set => this.put_OpenedTargetName(value)
    }

    /**
     * Gets or sets the UI element that will be clipped.
     * @remarks
     * Don't set this in XAML. For a XAML declaration, use [OpenedTargetName](splitopenthemeanimation_openedtargetname.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.openedtarget
     * @type {DependencyObject} 
     */
    OpenedTarget {
        get => this.get_OpenedTarget()
        set => this.put_OpenedTarget(value)
    }

    /**
     * Gets or sets the identifying name of the UI element that specifies the initial clip size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.closedtargetname
     * @type {HSTRING} 
     */
    ClosedTargetName {
        get => this.get_ClosedTargetName()
        set => this.put_ClosedTargetName(value)
    }

    /**
     * Gets or sets the UI element that specifies the initial clip size.
     * @remarks
     * Don't set this in XAML. For a XAML declaration, use [ClosedTargetName](splitopenthemeanimation_closedtargetname.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.closedtarget
     * @type {DependencyObject} 
     */
    ClosedTarget {
        get => this.get_ClosedTarget()
        set => this.put_ClosedTarget(value)
    }

    /**
     * Gets or sets the identifying name of the UI element that will be translated. Typically this is a child/part of the element identified by [OpenedTargetName](splitopenthemeanimation_openedtargetname.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttargetname
     * @type {HSTRING} 
     */
    ContentTargetName {
        get => this.get_ContentTargetName()
        set => this.put_ContentTargetName(value)
    }

    /**
     * Gets or sets the UI element that will be translated. Typically this is a child/part of the element identified by [OpenedTargetName](splitopenthemeanimation_openedtargetname.md) or [OpenedTarget](splitopenthemeanimation_openedtarget.md).
     * @remarks
     * Don't set this in XAML. For a XAML declaration, use [ContentTargetName](splitopenthemeanimation_contenttargetname.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttarget
     * @type {DependencyObject} 
     */
    ContentTarget {
        get => this.get_ContentTarget()
        set => this.put_ContentTarget(value)
    }

    /**
     * Gets or sets the final size of the target UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.openedlength
     * @type {Float} 
     */
    OpenedLength {
        get => this.get_OpenedLength()
        set => this.put_OpenedLength(value)
    }

    /**
     * Gets or sets the initial size of the target element in the animation direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.closedlength
     * @type {Float} 
     */
    ClosedLength {
        get => this.get_ClosedLength()
        set => this.put_ClosedLength(value)
    }

    /**
     * Gets or sets an offset from the center of the *opened* target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.offsetfromcenter
     * @type {Float} 
     */
    OffsetFromCenter {
        get => this.get_OffsetFromCenter()
        set => this.put_OffsetFromCenter(value)
    }

    /**
     * Gets or sets a value that determines which direction the content should translate when the animation runs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttranslationdirection
     * @type {Integer} 
     */
    ContentTranslationDirection {
        get => this.get_ContentTranslationDirection()
        set => this.put_ContentTranslationDirection(value)
    }

    /**
     * Gets or sets the pixels to translate by when the animation runs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splitopenthemeanimation.contenttranslationoffset
     * @type {Float} 
     */
    ContentTranslationOffset {
        get => this.get_ContentTranslationOffset()
        set => this.put_ContentTranslationOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SplitOpenThemeAnimation](splitopenthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OpenedTargetName() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_OpenedTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OpenedTargetName(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_OpenedTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OpenedTarget() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_OpenedTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_OpenedTarget(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_OpenedTarget(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClosedTargetName() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ClosedTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ClosedTargetName(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ClosedTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ClosedTarget() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ClosedTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ClosedTarget(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ClosedTarget(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentTargetName() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ContentTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentTargetName(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ContentTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ContentTarget() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ContentTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ContentTarget(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ContentTarget(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenedLength() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_OpenedLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OpenedLength(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_OpenedLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ClosedLength() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ClosedLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ClosedLength(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ClosedLength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OffsetFromCenter() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_OffsetFromCenter()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OffsetFromCenter(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_OffsetFromCenter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentTranslationDirection() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ContentTranslationDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ContentTranslationDirection(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ContentTranslationDirection(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContentTranslationOffset() {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.get_ContentTranslationOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ContentTranslationOffset(value) {
        if (!this.HasProp("__ISplitOpenThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISplitOpenThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitOpenThemeAnimation := ISplitOpenThemeAnimation(outPtr)
        }

        return this.__ISplitOpenThemeAnimation.put_ContentTranslationOffset(value)
    }

;@endregion Instance Methods
}
