#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialNavigationCanceledEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialGestureRecognizer.NavigationCanceled event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationcanceledeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialNavigationCanceledEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialNavigationCanceledEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialNavigationCanceledEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of interaction source associated with this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationcanceledeventargs.interactionsourcekind
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InteractionSourceKind() {
        if (!this.HasProp("__ISpatialNavigationCanceledEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationCanceledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationCanceledEventArgs := ISpatialNavigationCanceledEventArgs(outPtr)
        }

        return this.__ISpatialNavigationCanceledEventArgs.get_InteractionSourceKind()
    }

;@endregion Instance Methods
}
