#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDTransportAddress.ahk

/**
 * Provides access to the individual components of a UDP address.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdudpaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDUdpAddress extends IWSDTransportAddress{
    /**
     * The interface identifier for IWSDUdpAddress
     * @type {Guid}
     */
    static IID => Guid("{74d6124a-a441-4f78-a1eb-97a8d1996893}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<SOCKADDR_STORAGE>} pSockAddr 
     * @returns {HRESULT} 
     */
    SetSockaddr(pSockAddr) {
        result := ComCall(10, this, "ptr", pSockAddr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SOCKADDR_STORAGE>} pSockAddr 
     * @returns {HRESULT} 
     */
    GetSockaddr(pSockAddr) {
        result := ComCall(11, this, "ptr", pSockAddr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fExclusive 
     * @returns {HRESULT} 
     */
    SetExclusive(fExclusive) {
        result := ComCall(12, this, "int", fExclusive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetExclusive() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} messageType 
     * @returns {HRESULT} 
     */
    SetMessageType(messageType) {
        result := ComCall(14, this, "int", messageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMessageType 
     * @returns {HRESULT} 
     */
    GetMessageType(pMessageType) {
        result := ComCall(15, this, "int*", pMessageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTTL 
     * @returns {HRESULT} 
     */
    SetTTL(dwTTL) {
        result := ComCall(16, this, "uint", dwTTL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwTTL 
     * @returns {HRESULT} 
     */
    GetTTL(pdwTTL) {
        result := ComCall(17, this, "uint*", pdwTTL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAlias 
     * @returns {HRESULT} 
     */
    SetAlias(pAlias) {
        result := ComCall(18, this, "ptr", pAlias, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAlias 
     * @returns {HRESULT} 
     */
    GetAlias(pAlias) {
        result := ComCall(19, this, "ptr", pAlias, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
