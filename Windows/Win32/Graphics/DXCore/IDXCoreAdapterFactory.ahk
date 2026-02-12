#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **IDXCoreAdapterFactory** interface implements methods for generating DXCore adapter enumeration objects, and for retrieving their details.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapterFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXCoreAdapterFactory
     * @type {Guid}
     */
    static IID => Guid("{78ee5945-c36e-4b13-a669-005dd11c0f06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAdapterList", "GetAdapterByLuid", "IsNotificationTypeSupported", "RegisterEventNotification", "UnregisterEventNotification"]

    /**
     * Generates a list of adapter objects representing the current adapter state of the system, and meeting the criteria specified.
     * @remarks
     * Even if no adapters are found, as long as the arguments are valid, **CreateAdapterList** creates a valid [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist) object, and returns **S_OK**. Once generated, the adapters in this specific list won't change. But the list will be considered stale if one of the adapters later becomes invalid, or if a new adapter arrives that meets the provided filter criteria. The list returned by **CreateAdapterList** is not ordered in any particular way, and multiple calls to **CreateAdapterList** may produce differently ordered lists.
     * 
     * The resulting list is not ordered in any particular way, but the ordering of a list is consistent across multiple calls, and even across operating system restarts. The ordering may change upon system configuration changes, including the addition or removal of an adapter, or a driver update on an existing adapter.
     * @param {Integer} numAttributes Type: **uint32_t**
     * 
     * The number of elements in the array pointed to by the *filterAttributes* argument.
     * @param {Pointer<Guid>} filterAttributes Type: **const GUID\***
     * 
     * A pointer to an array of adapter attribute GUIDs. For a list of attribute GUIDs, see [DXCore adapter attribute GUIDs](/windows/win32/dxcore/dxcore-adapter-attribute-guids). At least one GUID must be provided. In the case that more than one GUID is provided in the array, only adapters that meet *all* of the requested attributes will be included in the returned list.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvAdapterList*. This is expected to be the interface identifier (IID) of [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist).
     * @returns {Pointer<Pointer<Void>>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvAdapterList* (the dereferenced address) contains a pointer to the the adapter list created.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-createadapterlist
     */
    CreateAdapterList(numAttributes, filterAttributes, riid) {
        result := ComCall(3, this, "uint", numAttributes, "ptr", filterAttributes, "ptr", riid, "ptr*", &ppvAdapterList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvAdapterList
    }

    /**
     * Retrieves the DXCore adapter object ([IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter)) for a specified LUID, if available.
     * @remarks
     * Multiple calls passing the same [LUID](/windows/win32/api/winnt/ns-winnt-_luid) return identical interface pointers. As a result, it's safe to compare interface pointers to determine whether multiple pointers refer to the same adapter object.
     * @param {Pointer<LUID>} adapterLUID Type: **[LUID](/windows/win32/api/winnt/ns-winnt-_luid) const\&**
     * 
     * The locally unique value that identifies the adapter instance.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvAdapter*. This is expected to be the interface identifier (IID) of [IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter).
     * @returns {Pointer<Pointer<Void>>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvAdapter* (the dereferenced address) contains a pointer to the the DXCore adapter created.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-getadapterbyluid
     */
    GetAdapterByLuid(adapterLUID, riid) {
        result := ComCall(4, this, "ptr", adapterLUID, "ptr", riid, "ptr*", &ppvAdapter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvAdapter
    }

    /**
     * Determines whether a specified notification type is supported by the operating system (OS).
     * @remarks
     * You can call **IsNotificationTypeSupported** to determine whether a given notification type is known to this version of the OS. For example, a notification type that's introduced in a particular version of Windows is unknown to previous versions of Windows.
     * @param {Integer} notificationType Type: **[DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype)**
     * 
     * The type of notification that you're querying about support for. See the table in [DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype) for info about the notification types.
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if the notification type is supported by the system. Otherwise, returns `false`.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-isnotificationtypesupported
     */
    IsNotificationTypeSupported(notificationType) {
        result := ComCall(5, this, "uint", notificationType, "int")
        return result
    }

    /**
     * Registers to receive notifications of specific conditions from a DXCore adapter or adapter list.
     * @remarks
     * You use **RegisterEventNotification** to register for events raised by [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist) and [IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter) interfaces. These notification types are supported.
     * 
     * |[DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype)|Supported *dxCoreObject*|Notes|
     * |-|-|-|
     * |AdapterListStale|**IDXCoreAdapterList**|Indicates that the list of adapters meeting your filter criteria has changed. If the adapter list is stale at the time of registration, then your callback is immediately called. This callback occurs at most one time per registration.|
     * |AdapterNoLongerValid|**IDXCoreAdapter**|Indicates that the adapter is no longer valid. If the adapter is invalid at registration time, then your callback is immediately called.|
     * |AdapterBudgetChange|**IDXCoreAdapter**|Indicates that a memory budgeting event has occurred, and that you should call [IDXCoreAdapter::QueryState](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapter-querystate) (with [DXCoreAdapterState::AdapterMemoryBudget](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoreadapterstate)) to evaluate the current memory budget state. Upon registration, an initial callback will always occur to allow you to query the initial state.|
     * |AdapterHardwareContentProtectionTeardown|**IDXCoreAdapter**|Indicates that you should re-evaluate the current crypto session status; for example, by calling [ID3D11VideoContext1::CheckCryptoSessionStatus](/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-checkcryptosessionstatus) to determine the impact of the hardware teardown for a specific [ID3D11CryptoSession](/windows/win32/api/d3d11/nn-d3d11-id3d11cryptosession) interface. Upon registration, an initial callback will always occur to allow you to query the initial state.|
     * 
     * A call to the function that you provide in *callbackFunction* is made asynchronously on a background thread by DXCore when the detected event occurs. No guarantee is made as to the ordering or timing of callbacks&mdash;multiple callbacks may occur in any order, or even simultaneously. It's even possible for your callback to be invoked before **RegisterEventNotification** has completed. In that case, DXCore guarantees that your *eventCookie* is set before your callback is called. Multiple callbacks for a specific registration will be serialized in order.
     * 
     * Callbacks may occur at any time until you call [UnregisterEventNotification](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-unregistereventnotification), and it completes. Callbacks occur on their own threads, and you may make calls into the DXCore API on those threads, including **UnregisterEventNotification**, and releasing of the *dxCoreObject*.
     * 
     * > [!IMPORTANT]
     * > Before you destroy the DXCore object represented by the *dxCoreObject* argument passed to **RegisterEventNotification**, you must use the cookie value to unregister that object from notifications by calling [IDXCoreAdapterFactory::UnregisterEventNotification](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-unregistereventnotification). If you don't do that, then a fatal exception is raised when the situation is detected.
     * @param {IUnknown} dxCoreObject Type: **[IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown)\***
     * 
     * The DXCore object ([IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter) or [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist)) whose notifications you're subscribing to.
     * @param {Integer} notificationType Type: **[DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype)**
     * 
     * The type of notification that you're registering for. See the table in [DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype) for info about what types are valid with which kinds of objects.
     * @param {Pointer<PFN_DXCORE_NOTIFICATION_CALLBACK>} callbackFunction Type: **[PFN_DXCORE_NOTIFICATION_CALLBACK](/windows/win32/api/dxcore_interface/nc-dxcore_interface-pfn_dxcore_notification_callback)**
     * 
     * A pointer to a callback function (implemented by your application), which is called by the DXCore object for notification events. For the signature of the function, see [PFN_DXCORE_NOTIFICATION_CALLBACK](/windows/win32/api/dxcore_interface/nc-dxcore_interface-pfn_dxcore_notification_callback).
     * @param {Pointer<Void>} callbackContext Type: **void\***
     * 
     * An optional pointer to an object containing context info. This object is passed to your callback function when the notification is raised.
     * @returns {Integer} Type: **uint32_t\***
     * 
     * A pointer to a **uint32_t** value. If successful, the function dereferences the pointer and sets the value to a non-zero cookie value representing this registration. Use this cookie value to unregister from the notification by calling [IDXCoreAdapterFactory::UnregisterEventNotification](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-unregistereventnotification). See **Remarks**.
     * 
     * If unsuccessful, the function dereferences the pointer and sets the value to zero, which represents an invalid cookie value.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-registereventnotification
     */
    RegisterEventNotification(dxCoreObject, notificationType, callbackFunction, callbackContext) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", dxCoreObject, "uint", notificationType, "ptr", callbackFunction, callbackContextMarshal, callbackContext, "uint*", &eventCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * Unregisters from a notification that you previously registered for.
     * @remarks
     * **UnregisterEventNotification** returns only after all pending/in-progress callbacks for this registration have completed. DXCore guarantees that no new callbacks will occur for this registration after **UnregisterEventNotification** has returned. However, to avoid a deadlock, if you call **UnregisterEventNotification** from within your callback, then **UnregisterEventNotification** doesn't wait for the active callback to complete.
     * 
     * > [!IMPORTANT]
     * > Before you destroy the DXCore object represented by the *dxCoreObject* argument passed to [IDXCoreAdapterFactory::RegisterEventNotification](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-registereventnotification), you must use the cookie value to unregister that object from notifications by calling **UnregisterEventNotification**. If you don't do that, then a fatal exception is raised when the situation is detected.
     * 
     * Once you unregister a cookie value, that value is then eligible for being returned by a subsequent registration
     * @param {Integer} eventCookie Type: **uint32_t**
     * 
     * The cookie value (returned when you called [IDXCoreAdapterFactory::RegisterEventNotification](/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-registereventnotification)) representing a prior registration that you now wish to unregister for.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_INVALIDARG|The value of *eventCookie* is not a valid cookie representing a prior registration.|
     * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-unregistereventnotification
     */
    UnregisterEventNotification(eventCookie) {
        result := ComCall(7, this, "uint", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
