#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to network registration data.
 * @remarks
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nn-mbnapi-imbnregistration
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnRegistration
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2009-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRegisterState", "GetRegisterMode", "GetProviderID", "GetProviderName", "GetRoamingText", "GetAvailableDataClasses", "GetCurrentDataClass", "GetRegistrationNetworkError", "GetPacketAttachNetworkError", "SetRegisterMode"]

    /**
     * Gets the registration state.
     * @remarks
     * The <b>GetRegisterState</b> method gets the current network registration state of the device.  The device can be registered to a network, searching the network for registration,  or it can be denied registration.
     * 
     * The registration state of device can change automatically.  For example, when the device goes out of the network coverage area, it changes the registration state from <b>MBN_REGISTER_STATE_HOME</b> to <b>MBN_REGISTER_STATE_SEARCHING</b>.
     * 
     * An application can register for receiving registration state change updates by connecting <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a> interface. Windows will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <b>IMbnRegistrationEvents</b> to notify the application about these changes.
     * 
     * For the recoverable error <b>E_MBN_PIN_REQUIRED</b>,  the Mobile Broadband service will again try to fetch this information from the device when the error condition is over (when a PIN is entered). Then it will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {Integer} A pointer an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_state">MBN_REGISTER_STATE</a> value that specifies to the current registration state of the device.  The value is meaningful only if the method returned <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getregisterstate
     */
    GetRegisterState() {
        result := ComCall(3, this, "int*", &registerState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return registerState
    }

    /**
     * Gets the network registration mode of a Mobile Broadband device.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_mode">MBN_REGISTER_MODE</a> for details on possible registration modes.
     * 
     * For recoverable error <b>E_MBN_PIN_REQUIRED</b>, the Mobile Broadband service will again try to fetch this information from the device when the  error condition is over (when a PIN is entered). Then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregistermodeavailable">OnRegisterModeAvailable</a> method of   <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_mode">MBN_REGISTER_MODE</a> value that specifies the current network registration mode of the device.  The value is meaningful only if the method returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getregistermode
     */
    GetRegisterMode() {
        result := ComCall(4, this, "int*", &registerMode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return registerMode
    }

    /**
     * Gets the provider ID for the currently registered network.
     * @remarks
     * The <b>GetProviderID</b> method gets  the ID of the currently registered provider. For auto network selection mode this is the ID of the network to which the device is currently registered. If the network selection mode is manual then this field will contain the provider ID of the network to which device will try to register. For CDMA devices it is set to <b>MBN_CDMA_DEFAULT_PROVIDER_ID</b> if the provider ID is not known.
     * 
     * This information may change when the Mobile Broadband device moves from one network to another. This includes whenever there is a change from <b>MBN_REGISTER_STATE_HOME</b> to <b>MBN_REGISTER_STATE_SEARCHING</b> in the network registration state.  This also occurs  when there is a change in the registered network, such as when a network moves its registration from one provider to another.  After such changes, the Mobile Broadband service will call the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>. When this happens, the application should call <b>GetProviderID</b>.
     * 
     * For the recoverable error <b>E_MBN_PIN_REQUIRED</b>, the Mobile Broadband service will again try to fetch this information from the device when the error condition is over (when a PIN is entered). Afterwards, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {BSTR} Pointer to a string that contains the ID of the currently registered provider.  The maximum length is <b>MBN_PROVIDERID_LEN</b> characters.  The string is filled only when the method returns <b>S_OK</b> for success.  Upon success, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getproviderid
     */
    GetProviderID() {
        providerID := BSTR()
        result := ComCall(5, this, "ptr", providerID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return providerID
    }

    /**
     * Gets the provider name for the currently registered network.
     * @remarks
     * The provider name may change when the Mobile Broadband device moves from one network to another. This includes whenever there is change from <b>MBN_REGISTER_STATE_HOME</b> to <b>MBN_REGISTER_STATE_SEARCHING</b> in the network registration state.  This also occurs when there is a change in the registered network, such as when a  network changes its registration from one provider to another.  After such changes, the Mobile Broadband service will call the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>. When this happens, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistration-getproviderid">GetProviderID</a>.
     * 
     * For the recoverable error <b>E_MBN_PIN_REQUIRED</b>, the Mobile Broadband service will try to refetch this information from the device when the error condition is over (when a PIN is entered).  Then it will call the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {BSTR} Pointer to a string that contains the name of the currently registered provider.  The maximum length of this string is <b>MBN_PROVIDERNAME_LEN</b> characters.  The string is filled only when the method returns <b>S_OK</b> for success.  Upon success, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getprovidername
     */
    GetProviderName() {
        providerName := BSTR()
        result := ComCall(6, this, "ptr", providerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return providerName
    }

    /**
     * Gets the roaming text describing the roaming provider.
     * @remarks
     * The <b>GetRoamingText</b> method can get a text string containing additional information about the network when the registration state is either <b>MBN_REGISTER_STATE_PARTNER</b> or <b>MBN_REGISTER_STATE_ROAMING</b>.
     * 
     * This information may change when the Mobile Broadband device moves from one network to another. This includes whenever there is a change from <b>MBN_REGISTER_STATE_HOME</b> to <b>MBN_REGISTER_STATE_SEARCHING</b> in the network registration state.  This also occurs  when there is a change in the registered network, such as when a network moves its registration from one provider to another.  After such changes, the Mobile Broadband service will call the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * 
     * For the recoverable error <b>E_MBN_PIN_REQUIRED</b>, the Mobile Broadband service will again try to fetch this information from the device when the error condition is over (when a PIN is entered).  Then it will call the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {BSTR} Pointer to a string that contains additional information about a network with which the device is roaming. The maximum length is <b>MBN_ROAMTEXT_LEN</b> characters.  The string is filled only when the method returns <b>S_OK</b> for success.  Upon success, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getroamingtext
     */
    GetRoamingText() {
        roamingText := BSTR()
        result := ComCall(7, this, "ptr", roamingText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return roamingText
    }

    /**
     * Gets the available data classes in the current network.
     * @remarks
     * <b>GetAvailableDataClasses</b> returns the set of data class possible in the current network. These values can be set to <b>MBN_DATA_CLASS_NONE</b> if value is not known.
     * 
     * Available data classes can change automatically as a device moves from one cell to another. Whenever such a change occurs, the Mobile Broadband service will notify applications by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * 
     * For the recoverable error <b>E_MBN_PIN_REQUIRED</b>, the Mobile Broadband service will again try to fetch this information from the device when the error condition is over (when a PIN is entered). Afterwards, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {Integer} A pointer to a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> values.  This parameter is meaningful only if the function returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getavailabledataclasses
     */
    GetAvailableDataClasses() {
        result := ComCall(8, this, "uint*", &availableDataClasses := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return availableDataClasses
    }

    /**
     * Gets the current data class in the current network.
     * @remarks
     * The <b>GetCurrentDataClass</b> method returns the data class in the current network. This value can be set to <b>MBN_DATA_CLASS_NONE</b> if value is not known.
     * 
     * The current data class can change automatically as a device moves from one cellular network to another. Whenever such a change occurs, the Mobile Broadband service will notify applications by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * 
     * For the recoverable error <b>E_MBN_PIN_REQUIRED</b>, the Mobile Broadband service will again try to fetch this information from the device when the error condition is over (when a PIN is entered). Afterwards, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {Integer} A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> value.  This parameter is meaningful only if the function returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getcurrentdataclass
     */
    GetCurrentDataClass() {
        result := ComCall(9, this, "uint*", &currentDataClass := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return currentDataClass
    }

    /**
     * Gets the network error from a registration operation.
     * @remarks
     * For GSM devices, the error codes are defined in 3GPP specification 24.008 as "cause codes".  For CDMA devices, the codes are device and network specific.
     * 
     * The error codes are cleared when the packet attach operation completes successfully.
     * 
     * Whenever there is a change in the network error value, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onregisterstatechange">OnRegisterStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {Integer} A pointer to an error code returned by the last failed network registration operation.  This is set to 0 if there is no error or if the error code is unknown.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getregistrationnetworkerror
     */
    GetRegistrationNetworkError() {
        result := ComCall(10, this, "uint*", &registrationNetworkError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return registrationNetworkError
    }

    /**
     * Gets the network error from a packet attach operation.
     * @remarks
     * For GSM devices, the error codes are defined in 3GPP specification 24.008 as "cause codes".  For CDMA devices, the codes are device and network specific.
     * 
     * The error codes are cleared when the packet attach operation completes successfully.
     * 
     * Whenever there is a change in the network error value, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @returns {Integer} A pointer to an error code returned by the last failed network packet attach operation.  This is set to 0 if there is no error or if the error code is unknown.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-getpacketattachnetworkerror
     */
    GetPacketAttachNetworkError() {
        result := ComCall(11, this, "uint*", &packetAttachNetworkError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return packetAttachNetworkError
    }

    /**
     * Sets the registration mode for the device.
     * @remarks
     * The <b>SetRegisterMode</b> method can be used to set a device into automatic or manual network selection mode. For manual registration mode the network ID to which the device should register is supplied in <i>providerID</i>.
     * 
     * Support for manual registration mode is optional and the application should verify that the device supports manual registration by checking for <b>MBN_CTRL_CAPS_REG_MANUAL</b> in the <i>interfaceCaps</i> parameter filled by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability">GetInterfaceCapability</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>. If an application sets the manual registration mode and it is not supported by the device, then this call will return <b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b>.
     * 
     * 
     * <b>SetRegisterMode</b> is asynchronous and will return immediately. If there is no error, on completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onsetregistermodecomplete">OnSetRegisterModeComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a>.
     * @param {Integer} registerMode An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_mode">MBN_REGISTER_MODE</a> value that specifies the new registration mode.
     * @param {PWSTR} providerID A string that specifies the provider ID of the network provider to which to register.  Must be <b>NULL</b> when <i>registerMode</i> is <b>MBN_REGISTER_MODE_AUTOMATIC</b>.
     * @param {Integer} dataClass A bitwise combination of OR <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> values that specify the preferred data access technologies for the connection.  The Mobile Broadband service will register the highest available data class technology from this list.  If no data class from this list can be registered to, then the Mobile Broadband service will register to the best available data class.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnregistration-setregistermode
     */
    SetRegisterMode(registerMode, providerID, dataClass) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(12, this, "int", registerMode, "ptr", providerID, "uint", dataClass, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }
}
