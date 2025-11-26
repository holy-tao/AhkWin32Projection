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
     * Gets the IP port number associated with this transport address.
     * @returns {Integer} Port number associated with the address object.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdtransportaddress-getport
     */
    GetPort() {
        result := ComCall(5, this, "ushort*", &pwPort := 0, "HRESULT")
        return pwPort
    }

    /**
     * Sets only the IP port number for this transport address.
     * @param {Integer} wPort The IP port number for the address object.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdtransportaddress-setport
     */
    SetPort(wPort) {
        result := ComCall(6, this, "ushort", wPort, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to a string representation of the address object.
     * @returns {PWSTR} String representation of the address object. Do not deallocate this pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdtransportaddress-gettransportaddress
     */
    GetTransportAddress() {
        result := ComCall(7, this, "ptr*", &ppszAddress := 0, "HRESULT")
        return ppszAddress
    }

    /**
     * Gets a pointer to a string representation of the address object.
     * @param {BOOL} fSafe Specifies whether the scope identifier for an IPv6 address is included in the returned <i>ppszAddress</i> string. For example, if the address object represents an IPv6 link local address and <i>fSafe</i> is <b>FALSE</b>, then the IPv6 scope identifier will be included in the returned <i>ppszAddress</i> string.
     * 
     * If the address object represents an IPv4 address or a host name, this parameter is ignored.
     * @returns {PWSTR} String representation of the address object. Do not deallocate this pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdtransportaddress-gettransportaddressex
     */
    GetTransportAddressEx(fSafe) {
        result := ComCall(8, this, "int", fSafe, "ptr*", &ppszAddress := 0, "HRESULT")
        return ppszAddress
    }

    /**
     * Sets the string representation of the transport address.
     * @param {PWSTR} pszAddress String representation of the transport address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length in characters of the address string pointed to by <i>ppszAddress</i> exceeds WSD_MAX_TEXT_LENGTH (8192),  <i>ppszAddress</i> is <b>NULL</b>, or the format of <i>ppszAddress</i> was not recognized. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdtransportaddress-settransportaddress
     */
    SetTransportAddress(pszAddress) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress

        result := ComCall(9, this, "ptr", pszAddress, "HRESULT")
        return result
    }
}
