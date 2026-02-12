#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [SystemNavigationManager.BackRequested](systemnavigationmanager_backrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.backrequestedeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class BackRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the app performed the requested back-navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.backrequestedeventargs.handled
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
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IBackRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackRequestedEventArgs := IBackRequestedEventArgs(outPtr)
        }

        return this.__IBackRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IBackRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackRequestedEventArgs := IBackRequestedEventArgs(outPtr)
        }

        return this.__IBackRequestedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
