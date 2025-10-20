#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Mobile Broadband device.
 * @remarks
 * 
  * <b>IMbnInterface</b> objects are provided by calls to the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterface">GetInterface</a> and 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterfacemanager-getinterfaces">GetInterfaces</a> methods of the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbninterface
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnInterface extends IUnknown{
    /**
     * The interface identifier for IMbnInterface
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2001-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} InterfaceID 
     * @returns {HRESULT} 
     */
    get_InterfaceID(InterfaceID) {
        result := ComCall(3, this, "ptr", InterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MBN_INTERFACE_CAPS>} interfaceCaps 
     * @returns {HRESULT} 
     */
    GetInterfaceCapability(interfaceCaps) {
        result := ComCall(4, this, "ptr", interfaceCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnSubscriberInformation>} subscriberInformation 
     * @returns {HRESULT} 
     */
    GetSubscriberInformation(subscriberInformation) {
        result := ComCall(5, this, "ptr", subscriberInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} readyState 
     * @returns {HRESULT} 
     */
    GetReadyState(readyState) {
        result := ComCall(6, this, "int*", readyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} emergencyMode 
     * @returns {HRESULT} 
     */
    InEmergencyMode(emergencyMode) {
        result := ComCall(7, this, "ptr", emergencyMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MBN_PROVIDER>} homeProvider 
     * @returns {HRESULT} 
     */
    GetHomeProvider(homeProvider) {
        result := ComCall(8, this, "ptr", homeProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} preferredProviders 
     * @returns {HRESULT} 
     */
    GetPreferredProviders(preferredProviders) {
        result := ComCall(9, this, "ptr", preferredProviders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} preferredProviders 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetPreferredProviders(preferredProviders, requestID) {
        result := ComCall(10, this, "ptr", preferredProviders, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} age 
     * @param {Pointer<SAFEARRAY>} visibleProviders 
     * @returns {HRESULT} 
     */
    GetVisibleProviders(age, visibleProviders) {
        result := ComCall(11, this, "uint*", age, "ptr", visibleProviders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    ScanNetwork(requestID) {
        result := ComCall(12, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnConnection>} mbnConnection 
     * @returns {HRESULT} 
     */
    GetConnection(mbnConnection) {
        result := ComCall(13, this, "ptr", mbnConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
