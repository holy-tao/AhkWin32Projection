#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk
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
     * @returns {SOCKADDR_STORAGE} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getsockaddr
     */
    GetSockaddr() {
        pSockAddr := SOCKADDR_STORAGE()
        result := ComCall(11, this, "ptr", pSockAddr, "HRESULT")
        return pSockAddr
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getmessagetype
     */
    GetMessageType() {
        result := ComCall(15, this, "int*", &pMessageType := 0, "HRESULT")
        return pMessageType
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getttl
     */
    GetTTL() {
        result := ComCall(17, this, "uint*", &pdwTTL := 0, "HRESULT")
        return pdwTTL
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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getalias
     */
    GetAlias() {
        pAlias := Guid()
        result := ComCall(19, this, "ptr", pAlias, "HRESULT")
        return pAlias
    }
}
