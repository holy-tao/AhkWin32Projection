#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivationViewSwitcher.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for switching to an app view in response to an activation.
 * @remarks
 * Get an instance of **ActivationViewSwitcher** from the **ViewSwitcher** property of the activation event args.
 * To use the **ActivationViewSwitcher** you must first disable the system view activation policy by calling [DisableSystemViewActivationPolicy](applicationviewswitcher_disablesystemviewactivationpolicy_991265837.md).
 * The first activation of an app cannot use the **ActivationViewSwitcher** to control which view to show. Apps can only use it in subsequent activations.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.activationviewswitcher
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ActivationViewSwitcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivationViewSwitcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivationViewSwitcher.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Shows the view in a new standalone window and sets the size preference for the view.
     * @param {Integer} viewId The identifier for the view.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.activationviewswitcher.showasstandaloneasync
     */
    ShowAsStandaloneAsync(viewId) {
        if (!this.HasProp("__IActivationViewSwitcher")) {
            if ((queryResult := this.QueryInterface(IActivationViewSwitcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationViewSwitcher := IActivationViewSwitcher(outPtr)
        }

        return this.__IActivationViewSwitcher.ShowAsStandaloneAsync(viewId)
    }

    /**
     * Shows the view in a new standalone window.
     * @param {Integer} viewId The identifier for the view.
     * @param {Integer} sizePreference 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.activationviewswitcher.showasstandaloneasync
     */
    ShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference) {
        if (!this.HasProp("__IActivationViewSwitcher")) {
            if ((queryResult := this.QueryInterface(IActivationViewSwitcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationViewSwitcher := IActivationViewSwitcher(outPtr)
        }

        return this.__IActivationViewSwitcher.ShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference)
    }

    /**
     * Returns a value that indicates whether the specified view is present on the virtual desktop that the activation was initiated on.
     * @param {Integer} viewId The identifier for that view that is being activated.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.activationviewswitcher.isviewpresentedonactivationvirtualdesktop
     */
    IsViewPresentedOnActivationVirtualDesktop(viewId) {
        if (!this.HasProp("__IActivationViewSwitcher")) {
            if ((queryResult := this.QueryInterface(IActivationViewSwitcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationViewSwitcher := IActivationViewSwitcher(outPtr)
        }

        return this.__IActivationViewSwitcher.IsViewPresentedOnActivationVirtualDesktop(viewId)
    }

;@endregion Instance Methods
}
