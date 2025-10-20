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
     * 
     * @param {Pointer<IDot11AdHocNetwork>} pIAdHocNetwork 
     * @returns {HRESULT} 
     */
    OnNetworkAdd(pIAdHocNetwork) {
        result := ComCall(3, this, "ptr", pIAdHocNetwork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Signature 
     * @returns {HRESULT} 
     */
    OnNetworkRemove(Signature) {
        result := ComCall(4, this, "ptr", Signature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDot11AdHocInterface>} pIAdHocInterface 
     * @returns {HRESULT} 
     */
    OnInterfaceAdd(pIAdHocInterface) {
        result := ComCall(5, this, "ptr", pIAdHocInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Signature 
     * @returns {HRESULT} 
     */
    OnInterfaceRemove(Signature) {
        result := ComCall(6, this, "ptr", Signature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
