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
     * 
     * @param {Integer} numAttributes 
     * @param {Pointer<Guid>} filterAttributes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapterList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-createadapterlist
     */
    CreateAdapterList(numAttributes, filterAttributes, riid, ppvAdapterList) {
        result := ComCall(3, this, "uint", numAttributes, "ptr", filterAttributes, "ptr", riid, "ptr*", ppvAdapterList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} adapterLUID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-getadapterbyluid
     */
    GetAdapterByLuid(adapterLUID, riid, ppvAdapter) {
        result := ComCall(4, this, "ptr", adapterLUID, "ptr", riid, "ptr*", ppvAdapter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-isnotificationtypesupported
     */
    IsNotificationTypeSupported(notificationType) {
        result := ComCall(5, this, "uint", notificationType, "int")
        return result
    }

    /**
     * 
     * @param {IUnknown} dxCoreObject 
     * @param {Integer} notificationType 
     * @param {Pointer<PFN_DXCORE_NOTIFICATION_CALLBACK>} callbackFunction 
     * @param {Pointer<Void>} callbackContext 
     * @param {Pointer<Integer>} eventCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterfactory-registereventnotification
     */
    RegisterEventNotification(dxCoreObject, notificationType, callbackFunction, callbackContext, eventCookie) {
        result := ComCall(6, this, "ptr", dxCoreObject, "uint", notificationType, "ptr", callbackFunction, "ptr", callbackContext, "uint*", eventCookie, "HRESULT")
        return result
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
