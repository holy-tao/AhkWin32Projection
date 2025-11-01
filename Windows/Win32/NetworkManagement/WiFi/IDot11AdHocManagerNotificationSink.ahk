#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the notifications supported by the IDot11AdHocManager interface.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocmanagernotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocManagerNotificationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocManagerNotificationSink
     * @type {Guid}
     */
    static IID => Guid("{8f10cc27-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNetworkAdd", "OnNetworkRemove", "OnInterfaceAdd", "OnInterfaceRemove"]

    /**
     * 
     * @param {IDot11AdHocNetwork} pIAdHocNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-onnetworkadd
     */
    OnNetworkAdd(pIAdHocNetwork) {
        result := ComCall(3, this, "ptr", pIAdHocNetwork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Signature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-onnetworkremove
     */
    OnNetworkRemove(Signature) {
        result := ComCall(4, this, "ptr", Signature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDot11AdHocInterface} pIAdHocInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-oninterfaceadd
     */
    OnInterfaceAdd(pIAdHocInterface) {
        result := ComCall(5, this, "ptr", pIAdHocInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Signature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocmanagernotificationsink-oninterfaceremove
     */
    OnInterfaceRemove(Signature) {
        result := ComCall(6, this, "ptr", Signature, "HRESULT")
        return result
    }
}
