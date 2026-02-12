#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ICurrentApp2Statics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentApp2Statics
     * @type {Guid}
     */
    static IID => Guid("{df4e6e2d-3171-4ad3-8614-2c61244373cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCustomerPurchaseIdAsync", "GetCustomerCollectionsIdAsync"]

    /**
     * 
     * @param {HSTRING} serviceTicket 
     * @param {HSTRING} publisherUserId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetCustomerPurchaseIdAsync(serviceTicket, publisherUserId) {
        if(serviceTicket is String) {
            pin := HSTRING.Create(serviceTicket)
            serviceTicket := pin.Value
        }
        serviceTicket := serviceTicket is Win32Handle ? NumGet(serviceTicket, "ptr") : serviceTicket
        if(publisherUserId is String) {
            pin := HSTRING.Create(publisherUserId)
            publisherUserId := pin.Value
        }
        publisherUserId := publisherUserId is Win32Handle ? NumGet(publisherUserId, "ptr") : publisherUserId

        result := ComCall(6, this, "ptr", serviceTicket, "ptr", publisherUserId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} serviceTicket 
     * @param {HSTRING} publisherUserId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetCustomerCollectionsIdAsync(serviceTicket, publisherUserId) {
        if(serviceTicket is String) {
            pin := HSTRING.Create(serviceTicket)
            serviceTicket := pin.Value
        }
        serviceTicket := serviceTicket is Win32Handle ? NumGet(serviceTicket, "ptr") : serviceTicket
        if(publisherUserId is String) {
            pin := HSTRING.Create(publisherUserId)
            publisherUserId := pin.Value
        }
        publisherUserId := publisherUserId is Win32Handle ? NumGet(publisherUserId, "ptr") : publisherUserId

        result := ComCall(7, this, "ptr", serviceTicket, "ptr", publisherUserId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }
}
