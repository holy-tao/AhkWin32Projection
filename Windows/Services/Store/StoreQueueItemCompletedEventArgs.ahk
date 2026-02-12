#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreQueueItemCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [Completed](storequeueitem_completed.md) event of the [StoreQueueItem](storequeueitem.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemcompletedeventargs
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreQueueItemCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreQueueItemCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreQueueItemCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the completed item in the download and installation queue.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemcompletedeventargs.status
     * @type {StoreQueueItemStatus} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {StoreQueueItemStatus} 
     */
    get_Status() {
        if (!this.HasProp("__IStoreQueueItemCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItemCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItemCompletedEventArgs := IStoreQueueItemCompletedEventArgs(outPtr)
        }

        return this.__IStoreQueueItemCompletedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
