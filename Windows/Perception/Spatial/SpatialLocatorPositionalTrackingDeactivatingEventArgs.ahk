#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialLocatorPositionalTrackingDeactivatingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [SpatialLocator.PositionalTrackingDeactivating](spatiallocator_positionaltrackingdeactivating.md) event.
 * @remarks
 * Set the [Canceled](spatiallocatorpositionaltrackingdeactivatingeventargs_canceled.md) property to true to prevent positional tracking from deactivating due to inactivity.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorpositionaltrackingdeactivatingeventargs
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialLocatorPositionalTrackingDeactivatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialLocatorPositionalTrackingDeactivatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialLocatorPositionalTrackingDeactivatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether to cancel the deactivation of positional tracking due to inactivity.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorpositionaltrackingdeactivatingeventargs.canceled
     * @type {Boolean} 
     */
    Canceled {
        get => this.get_Canceled()
        set => this.put_Canceled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Canceled() {
        if (!this.HasProp("__ISpatialLocatorPositionalTrackingDeactivatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorPositionalTrackingDeactivatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorPositionalTrackingDeactivatingEventArgs := ISpatialLocatorPositionalTrackingDeactivatingEventArgs(outPtr)
        }

        return this.__ISpatialLocatorPositionalTrackingDeactivatingEventArgs.get_Canceled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Canceled(value) {
        if (!this.HasProp("__ISpatialLocatorPositionalTrackingDeactivatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorPositionalTrackingDeactivatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorPositionalTrackingDeactivatingEventArgs := ISpatialLocatorPositionalTrackingDeactivatingEventArgs(outPtr)
        }

        return this.__ISpatialLocatorPositionalTrackingDeactivatingEventArgs.put_Canceled(value)
    }

;@endregion Instance Methods
}
