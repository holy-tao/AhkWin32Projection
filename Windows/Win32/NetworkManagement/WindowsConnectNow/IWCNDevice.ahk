#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to configure the device and initiate the session.
 * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nn-wcndevice-iwcndevice
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class IWCNDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCNDevice
     * @type {Guid}
     */
    static IID => Guid("{c100be9c-d33a-4a4b-bf23-bbef4663d017}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPassword", "Connect", "GetAttribute", "GetIntegerAttribute", "GetStringAttribute", "GetNetworkProfile", "SetNetworkProfile", "GetVendorExtension", "SetVendorExtension", "Unadvise", "SetNFCPasswordParams"]

    /**
     * The IWCNDevice::SetPassword method configures the authentication method value, and if required, a password used for the pending session. This method may only be called prior to IWCNDevice::Connect.
     * @param {Integer} Type A <b>WCN_PASSWORD_TYPE</b> value that specifies the authentication method used for the session.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_PASSWORD_TYPE_PUSH_BUTTON"></a><a id="wcn_password_type_push_button"></a><dl>
     * <dt><b>WCN_PASSWORD_TYPE_PUSH_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use PushButton authentication.  The value of <i>dwPasswordLength</i> must be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_PASSWORD_TYPE_PIN"></a><a id="wcn_password_type_pin"></a><dl>
     * <dt><b>WCN_PASSWORD_TYPE_PIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use PIN-based authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwPasswordLength Number of bytes in the buffer <i>pbPassword</i>.
     * @param {Pointer<Integer>} pbPassword A byte array of the password, encoded in ASCII.
     * @returns {HRESULT} This method can return one of these values.
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
     * The password will be used for the pending session.
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
     * The password type is WCN_PASSWORD_TYPE_PUSH_BUTTON and the password length is not zero.
     * 
     * The password type is not WCN_PASSWORD_TYPE_PUSH_BUTTON or WCN_PASSWORD_TYPE_PIN.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-setpassword
     */
    SetPassword(Type, dwPasswordLength, pbPassword) {
        pbPasswordMarshal := pbPassword is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", Type, "uint", dwPasswordLength, pbPasswordMarshal, pbPassword, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::Connect method initiates the session.
     * @param {IWCNConnectNotify} pNotify A pointer to the implemented <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nn-wcndevice-iwcnconnectnotify">IWCNConnectNotify</a> callback interface which specifies if a connection has been successfully established.
     * @returns {HRESULT} This method can return one of these values.
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
     * The operation has succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support the connection options queued via IWCNDevice::Set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCN_E_PEER_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device could not be located on the network.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-connect
     */
    Connect(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::GetAttribute method gets a cached attribute from the device.
     * @param {Integer} AttributeType A <b>WCN_ATTRIBUTE_TYPE</b>  value that represents a specific attribute value (for example,   <b>WCN_PASSWORD_TYPE</b>).
     * @param {Integer} dwMaxBufferSize The allocated size, in bytes, of <i>pbBuffer</i>.
     * @param {Pointer<Integer>} pbBuffer A user-allocated buffer that,  on successful return, contains the contents of the attribute.
     * @param {Pointer<Integer>} pdwBufferUsed On return, contains the size of the attribute in bytes.
     * @returns {HRESULT} This method can return one of these values.
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
     * The attribute was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute specified is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified by <i>pbBuffer</i> is not large enough to contain the returned attribute value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-getattribute
     */
    GetAttribute(AttributeType, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwBufferUsedMarshal := pdwBufferUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", AttributeType, "uint", dwMaxBufferSize, pbBufferMarshal, pbBuffer, pdwBufferUsedMarshal, pdwBufferUsed, "HRESULT")
        return result
    }

    /**
     * The GetIntegerAttribute method gets a cached attribute from the device as an integer.
     * @param {Integer} AttributeType A <b>WCN_ATTRIBUTE_TYPE</b> value  that represents a specific attribute value (for example, <b>WCN_PASSWORD_TYPE</b>).
     * @returns {Integer} Pointer to an unsigned-integer that represents the retrieved attribute value.
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-getintegerattribute
     */
    GetIntegerAttribute(AttributeType) {
        result := ComCall(6, this, "int", AttributeType, "uint*", &puInteger := 0, "HRESULT")
        return puInteger
    }

    /**
     * The IWCNDevice::GetStringAttribute method gets a cached attribute from the device as a string.
     * @param {Integer} AttributeType A <b>WCN_ATTRIBUTE_TYPE</b> value that represents a specific attribute value (for example,   <b>WCN_PASSWORD_TYPE</b>). If the attribute is not natively a string data type (for example, <b>WCN_TYPE_VERSION</b> is natively an integer, and <b>WNC_TYPE_SSID</b> is natively a blob), this function will fail with <b>HRESULT_FROM_WIN32(ERROR_INVALID_DATATYPE)</b>.
     * @param {Integer} cchMaxString The size of the buffer <i>wszString</i>, in characters.
     * @param {PWSTR} wszString A user-allocated buffer that,  on successful return, contains a <b>NULL</b>-terminated string value of the vendor extension.
     * @returns {HRESULT} ...
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
     * The attribute was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute specified is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified by <i>wszString</i> is not large enough to contain the returned attribute value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATATYPE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This attribute cannot be expressed as a string. For example, if it is an integer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-getstringattribute
     */
    GetStringAttribute(AttributeType, cchMaxString, wszString) {
        wszString := wszString is String ? StrPtr(wszString) : wszString

        result := ComCall(7, this, "int", AttributeType, "uint", cchMaxString, "ptr", wszString, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::GetNetworkProfile method gets a network profile from the device.
     * @param {Integer} cchMaxStringLength The allocated size, in characters, of <i>wszProfile</i>.
     * @param {PWSTR} wszProfile A string that specifies the XML WLAN network profile type.
     * @returns {HRESULT} This method can return one of these values.
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
     * The network profile was successfully retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-getnetworkprofile
     */
    GetNetworkProfile(cchMaxStringLength, wszProfile) {
        wszProfile := wszProfile is String ? StrPtr(wszProfile) : wszProfile

        result := ComCall(8, this, "uint", cchMaxStringLength, "ptr", wszProfile, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::SetNetworkProfile method queues an XML WLAN profile to be provisioned to the device. This method may only be called prior to IWCNDevice::Connect.
     * @param {PWSTR} pszProfileXml The XML WLAN profile XML string.
     * @returns {HRESULT} This method can return one of these values.
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
     * The attribute was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WLAN profile is not supported for WCN connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_BAD_PROFILE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided XML profile cannot be read.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-setnetworkprofile
     */
    SetNetworkProfile(pszProfileXml) {
        pszProfileXml := pszProfileXml is String ? StrPtr(pszProfileXml) : pszProfileXml

        result := ComCall(9, this, "ptr", pszProfileXml, "HRESULT")
        return result
    }

    /**
     * The GetVendorExtension method gets a cached vendor extension from the device.
     * @param {Pointer<WCN_VENDOR_EXTENSION_SPEC>} pVendorExtSpec A pointer to a user-defined <b>WCN_VENDOR_EXTENSION_SPEC</b> structure that describes the vendor extension to query for.
     * @param {Integer} dwMaxBufferSize The size, in bytes, of <i>pbBuffer</i>.
     * @param {Pointer<Integer>} pbBuffer An allocated buffer that,  on return, contains the contents of the  vendor extension.
     * @param {Pointer<Integer>} pdwBufferUsed On return, contains the size of the vendor extension in bytes.
     * @returns {HRESULT} This method can return one of these values.
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
     * The vendor extension was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vendor extension specified is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified by <i>pbBuffer</i> is not large enough to contain the returned vendor extension.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-getvendorextension
     */
    GetVendorExtension(pVendorExtSpec, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwBufferUsedMarshal := pdwBufferUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", pVendorExtSpec, "uint", dwMaxBufferSize, pbBufferMarshal, pbBuffer, pdwBufferUsedMarshal, pdwBufferUsed, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::SetVendorExtension method queues a vendor extension for use in the pending session. This function may only be called prior to IWCNDevice::Connect.
     * @param {Pointer<WCN_VENDOR_EXTENSION_SPEC>} pVendorExtSpec A pointer to a <b>WCN_VENDOR_EXTENSION_SPEC</b> structure that contains the vendor extension specification.
     * @param {Integer} cbBuffer The number of bytes contained in <i>pbBuffer</i>.
     * @param {Pointer<Integer>} pbBuffer Pointer to a buffer that contains the data to set in the vendor extension.
     * @returns {HRESULT} This method can return one of these values.
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
     * The vendor extension will be sent in the pending session.
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
     * The specified <b>WCN_VENDOR_EXTENSION_SPEC</b> contains an illegal VendorID, sub-type, or flag. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_IMPLEMENTATION_LIMIT)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of vendor extensions has exceeded the current implementation limit, which is currently equal to 25 vendor extensions per session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-setvendorextension
     */
    SetVendorExtension(pVendorExtSpec, cbBuffer, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "ptr", pVendorExtSpec, "uint", cbBuffer, pbBufferMarshal, pbBuffer, "HRESULT")
        return result
    }

    /**
     * IWCNDevice::Unadvise method removes any callback previously set via IWCNDevice::Connect.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nf-wcndevice-iwcndevice-unadvise
     */
    Unadvise() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} dwOOBPasswordID 
     * @param {Integer} dwPasswordLength 
     * @param {Pointer<Integer>} pbPassword 
     * @param {Integer} dwRemotePublicKeyHashLength 
     * @param {Pointer<Integer>} pbRemotePublicKeyHash 
     * @param {Integer} dwDHKeyBlobLength 
     * @param {Pointer<Integer>} pbDHKeyBlob 
     * @returns {HRESULT} 
     */
    SetNFCPasswordParams(Type, dwOOBPasswordID, dwPasswordLength, pbPassword, dwRemotePublicKeyHashLength, pbRemotePublicKeyHash, dwDHKeyBlobLength, pbDHKeyBlob) {
        pbPasswordMarshal := pbPassword is VarRef ? "char*" : "ptr"
        pbRemotePublicKeyHashMarshal := pbRemotePublicKeyHash is VarRef ? "char*" : "ptr"
        pbDHKeyBlobMarshal := pbDHKeyBlob is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "int", Type, "uint", dwOOBPasswordID, "uint", dwPasswordLength, pbPasswordMarshal, pbPassword, "uint", dwRemotePublicKeyHashLength, pbRemotePublicKeyHashMarshal, pbRemotePublicKeyHash, "uint", dwDHKeyBlobLength, pbDHKeyBlobMarshal, pbDHKeyBlob, "HRESULT")
        return result
    }
}
