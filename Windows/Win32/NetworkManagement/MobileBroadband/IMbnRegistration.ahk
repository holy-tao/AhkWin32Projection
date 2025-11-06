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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getregisterstate
     */
    GetRegisterState() {
        result := ComCall(3, this, "int*", &registerState := 0, "HRESULT")
        return registerState
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getregistermode
     */
    GetRegisterMode() {
        result := ComCall(4, this, "int*", &registerMode := 0, "HRESULT")
        return registerMode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getproviderid
     */
    GetProviderID() {
        providerID := BSTR()
        result := ComCall(5, this, "ptr", providerID, "HRESULT")
        return providerID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getprovidername
     */
    GetProviderName() {
        providerName := BSTR()
        result := ComCall(6, this, "ptr", providerName, "HRESULT")
        return providerName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getroamingtext
     */
    GetRoamingText() {
        roamingText := BSTR()
        result := ComCall(7, this, "ptr", roamingText, "HRESULT")
        return roamingText
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getavailabledataclasses
     */
    GetAvailableDataClasses() {
        result := ComCall(8, this, "uint*", &availableDataClasses := 0, "HRESULT")
        return availableDataClasses
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getcurrentdataclass
     */
    GetCurrentDataClass() {
        result := ComCall(9, this, "uint*", &currentDataClass := 0, "HRESULT")
        return currentDataClass
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getregistrationnetworkerror
     */
    GetRegistrationNetworkError() {
        result := ComCall(10, this, "uint*", &registrationNetworkError := 0, "HRESULT")
        return registrationNetworkError
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-getpacketattachnetworkerror
     */
    GetPacketAttachNetworkError() {
        result := ComCall(11, this, "uint*", &packetAttachNetworkError := 0, "HRESULT")
        return packetAttachNetworkError
    }

    /**
     * 
     * @param {Integer} registerMode 
     * @param {PWSTR} providerID 
     * @param {Integer} dataClass 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnregistration-setregistermode
     */
    SetRegisterMode(registerMode, providerID, dataClass) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(12, this, "int", registerMode, "ptr", providerID, "uint", dataClass, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
