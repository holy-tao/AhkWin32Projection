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
     * 
     * @param {Pointer<Int32>} registerState 
     * @returns {HRESULT} 
     */
    GetRegisterState(registerState) {
        result := ComCall(3, this, "int*", registerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} registerMode 
     * @returns {HRESULT} 
     */
    GetRegisterMode(registerMode) {
        result := ComCall(4, this, "int*", registerMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} providerID 
     * @returns {HRESULT} 
     */
    GetProviderID(providerID) {
        result := ComCall(5, this, "ptr", providerID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} providerName 
     * @returns {HRESULT} 
     */
    GetProviderName(providerName) {
        result := ComCall(6, this, "ptr", providerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} roamingText 
     * @returns {HRESULT} 
     */
    GetRoamingText(roamingText) {
        result := ComCall(7, this, "ptr", roamingText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} availableDataClasses 
     * @returns {HRESULT} 
     */
    GetAvailableDataClasses(availableDataClasses) {
        result := ComCall(8, this, "uint*", availableDataClasses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} currentDataClass 
     * @returns {HRESULT} 
     */
    GetCurrentDataClass(currentDataClass) {
        result := ComCall(9, this, "uint*", currentDataClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} registrationNetworkError 
     * @returns {HRESULT} 
     */
    GetRegistrationNetworkError(registrationNetworkError) {
        result := ComCall(10, this, "uint*", registrationNetworkError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} packetAttachNetworkError 
     * @returns {HRESULT} 
     */
    GetPacketAttachNetworkError(packetAttachNetworkError) {
        result := ComCall(11, this, "uint*", packetAttachNetworkError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} registerMode 
     * @param {PWSTR} providerID 
     * @param {Integer} dataClass 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetRegisterMode(registerMode, providerID, dataClass, requestID) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(12, this, "int", registerMode, "ptr", providerID, "uint", dataClass, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
