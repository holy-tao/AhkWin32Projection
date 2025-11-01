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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSockaddr", "GetSockaddr", "SetExclusive", "GetExclusive", "SetMessageType", "GetMessageType", "SetTTL", "GetTTL", "SetAlias", "GetAlias"]

    /**
     * 
     * @param {Pointer<SOCKADDR_STORAGE>} pSockAddr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setsockaddr
     */
    SetSockaddr(pSockAddr) {
        result := ComCall(10, this, "ptr", pSockAddr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SOCKADDR_STORAGE>} pSockAddr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getsockaddr
     */
    GetSockaddr(pSockAddr) {
        result := ComCall(11, this, "ptr", pSockAddr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fExclusive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setexclusive
     */
    SetExclusive(fExclusive) {
        result := ComCall(12, this, "int", fExclusive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getexclusive
     */
    GetExclusive() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} messageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setmessagetype
     */
    SetMessageType(messageType) {
        result := ComCall(14, this, "int", messageType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMessageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getmessagetype
     */
    GetMessageType(pMessageType) {
        pMessageTypeMarshal := pMessageType is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pMessageTypeMarshal, pMessageType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTTL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setttl
     */
    SetTTL(dwTTL) {
        result := ComCall(16, this, "uint", dwTTL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwTTL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getttl
     */
    GetTTL(pdwTTL) {
        pdwTTLMarshal := pdwTTL is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pdwTTLMarshal, pdwTTL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAlias 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setalias
     */
    SetAlias(pAlias) {
        result := ComCall(18, this, "ptr", pAlias, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAlias 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getalias
     */
    GetAlias(pAlias) {
        result := ComCall(19, this, "ptr", pAlias, "HRESULT")
        return result
    }
}
