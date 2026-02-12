#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreWindowResizeManager.ahk
#Include .\ICoreWindowResizeManagerLayoutCapability.ahk
#Include .\ICoreWindowResizeManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a type used to manage [CoreWindow.SizeChanged](corewindow_sizechanged.md) events. This type is used by frameworks (such as XAML) or apps that implement their own IFrameWorkView to synchronize the handover between shell drawn placholder (such as a splash screen) and the apps first drawn frame, so that there is no gap in the transition from one to the other. If your app does not implement the IFrameWorkView itself you should not participate in this synchronization as the framework will do it for you.
 * @remarks
 * When [CoreWindow.SizeChanged](corewindow_sizechanged.md) is fired, call the static [CoreWindowResizeManager.GetForCurrentView](corewindowresizemanager_getforcurrentview_1363600702.md) method to obtain an instance of this type for the current [CoreWindow](corewindow.md).
 * 
 * ```cppwinrt
 * if (m_windowSizeChangeInProgress)
 * {
 *     // A window size change has been initiated and the app has just completed presenting
 *     // the first frame with the new size. Notify the resize manager so that we can abbreviate
 *     // any resize animation and prevent unnecessary delays.
 *     Windows::UI::Core::CoreWindowResizeManager::GetForCurrentView().NotifyLayoutCompleted();
 *     m_windowSizeChangeInProgress = false;
 * }
 * ```
 * 
 * ```cppcx
 * if (m_windowSizeChangeInProgress)
 * {
 *  // A window size change has been initiated and the app has just completed presenting
 *  // the first frame with the new size. Notify the resize manager so we can abbreviate
 *  // any resize animation and prevent unnecessary delays.
 *  CoreWindowResizeManager::GetForCurrentView()->NotifyLayoutCompleted();
 *  m_windowSizeChangeInProgress = false;
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowresizemanager
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindowResizeManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreWindowResizeManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreWindowResizeManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of [CoreWindowResizeManager](corewindowresizemanager.md) for the running app's current [CoreWindow](corewindow.md).
     * @returns {CoreWindowResizeManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowresizemanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!CoreWindowResizeManager.HasProp("__ICoreWindowResizeManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreWindowResizeManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreWindowResizeManagerStatics.IID)
            CoreWindowResizeManager.__ICoreWindowResizeManagerStatics := ICoreWindowResizeManagerStatics(factoryPtr)
        }

        return CoreWindowResizeManager.__ICoreWindowResizeManagerStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the caller should wait for the new layout to complete.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowresizemanager.shouldwaitforlayoutcompletion
     * @type {Boolean} 
     */
    ShouldWaitForLayoutCompletion {
        get => this.get_ShouldWaitForLayoutCompletion()
        set => this.put_ShouldWaitForLayoutCompletion(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the parent [CoreWindow](corewindow.md) object that the new layout has completed.
     * @remarks
     * Call this method when your app has completed any changes to the window layout after a [CoreWindow.SizeChanged](corewindow_sizechanged.md) event, such as a screen rotation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowresizemanager.notifylayoutcompleted
     */
    NotifyLayoutCompleted() {
        if (!this.HasProp("__ICoreWindowResizeManager")) {
            if ((queryResult := this.QueryInterface(ICoreWindowResizeManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowResizeManager := ICoreWindowResizeManager(outPtr)
        }

        return this.__ICoreWindowResizeManager.NotifyLayoutCompleted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldWaitForLayoutCompletion(value) {
        if (!this.HasProp("__ICoreWindowResizeManagerLayoutCapability")) {
            if ((queryResult := this.QueryInterface(ICoreWindowResizeManagerLayoutCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowResizeManagerLayoutCapability := ICoreWindowResizeManagerLayoutCapability(outPtr)
        }

        return this.__ICoreWindowResizeManagerLayoutCapability.put_ShouldWaitForLayoutCompletion(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldWaitForLayoutCompletion() {
        if (!this.HasProp("__ICoreWindowResizeManagerLayoutCapability")) {
            if ((queryResult := this.QueryInterface(ICoreWindowResizeManagerLayoutCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowResizeManagerLayoutCapability := ICoreWindowResizeManagerLayoutCapability(outPtr)
        }

        return this.__ICoreWindowResizeManagerLayoutCapability.get_ShouldWaitForLayoutCompletion()
    }

;@endregion Instance Methods
}
