#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputViewOcclusionsChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [OcclusionsChanged](coreinputview_occlusionschanged.md) event.
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Used by frameworks (such as XAML) or custom text controls only.
 * 
 * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusionschangedeventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewOcclusionsChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputViewOcclusionsChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputViewOcclusionsChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of input panes (and associated UI) currently occluding the app.
     * @remarks
     * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusionschangedeventargs.occlusions
     * @type {IVectorView<CoreInputViewOcclusion>} 
     */
    Occlusions {
        get => this.get_Occlusions()
    }

    /**
     * Gets or sets a value that marks the event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @remarks
     * Occluding events can be handled by your app first. If your app doesn't handle the events, they bubble up to any framework that needs to handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusionschangedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
        if (!this.HasProp("__ICoreInputViewOcclusionsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewOcclusionsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewOcclusionsChangedEventArgs := ICoreInputViewOcclusionsChangedEventArgs(outPtr)
        }

        return this.__ICoreInputViewOcclusionsChangedEventArgs.get_Occlusions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreInputViewOcclusionsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewOcclusionsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewOcclusionsChangedEventArgs := ICoreInputViewOcclusionsChangedEventArgs(outPtr)
        }

        return this.__ICoreInputViewOcclusionsChangedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreInputViewOcclusionsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewOcclusionsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewOcclusionsChangedEventArgs := ICoreInputViewOcclusionsChangedEventArgs(outPtr)
        }

        return this.__ICoreInputViewOcclusionsChangedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
