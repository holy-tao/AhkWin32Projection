#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class IStorageItemMostRecentlyUsedList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemMostRecentlyUsedList
     * @type {Guid}
     */
    static IID => Guid("{016239d5-510d-411e-8cf1-c3d1effa4c33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ItemRemoved", "remove_ItemRemoved"]

    /**
     * 
     * @param {TypedEventHandler<StorageItemMostRecentlyUsedList, ItemRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemRemoved(handler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ItemRemoved(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(7, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
