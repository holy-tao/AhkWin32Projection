#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicApplicationPreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides preview functionality that let apps interact with the holographic shell, allowing the user to see content in the world around them.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographicapplicationpreview
 * @namespace Windows.ApplicationModel.Preview.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicApplicationPreview extends IInspectable {
;@region Static Methods
    /**
     * Gets whether the current app view will display in a Mixed Reality headset.
     * @remarks
     * On a Desktop PC, users can launch apps in either the desktop or holographic shell.  This method lets an app reason about whether the current thread's CoreApplicationView is displaying within a Mixed Reality headset, rather than on a monitor or other display.  This method is most useful for 2D views, as holographic views (i.e. views for which HolographicSpace.CreateForCoreWindow has been called) will always return true.
     * 
     * On HoloLens, all views are displayed within the headset, and so this will return true for all views.
     * 
     * It is an error to call this method when the current thread is not the dispatcher thread for a CoreApplicationView.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographicapplicationpreview.iscurrentviewpresentedonholographicdisplay
     */
    static IsCurrentViewPresentedOnHolographicDisplay() {
        if (!HolographicApplicationPreview.HasProp("__IHolographicApplicationPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Preview.Holographic.HolographicApplicationPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicApplicationPreviewStatics.IID)
            HolographicApplicationPreview.__IHolographicApplicationPreviewStatics := IHolographicApplicationPreviewStatics(factoryPtr)
        }

        return HolographicApplicationPreview.__IHolographicApplicationPreviewStatics.IsCurrentViewPresentedOnHolographicDisplay()
    }

    /**
     * Gets whether a given app activation is targeted at the holographic shell.
     * @remarks
     * On a Desktop PC, users can launch an app from either the desktop Start Menu or the holographic Start Menu if they have a Mixed Reality headset.  Users can also activate applications through protocol activations in either the desktop or holographic shell, for example by clicking a link in another app currently located in that shell.  This method lets an app reason about whether a given app activation is targeting the holographic shell or not, which may affect how the app chooses to inititalize its views.
     * 
     * On HoloLens, this will return true for all activations.
     * @param {IActivatedEventArgs} activatedEventArgs The app activation to inspect.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographicapplicationpreview.isholographicactivation
     */
    static IsHolographicActivation(activatedEventArgs) {
        if (!HolographicApplicationPreview.HasProp("__IHolographicApplicationPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Preview.Holographic.HolographicApplicationPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicApplicationPreviewStatics.IID)
            HolographicApplicationPreview.__IHolographicApplicationPreviewStatics := IHolographicApplicationPreviewStatics(factoryPtr)
        }

        return HolographicApplicationPreview.__IHolographicApplicationPreviewStatics.IsHolographicActivation(activatedEventArgs)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
