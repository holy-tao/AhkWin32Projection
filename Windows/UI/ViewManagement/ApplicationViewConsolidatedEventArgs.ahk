#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationViewConsolidatedEventArgs.ahk
#Include .\IApplicationViewConsolidatedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the results of a window (app view) consolidation operation.
 * @remarks
 * Your app receives this class in its [Consolidated](applicationview_consolidated.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewconsolidatedeventargs
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewConsolidatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationViewConsolidatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationViewConsolidatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the window consolidation was user-initiated.
     * @remarks
     * This property is **true** if the window consolidation was due to the user performing a close gesture. Otherwise, windows consolidation could be system-initiated or app-initiated (by a call to [ApplicationView.TryConsolidateAsync](./applicationview_tryconsolidateasync_451004985.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewconsolidatedeventargs.isuserinitiated
     * @type {Boolean} 
     */
    IsUserInitiated {
        get => this.get_IsUserInitiated()
    }

    /**
     * Gets a value that indicates whether the window consolidation was app-initiated.
     * @remarks
     * This property is **true** if the window consolidation was due to a call to [ApplicationView.TryConsolidateAsync](./applicationview_tryconsolidateasync_451004985.md). Otherwise, window consolidation could be system-initiated or user-initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewconsolidatedeventargs.isappinitiated
     * @type {Boolean} 
     */
    IsAppInitiated {
        get => this.get_IsAppInitiated()
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
    get_IsUserInitiated() {
        if (!this.HasProp("__IApplicationViewConsolidatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IApplicationViewConsolidatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewConsolidatedEventArgs := IApplicationViewConsolidatedEventArgs(outPtr)
        }

        return this.__IApplicationViewConsolidatedEventArgs.get_IsUserInitiated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppInitiated() {
        if (!this.HasProp("__IApplicationViewConsolidatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IApplicationViewConsolidatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewConsolidatedEventArgs2 := IApplicationViewConsolidatedEventArgs2(outPtr)
        }

        return this.__IApplicationViewConsolidatedEventArgs2.get_IsAppInitiated()
    }

;@endregion Instance Methods
}
