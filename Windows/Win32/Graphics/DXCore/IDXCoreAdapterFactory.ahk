#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **IDXCoreAdapterFactory** interface implements methods for generating DXCore adapter enumeration objects, and for retrieving their details.
 * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory
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
     * @param {Integer} numAttributes Type: **uint32_t**
     * 
     * The number of elements in the array pointed to by the *filterAttributes* argument.
     * @param {Pointer<Guid>} filterAttributes Type: **const GUID\***
     * 
     * A pointer to an array of adapter attribute GUIDs. For a list of attribute GUIDs, see [DXCore adapter attribute GUIDs](/windows/win32/dxcore/dxcore-adapter-attribute-guids). At least one GUID must be provided. In the case that more than one GUID is provided in the array, only adapters that meet *all* of the requested attributes will be included in the returned list.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvAdapterList*. This is expected to be the interface identifier (IID) of [IDXCoreAdapterList](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvAdapterList* (the dereferenced address) contains a pointer to the the adapter list created.
     * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-createadapterlist
     */
    CreateAdapterList(numAttributes, filterAttributes, riid) {
        result := ComCall(3, this, "uint", numAttributes, "ptr", filterAttributes, "ptr", riid, "ptr*", &ppvAdapterList := 0, "HRESULT")
        return ppvAdapterList
    }

    /**
     * Retrieves the DXCore adapter object ([IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter)) for a specified LUID, if available.
     * @param {Pointer<LUID>} adapterLUID Type: **[LUID](/windows/win32/api/winnt/ns-winnt-_luid) const\&**
     * 
     * The locally unique value that identifies the adapter instance.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in *ppvAdapter*. This is expected to be the interface identifier (IID) of [IDXCoreAdapter](/windows/win32/api/dxcore_interface/nn-dxcore_interface-idxcoreadapter).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Upon successful return, *\*ppvAdapter* (the dereferenced address) contains a pointer to the the DXCore adapter created.
     * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-getadapterbyluid
     */
    GetAdapterByLuid(adapterLUID, riid) {
        result := ComCall(4, this, "ptr", adapterLUID, "ptr", riid, "ptr*", &ppvAdapter := 0, "HRESULT")
        return ppvAdapter
    }

    /**
     * Determines whether a specified notification type is supported by the operating system (OS).
     * @param {Integer} notificationType Type: **[DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype)**
     * 
     * The type of notification that you're querying about support for. See the table in [DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype) for info about the notification types.
     * @returns {Boolean} Type: **bool**
     * 
     * Returns `true` if the notification type is supported by the system. Otherwise, returns `false`.
     * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-isnotificationtypesupported
     */
    IsNotificationTypeSupported(notificationType) {
        result := ComCall(5, this, "uint", notificationType, "int")
        return result
    }

    /**
     * Registers to receive notifications of specific conditions from a DXCore adapter or adapter list.
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
     * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-registereventnotification
     */
    RegisterEventNotification(dxCoreObject, notificationType, callbackFunction, callbackContext) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", dxCoreObject, "uint", notificationType, "ptr", callbackFunction, callbackContextMarshal, callbackContext, "uint*", &eventCookie := 0, "HRESULT")
        return eventCookie
    }

    /**
     * 
     * @param {Integer} eventCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-unregistereventnotification
     */
    UnregisterEventNotification(eventCookie) {
        result := ComCall(7, this, "uint", eventCookie, "HRESULT")
        return result
    }
}
