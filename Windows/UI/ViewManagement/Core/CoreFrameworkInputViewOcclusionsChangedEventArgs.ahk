#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreFrameworkInputViewOcclusionsChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [CoreFrameworkInputView.OcclusionsChanged](coreframeworkinputview_occlusionschanged.md) event.
 * @remarks
 * The application must be in the foreground for the [CoreFrameworkInputView.OcclusionsChanged](coreframeworkinputview_occlusionschanged.md) event to fire.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewocclusionschangedeventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreFrameworkInputViewOcclusionsChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreFrameworkInputViewOcclusionsChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreFrameworkInputViewOcclusionsChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of input panes (and associated UI) currently occluding the app.
     * @remarks
     * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewocclusionschangedeventargs.occlusions
     * @type {IVectorView<CoreInputViewOcclusion>} 
     */
    Occlusions {
        get => this.get_Occlusions()
    }

    /**
     * Gets or sets a value that marks the event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @remarks
     * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputviewocclusionschangedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
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
        if (!this.HasProp("__ICoreFrameworkInputViewOcclusionsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputViewOcclusionsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputViewOcclusionsChangedEventArgs := ICoreFrameworkInputViewOcclusionsChangedEventArgs(outPtr)
        }

        return this.__ICoreFrameworkInputViewOcclusionsChangedEventArgs.get_Occlusions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreFrameworkInputViewOcclusionsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputViewOcclusionsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputViewOcclusionsChangedEventArgs := ICoreFrameworkInputViewOcclusionsChangedEventArgs(outPtr)
        }

        return this.__ICoreFrameworkInputViewOcclusionsChangedEventArgs.get_Handled()
    }

;@endregion Instance Methods
}
