#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to network registration data.
 * @remarks
 * 
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnregistration
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
     * @returns {Integer} A pointer an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_state">MBN_REGISTER_STATE</a> value that specifies to the current registration state of the device.  The value is meaningful only if the method returned <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getregisterstate
     */
    GetRegisterState() {
        result := ComCall(3, this, "int*", &registerState := 0, "HRESULT")
        return registerState
    }

    /**
     * Gets the network registration mode of a Mobile Broadband device.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_mode">MBN_REGISTER_MODE</a> value that specifies the current network registration mode of the device.  The value is meaningful only if the method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getregistermode
     */
    GetRegisterMode() {
        result := ComCall(4, this, "int*", &registerMode := 0, "HRESULT")
        return registerMode
    }

    /**
     * Gets the provider ID for the currently registered network.
     * @returns {BSTR} Pointer to a string that contains the ID of the currently registered provider.  The maximum length is <b>MBN_PROVIDERID_LEN</b> characters.  The string is filled only when the method returns <b>S_OK</b> for success.  Upon success, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getproviderid
     */
    GetProviderID() {
        providerID := BSTR()
        result := ComCall(5, this, "ptr", providerID, "HRESULT")
        return providerID
    }

    /**
     * Gets the provider name for the currently registered network.
     * @returns {BSTR} Pointer to a string that contains the name of the currently registered provider.  The maximum length of this string is <b>MBN_PROVIDERNAME_LEN</b> characters.  The string is filled only when the method returns <b>S_OK</b> for success.  Upon success, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getprovidername
     */
    GetProviderName() {
        providerName := BSTR()
        result := ComCall(6, this, "ptr", providerName, "HRESULT")
        return providerName
    }

    /**
     * Gets the roaming text describing the roaming provider.
     * @returns {BSTR} Pointer to a string that contains additional information about a network with which the device is roaming. The maximum length is <b>MBN_ROAMTEXT_LEN</b> characters.  The string is filled only when the method returns <b>S_OK</b> for success.  Upon success, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getroamingtext
     */
    GetRoamingText() {
        roamingText := BSTR()
        result := ComCall(7, this, "ptr", roamingText, "HRESULT")
        return roamingText
    }

    /**
     * Gets the available data classes in the current network.
     * @returns {Integer} A pointer to a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> values.  This parameter is meaningful only if the function returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getavailabledataclasses
     */
    GetAvailableDataClasses() {
        result := ComCall(8, this, "uint*", &availableDataClasses := 0, "HRESULT")
        return availableDataClasses
    }

    /**
     * Gets the current data class in the current network.
     * @returns {Integer} A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> value.  This parameter is meaningful only if the function returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getcurrentdataclass
     */
    GetCurrentDataClass() {
        result := ComCall(9, this, "uint*", &currentDataClass := 0, "HRESULT")
        return currentDataClass
    }

    /**
     * Gets the network error from a registration operation.
     * @returns {Integer} A pointer to an error code returned by the last failed network registration operation.  This is set to 0 if there is no error or if the error code is unknown.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getregistrationnetworkerror
     */
    GetRegistrationNetworkError() {
        result := ComCall(10, this, "uint*", &registrationNetworkError := 0, "HRESULT")
        return registrationNetworkError
    }

    /**
     * Gets the network error from a packet attach operation.
     * @returns {Integer} A pointer to an error code returned by the last failed network packet attach operation.  This is set to 0 if there is no error or if the error code is unknown.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-getpacketattachnetworkerror
     */
    GetPacketAttachNetworkError() {
        result := ComCall(11, this, "uint*", &packetAttachNetworkError := 0, "HRESULT")
        return packetAttachNetworkError
    }

    /**
     * Sets the registration mode for the device.
     * @param {Integer} registerMode An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_register_mode">MBN_REGISTER_MODE</a> value that specifies the new registration mode.
     * @param {PWSTR} providerID A string that specifies the provider ID of the network provider to which to register.  Must be <b>NULL</b> when <i>registerMode</i> is <b>MBN_REGISTER_MODE_AUTOMATIC</b>.
     * @param {Integer} dataClass A bitwise combination of OR <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> values that specify the preferred data access technologies for the connection.  The Mobile Broadband service will register the highest available data class technology from this list.  If no data class from this list can be registered to, then the Mobile Broadband service will register to the best available data class.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnregistration-setregistermode
     */
    SetRegisterMode(registerMode, providerID, dataClass) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(12, this, "int", registerMode, "ptr", providerID, "uint", dataClass, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
