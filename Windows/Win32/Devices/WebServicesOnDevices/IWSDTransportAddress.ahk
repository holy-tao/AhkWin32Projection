#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAddress.ahk

/**
 * Represents an IP-based transport address.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdtransportaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDTransportAddress extends IWSDAddress{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDTransportAddress
     * @type {Guid}
     */
    static IID => Guid("{70d23498-4ee6-4340-a3df-d845d2235467}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPort", "SetPort", "GetTransportAddress", "GetTransportAddressEx", "SetTransportAddress"]

    /**
     * 
     * @param {Pointer<Integer>} pwPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-getport
     */
    GetPort(pwPort) {
        pwPortMarshal := pwPort is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwPortMarshal, pwPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-setport
     */
    SetPort(wPort) {
        result := ComCall(6, this, "ushort", wPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-gettransportaddress
     */
    GetTransportAddress(ppszAddress) {
        result := ComCall(7, this, "ptr", ppszAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fSafe 
     * @param {Pointer<PWSTR>} ppszAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-gettransportaddressex
     */
    GetTransportAddressEx(fSafe, ppszAddress) {
        result := ComCall(8, this, "int", fSafe, "ptr", ppszAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-settransportaddress
     */
    SetTransportAddress(pszAddress) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress

        result := ComCall(9, this, "ptr", pszAddress, "HRESULT")
        return result
    }
}
