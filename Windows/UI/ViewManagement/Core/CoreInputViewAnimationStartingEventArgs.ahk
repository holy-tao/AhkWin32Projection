#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputViewAnimationStartingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [CoreInputView.PrimaryViewAnimationStarting](coreinputview_primaryviewanimationstarting.md) event.
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Used by frameworks (such as XAML) or custom text controls only.
 * 
 * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewanimationstartingeventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewAnimationStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputViewAnimationStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputViewAnimationStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of [CoreInputViewOcclusion](coreinputviewocclusion.md) objects associated with the animated [CoreInputView](coreinputview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewanimationstartingeventargs.occlusions
     * @type {IVectorView<CoreInputViewOcclusion>} 
     */
    Occlusions {
        get => this.get_Occlusions()
    }

    /**
     * Gets or sets a value that marks the event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @remarks
     * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewanimationstartingeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the interval of time required to complete the [CoreInputView](coreinputview.md) animation.
     * 
     * > [!Important]
     * > The application should use this value when setting any animation durations that are based on the showing or hiding of the [CoreInputView](coreinputview.md). If coordinating animations between the application and the [CoreInputView](coreinputview.md), ensure the application animation does not complete before the [CoreInputView](coreinputview.md) animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewanimationstartingeventargs.animationduration
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
        if (!this.HasProp("__ICoreInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewAnimationStartingEventArgs := ICoreInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreInputViewAnimationStartingEventArgs.get_Occlusions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewAnimationStartingEventArgs := ICoreInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreInputViewAnimationStartingEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewAnimationStartingEventArgs := ICoreInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreInputViewAnimationStartingEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AnimationDuration() {
        if (!this.HasProp("__ICoreInputViewAnimationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewAnimationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewAnimationStartingEventArgs := ICoreInputViewAnimationStartingEventArgs(outPtr)
        }

        return this.__ICoreInputViewAnimationStartingEventArgs.get_AnimationDuration()
    }

;@endregion Instance Methods
}
