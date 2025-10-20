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
     * 
     * @param {Pointer<UInt16>} pwPort 
     * @returns {HRESULT} 
     */
    GetPort(pwPort) {
        result := ComCall(5, this, "ushort*", pwPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wPort 
     * @returns {HRESULT} 
     */
    SetPort(wPort) {
        result := ComCall(6, this, "ushort", wPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszAddress 
     * @returns {HRESULT} 
     */
    GetTransportAddress(ppszAddress) {
        result := ComCall(7, this, "ptr", ppszAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fSafe 
     * @param {Pointer<PWSTR>} ppszAddress 
     * @returns {HRESULT} 
     */
    GetTransportAddressEx(fSafe, ppszAddress) {
        result := ComCall(8, this, "int", fSafe, "ptr", ppszAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAddress 
     * @returns {HRESULT} 
     */
    SetTransportAddress(pszAddress) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress

        result := ComCall(9, this, "ptr", pszAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
