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
     * 
     * @param {Integer} numAttributes 
     * @param {Pointer<Guid>} filterAttributes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvAdapterList 
     * @returns {HRESULT} 
     */
    CreateAdapterList(numAttributes, filterAttributes, riid, ppvAdapterList) {
        result := ComCall(3, this, "uint", numAttributes, "ptr", filterAttributes, "ptr", riid, "ptr", ppvAdapterList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} adapterLUID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvAdapter 
     * @returns {HRESULT} 
     */
    GetAdapterByLuid(adapterLUID, riid, ppvAdapter) {
        result := ComCall(4, this, "ptr", adapterLUID, "ptr", riid, "ptr", ppvAdapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} notificationType 
     * @returns {Boolean} 
     */
    IsNotificationTypeSupported(notificationType) {
        result := ComCall(5, this, "uint", notificationType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} dxCoreObject 
     * @param {Integer} notificationType 
     * @param {Pointer<PFN_DXCORE_NOTIFICATION_CALLBACK>} callbackFunction 
     * @param {Pointer<Void>} callbackContext 
     * @param {Pointer<UInt32>} eventCookie 
     * @returns {HRESULT} 
     */
    RegisterEventNotification(dxCoreObject, notificationType, callbackFunction, callbackContext, eventCookie) {
        result := ComCall(6, this, "ptr", dxCoreObject, "uint", notificationType, "ptr", callbackFunction, "ptr", callbackContext, "uint*", eventCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventCookie 
     * @returns {HRESULT} 
     */
    UnregisterEventNotification(eventCookie) {
        result := ComCall(7, this, "uint", eventCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
