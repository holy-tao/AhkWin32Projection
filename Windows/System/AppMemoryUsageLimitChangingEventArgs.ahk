#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppMemoryUsageLimitChangingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [AppMemoryUsageLimitChanging](memorymanager_appmemoryusagelimitchanging.md) event.
 * @remarks
 * Handle the [MemoryManager.AppMemoryUsageLimitChanging](memorymanager_appmemoryusagelimitchanging.md) event to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryusagelimitchangingeventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppMemoryUsageLimitChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppMemoryUsageLimitChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppMemoryUsageLimitChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the old limit for how much total memory the app can use, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryusagelimitchangingeventargs.oldlimit
     * @type {Integer} 
     */
    OldLimit {
        get => this.get_OldLimit()
    }

    /**
     * Gets the new limit for how much total memory the app can use, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryusagelimitchangingeventargs.newlimit
     * @type {Integer} 
     */
    NewLimit {
        get => this.get_NewLimit()
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
    get_OldLimit() {
        if (!this.HasProp("__IAppMemoryUsageLimitChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppMemoryUsageLimitChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryUsageLimitChangingEventArgs := IAppMemoryUsageLimitChangingEventArgs(outPtr)
        }

        return this.__IAppMemoryUsageLimitChangingEventArgs.get_OldLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewLimit() {
        if (!this.HasProp("__IAppMemoryUsageLimitChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppMemoryUsageLimitChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryUsageLimitChangingEventArgs := IAppMemoryUsageLimitChangingEventArgs(outPtr)
        }

        return this.__IAppMemoryUsageLimitChangingEventArgs.get_NewLimit()
    }

;@endregion Instance Methods
}
