#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreFrameworkInputView.ahk
#Include .\ICoreFrameworkInputViewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreFrameworkInputView.ahk
#Include .\CoreFrameworkInputViewAnimationStartingEventArgs.ahk
#Include .\CoreFrameworkInputViewOcclusionsChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides UI frameworks with the ability to handle [PrimaryViewAnimationStarting](coreframeworkinputview_primaryviewanimationstarting.md) and [OcclusionsChanged](coreframeworkinputview_occlusionschanged.md) events after the corresponding [CoreInputView](coreinputview.md) [PrimaryViewAnimationStarting](coreinputview_primaryviewanimationstarting.md) and [OcclusionsChanged](coreinputview_occlusionschanged.md) events.
  * 
  * This enables a framework to control the display of a docked, undocked, moveable, or transitory input pane (and associated UI), receive notifications when the pane is moved, displayed, or hidden, and to determine which portion of the app's window is obscured by the pane.
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Used by frameworks (such as XAML) or custom text controls only.
 * 
 * The framework can use the info exposed by this object to adjust and reflow UI to account for any occlusion.
 * 
 * The CoreFrameworkInputView APIs support the following types of input panes.  
 * 
 * - Docked Soft Input Panel (SIP) like the **Touch keyboard and handwriting panel** – typically, your app UI reflows.
 * - Floating toolbar or SIP – typically, your app UI does not reflow.
 * - Overlay panels such as inline Ink or IME candidate windows – typically, your app UI does not reflow for the edit control, but does reflow for the text/search suggestions.
 * 
 * The input pane appears when the user performs an action that requires them to provide information, such as entering a text field.
 * 
 * By default, Windows handles input pane events and repositions content so that users can see the control with focus.
 * 
 * Call [CoreFrameworkInputView.GetForCurrentView](coreframeworkinputview_getforcurrentview_1363600702.md) to get a CoreFrameworkInputView object.
 * 
 * After you register to receive input pane notifications, the system calls your event delegate whenever the pane is shown or hidden for the foreground window when you called the [CoreFrameworkInputView.GetForCurrentView](coreframeworkinputview_getforcurrentview_1363600702.md) method.
 * 
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputview
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreFrameworkInputView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreFrameworkInputView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreFrameworkInputView.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [CoreFrameworkInputView](coreframeworkinputview.md) object associated with the view having the specified context identifier.
     * @remarks
     * This method fails if it is called in a windowless thread.
     * @param {UIContext} context_ The context identifier of the view for which to get the [CoreFrameworkInputView](coreframeworkinputview.md).
     * @returns {CoreFrameworkInputView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputview.getforuicontext
     */
    static GetForUIContext(context_) {
        if (!CoreFrameworkInputView.HasProp("__ICoreFrameworkInputViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.Core.CoreFrameworkInputView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreFrameworkInputViewStatics.IID)
            CoreFrameworkInputView.__ICoreFrameworkInputViewStatics := ICoreFrameworkInputViewStatics(factoryPtr)
        }

        return CoreFrameworkInputView.__ICoreFrameworkInputViewStatics.GetForUIContext(context_)
    }

    /**
     * Retrieves the [CoreFrameworkInputView](coreframeworkinputview.md) object associated with the current window.
     * @returns {CoreFrameworkInputView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreframeworkinputview.getforcurrentview
     */
    static GetForCurrentView() {
        if (!CoreFrameworkInputView.HasProp("__ICoreFrameworkInputViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.Core.CoreFrameworkInputView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreFrameworkInputViewStatics.IID)
            CoreFrameworkInputView.__ICoreFrameworkInputViewStatics := ICoreFrameworkInputViewStatics(factoryPtr)
        }

        return CoreFrameworkInputView.__ICoreFrameworkInputViewStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPrimaryViewAnimationStartingToken")) {
            this.remove_PrimaryViewAnimationStarting(this.__OnPrimaryViewAnimationStartingToken)
            this.__OnPrimaryViewAnimationStarting.iface.Dispose()
        }

        if(this.HasProp("__OnOcclusionsChangedToken")) {
            this.remove_OcclusionsChanged(this.__OnOcclusionsChangedToken)
            this.__OnOcclusionsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreFrameworkInputView, CoreFrameworkInputViewAnimationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryViewAnimationStarting(handler) {
        if (!this.HasProp("__ICoreFrameworkInputView")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputView := ICoreFrameworkInputView(outPtr)
        }

        return this.__ICoreFrameworkInputView.add_PrimaryViewAnimationStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrimaryViewAnimationStarting(token) {
        if (!this.HasProp("__ICoreFrameworkInputView")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputView := ICoreFrameworkInputView(outPtr)
        }

        return this.__ICoreFrameworkInputView.remove_PrimaryViewAnimationStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreFrameworkInputView, CoreFrameworkInputViewOcclusionsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OcclusionsChanged(handler) {
        if (!this.HasProp("__ICoreFrameworkInputView")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputView := ICoreFrameworkInputView(outPtr)
        }

        return this.__ICoreFrameworkInputView.add_OcclusionsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OcclusionsChanged(token) {
        if (!this.HasProp("__ICoreFrameworkInputView")) {
            if ((queryResult := this.QueryInterface(ICoreFrameworkInputView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreFrameworkInputView := ICoreFrameworkInputView(outPtr)
        }

        return this.__ICoreFrameworkInputView.remove_OcclusionsChanged(token)
    }

;@endregion Instance Methods
}
