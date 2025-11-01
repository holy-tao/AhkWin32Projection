#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} registerState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getregisterstate
     */
    GetRegisterState(registerState) {
        result := ComCall(3, this, "int*", registerState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} registerMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getregistermode
     */
    GetRegisterMode(registerMode) {
        result := ComCall(4, this, "int*", registerMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} providerID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getproviderid
     */
    GetProviderID(providerID) {
        result := ComCall(5, this, "ptr", providerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} providerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getprovidername
     */
    GetProviderName(providerName) {
        result := ComCall(6, this, "ptr", providerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} roamingText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getroamingtext
     */
    GetRoamingText(roamingText) {
        result := ComCall(7, this, "ptr", roamingText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} availableDataClasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getavailabledataclasses
     */
    GetAvailableDataClasses(availableDataClasses) {
        result := ComCall(8, this, "uint*", availableDataClasses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} currentDataClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getcurrentdataclass
     */
    GetCurrentDataClass(currentDataClass) {
        result := ComCall(9, this, "uint*", currentDataClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} registrationNetworkError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getregistrationnetworkerror
     */
    GetRegistrationNetworkError(registrationNetworkError) {
        result := ComCall(10, this, "uint*", registrationNetworkError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} packetAttachNetworkError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getpacketattachnetworkerror
     */
    GetPacketAttachNetworkError(packetAttachNetworkError) {
        result := ComCall(11, this, "uint*", packetAttachNetworkError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} registerMode 
     * @param {PWSTR} providerID 
     * @param {Integer} dataClass 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-setregistermode
     */
    SetRegisterMode(registerMode, providerID, dataClass, requestID) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(12, this, "int", registerMode, "ptr", providerID, "uint", dataClass, "uint*", requestID, "HRESULT")
        return result
    }
}
