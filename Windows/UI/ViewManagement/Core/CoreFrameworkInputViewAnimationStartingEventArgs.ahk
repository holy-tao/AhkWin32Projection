#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreFrameworkInputViewAnimationStartingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [CoreFrameworkInputView.PrimaryViewAnimationStarting](coreframeworkinputview_primaryviewanimationstarting.md) event.
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Used by frameworks (such as XAML) or custom text controls only.
 * 
 * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
 * 
 * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the types from [CoreInputViewKind](coreinputviewkind.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewanimationstartingeventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreFrameworkInputViewAnimationStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreFrameworkInputViewAnimationStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreFrameworkInputViewAnimationStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of [CoreInputViewOcclusion](coreinputviewocclusion.md) objects associated with the animated [CoreFrameworkInputView](coreframeworkinputview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewanimationstartingeventargs.occlusions
     * @type {IVectorView<CoreInputViewOcclusion>} 
     */
    Occlusions {
        get => this.get_Occlusions()
    }

    /**
     * Gets a value that indicates whether the framework should animate on behalf of the application based on other application settings.
     * @remarks
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewanimationstartingeventargs.frameworkanimationrecommended
     * @type {Boolean} 
     */
    FrameworkAnimationRecommended {
        get => this.get_FrameworkAnimationRecommended()
    }

    /**
     * Gets the interval of time required to complete the [CoreFrameworkInputView](coreframeworkinputview.md) animation.
     * @remarks
     * The framework should use this value when setting any animation durations in the primary view that are based on the showing or hiding of the [CoreFrameworkInputView](coreframeworkinputview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewanimationstartingeventargs.animationduration
     * @type {TimeSpan} 
     */
    AnimationDuration {
        get => this.get_AnimationDuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<CoreInputViewOcclusion>} 
     */
    get_Occlusions() {
        if (!this.HasProp("__ICoreFrameworkInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputViewAnimationStartingEventArgs := ICoreFrameworkInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreFrameworkInputViewAnimationStartingEventArgs.get_Occlusions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FrameworkAnimationRecommended() {
        if (!this.HasProp("__ICoreFrameworkInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputViewAnimationStartingEventArgs := ICoreFrameworkInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreFrameworkInputViewAnimationStartingEventArgs.get_FrameworkAnimationRecommended()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AnimationDuration() {
        if (!this.HasProp("__ICoreFrameworkInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputViewAnimationStartingEventArgs := ICoreFrameworkInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreFrameworkInputViewAnimationStartingEventArgs.get_AnimationDuration()
    }

;@endregion Instance Methods
}
