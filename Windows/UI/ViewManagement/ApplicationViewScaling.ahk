#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationViewScaling.ahk
#Include .\IApplicationViewScalingStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods and properties for controlling layout scaling.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewscaling
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewScaling extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationViewScaling

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationViewScaling.IID

    /**
     * Gets a value that indicates whether layout scaling is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewscaling.disablelayoutscaling
     * @type {Boolean} 
     */
    static DisableLayoutScaling {
        get => ApplicationViewScaling.get_DisableLayoutScaling()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_DisableLayoutScaling() {
        if (!ApplicationViewScaling.HasProp("__IApplicationViewScalingStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewScaling")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewScalingStatics.IID)
            ApplicationViewScaling.__IApplicationViewScalingStatics := IApplicationViewScalingStatics(factoryPtr)
        }

        return ApplicationViewScaling.__IApplicationViewScalingStatics.get_DisableLayoutScaling()
    }

    /**
     * Attempts to set the [DisableLayoutScaling](applicationviewscaling_disablelayoutscaling.md) property to the specified value.
     * @remarks
     * This method will always return false on devices other than Xbox.
     * @param {Boolean} disableLayoutScaling **true** to disable layout scaling; **false** to enable it.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewscaling.trysetdisablelayoutscaling
     */
    static TrySetDisableLayoutScaling(disableLayoutScaling) {
        if (!ApplicationViewScaling.HasProp("__IApplicationViewScalingStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewScaling")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewScalingStatics.IID)
            ApplicationViewScaling.__IApplicationViewScalingStatics := IApplicationViewScalingStatics(factoryPtr)
        }

        return ApplicationViewScaling.__IApplicationViewScalingStatics.TrySetDisableLayoutScaling(disableLayoutScaling)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
