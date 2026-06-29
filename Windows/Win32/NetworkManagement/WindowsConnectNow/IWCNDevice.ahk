#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWCNConnectNotify.ahk" { IWCNConnectNotify }
#Import ".\WCN_ATTRIBUTE_TYPE.ahk" { WCN_ATTRIBUTE_TYPE }
#Import ".\WCN_PASSWORD_TYPE.ahk" { WCN_PASSWORD_TYPE }
#Import ".\WCN_VENDOR_EXTENSION_SPEC.ahk" { WCN_VENDOR_EXTENSION_SPEC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface to configure the device and initiate the session.
 * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nn-wcndevice-iwcndevice
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct IWCNDevice extends IUnknown {
    /**
     * The interface identifier for IWCNDevice
     * @type {Guid}
     */
    static IID := Guid("{c100be9c-d33a-4a4b-bf23-bbef4663d017}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWCNDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPassword          : IntPtr
        Connect              : IntPtr
        GetAttribute         : IntPtr
        GetIntegerAttribute  : IntPtr
        GetStringAttribute   : IntPtr
        GetNetworkProfile    : IntPtr
        SetNetworkProfile    : IntPtr
        GetVendorExtension   : IntPtr
        SetVendorExtension   : IntPtr
        Unadvise             : IntPtr
        SetNFCPasswordParams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWCNDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWCNDevice::SetPassword method configures the authentication method value, and if required, a password used for the pending session. This method may only be called prior to IWCNDevice::Connect.
     * @remarks
     * The byte array is not <b>NULL</b>-terminated.  For example, if the password is a 4-digit PIN, you should pass dwPasswordLength as 4 and pbPassword should point to a 4-byte array containing the PIN in ASCII.
     * @param {WCN_PASSWORD_TYPE} Type A <b>WCN_PASSWORD_TYPE</b> value that specifies the authentication method used for the session.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-setpassword
     */
    SetPassword(Type, dwPasswordLength, pbPassword) {
        pbPasswordMarshal := pbPassword is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, WCN_PASSWORD_TYPE, Type, "uint", dwPasswordLength, pbPasswordMarshal, pbPassword, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::Connect method initiates the session.
     * @remarks
     * After calling this method you may not call any other <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nn-wcndevice-iwcndevice">IWCNDevice</a> 'Set' methods.  There is no way to cancel or roll back device settings once a connection has been established.
     * 
     * <b>NULL</b>  can be passed via pNotify, in place of  the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nn-wcndevice-iwcnconnectnotify">IWCNConnectNotify</a> callback interface to prevent  notification from being sent when the connect operation is complete.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-connect
     */
    Connect(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::GetAttribute method gets a cached attribute from the device.
     * @remarks
     * To only query the size of an attribute, a value of 0 (zero) can be passed via <i>dwMaxBufferSize</i> and <i>pdwBufferUsed</i> will be filled appropriately.
     * @param {WCN_ATTRIBUTE_TYPE} AttributeType A <b>WCN_ATTRIBUTE_TYPE</b>  value that represents a specific attribute value (for example,   <b>WCN_PASSWORD_TYPE</b>).
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getattribute
     */
    GetAttribute(AttributeType, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwBufferUsedMarshal := pdwBufferUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, WCN_ATTRIBUTE_TYPE, AttributeType, "uint", dwMaxBufferSize, pbBufferMarshal, pbBuffer, pdwBufferUsedMarshal, pdwBufferUsed, "HRESULT")
        return result
    }

    /**
     * The GetIntegerAttribute method gets a cached attribute from the device as an integer.
     * @param {WCN_ATTRIBUTE_TYPE} AttributeType A <b>WCN_ATTRIBUTE_TYPE</b> value  that represents a specific attribute value (for example, <b>WCN_PASSWORD_TYPE</b>).
     * @returns {Integer} Pointer to an unsigned-integer that represents the retrieved attribute value.
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute
     */
    GetIntegerAttribute(AttributeType) {
        result := ComCall(6, this, WCN_ATTRIBUTE_TYPE, AttributeType, "uint*", &puInteger := 0, "HRESULT")
        return puInteger
    }

    /**
     * The IWCNDevice::GetStringAttribute method gets a cached attribute from the device as a string.
     * @param {WCN_ATTRIBUTE_TYPE} AttributeType A <b>WCN_ATTRIBUTE_TYPE</b> value that represents a specific attribute value (for example,   <b>WCN_PASSWORD_TYPE</b>). If the attribute is not natively a string data type (for example, <b>WCN_TYPE_VERSION</b> is natively an integer, and <b>WNC_TYPE_SSID</b> is natively a blob), this function will fail with <b>HRESULT_FROM_WIN32(ERROR_INVALID_DATATYPE)</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getstringattribute
     */
    GetStringAttribute(AttributeType, cchMaxString, wszString) {
        wszString := wszString is String ? StrPtr(wszString) : wszString

        result := ComCall(7, this, WCN_ATTRIBUTE_TYPE, AttributeType, "uint", cchMaxString, "ptr", wszString, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::GetNetworkProfile method gets a network profile from the device.
     * @remarks
     * This function can only be called after <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-connect">IWCNDevice::Connect</a> has been called, and the session has completed successfully.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getnetworkprofile
     */
    GetNetworkProfile(cchMaxStringLength, wszProfile) {
        wszProfile := wszProfile is String ? StrPtr(wszProfile) : wszProfile

        result := ComCall(8, this, "uint", cchMaxStringLength, "ptr", wszProfile, "HRESULT")
        return result
    }

    /**
     * The IWCNDevice::SetNetworkProfile method queues an XML WLAN profile to be provisioned to the device. This method may only be called prior to IWCNDevice::Connect.
     * @remarks
     * Currently, the <b>Windows Connect Now API</b> (WCNAPI) supports the following profile types: <ul>
     * <li>None (Open or Shared)</li>
     * <li>WEP (Open or Shared)</li>
     * <li>WPA-PSK (TKIP or AES)</li>
     * <li>WPA2-PSK (TKIP or AES)</li>
     * </ul>   If  the specified WLAN profile has extraneous settings (like IHV settings), these settings will be ignored. In the event a WLAN profile is not  compatible with the WCNAPI, an <b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b> value is returned.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-setnetworkprofile
     */
    SetNetworkProfile(pszProfileXml) {
        pszProfileXml := pszProfileXml is String ? StrPtr(pszProfileXml) : pszProfileXml

        result := ComCall(9, this, "ptr", pszProfileXml, "HRESULT")
        return result
    }

    /**
     * The GetVendorExtension method gets a cached vendor extension from the device.
     * @remarks
     * To query the size of a vendor extension, you can pass a value of 0 with the <i>dwMaxBufferSize</i> parameter, and <i>pdwBufferUsed</i> will receive the size.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getvendorextension
     */
    GetVendorExtension(pVendorExtSpec, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwBufferUsedMarshal := pdwBufferUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, WCN_VENDOR_EXTENSION_SPEC.Ptr, pVendorExtSpec, "uint", dwMaxBufferSize, pbBufferMarshal, pbBuffer, pdwBufferUsedMarshal, pdwBufferUsed, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-setvendorextension
     */
    SetVendorExtension(pVendorExtSpec, cbBuffer, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, WCN_VENDOR_EXTENSION_SPEC.Ptr, pVendorExtSpec, "uint", cbBuffer, pbBufferMarshal, pbBuffer, "HRESULT")
        return result
    }

    /**
     * IWCNDevice::Unadvise method removes any callback previously set via IWCNDevice::Connect.
     * @remarks
     * It is not necessary to call <b>IWCNDevice::Unadvise</b> unless the application is shutting down and must ensure that no more callbacks are received on its <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nn-wcndevice-iwcnconnectnotify">IWCNConnectNotify</a> callback.
     * Do not call <b>IWCNDevice::Unadvise</b> from within an <b>IWCNConnectNotify</b> callback, since that will cause a deadlock.
     * Note that <b>IWCNDevice::Unadvise</b> does not cancel the connect operation on the wire.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-unadvise
     */
    Unadvise() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WCN_PASSWORD_TYPE} Type 
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

        result := ComCall(13, this, WCN_PASSWORD_TYPE, Type, "uint", dwOOBPasswordID, "uint", dwPasswordLength, pbPasswordMarshal, pbPassword, "uint", dwRemotePublicKeyHashLength, pbRemotePublicKeyHashMarshal, pbRemotePublicKeyHash, "uint", dwDHKeyBlobLength, pbDHKeyBlobMarshal, pbDHKeyBlob, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWCNDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPassword := CallbackCreate(GetMethod(implObj, "SetPassword"), flags, 4)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.GetAttribute := CallbackCreate(GetMethod(implObj, "GetAttribute"), flags, 5)
        this.vtbl.GetIntegerAttribute := CallbackCreate(GetMethod(implObj, "GetIntegerAttribute"), flags, 3)
        this.vtbl.GetStringAttribute := CallbackCreate(GetMethod(implObj, "GetStringAttribute"), flags, 4)
        this.vtbl.GetNetworkProfile := CallbackCreate(GetMethod(implObj, "GetNetworkProfile"), flags, 3)
        this.vtbl.SetNetworkProfile := CallbackCreate(GetMethod(implObj, "SetNetworkProfile"), flags, 2)
        this.vtbl.GetVendorExtension := CallbackCreate(GetMethod(implObj, "GetVendorExtension"), flags, 5)
        this.vtbl.SetVendorExtension := CallbackCreate(GetMethod(implObj, "SetVendorExtension"), flags, 4)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 1)
        this.vtbl.SetNFCPasswordParams := CallbackCreate(GetMethod(implObj, "SetNFCPasswordParams"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPassword)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.GetAttribute)
        CallbackFree(this.vtbl.GetIntegerAttribute)
        CallbackFree(this.vtbl.GetStringAttribute)
        CallbackFree(this.vtbl.GetNetworkProfile)
        CallbackFree(this.vtbl.SetNetworkProfile)
        CallbackFree(this.vtbl.GetVendorExtension)
        CallbackFree(this.vtbl.SetVendorExtension)
        CallbackFree(this.vtbl.Unadvise)
        CallbackFree(this.vtbl.SetNFCPasswordParams)
    }
}
