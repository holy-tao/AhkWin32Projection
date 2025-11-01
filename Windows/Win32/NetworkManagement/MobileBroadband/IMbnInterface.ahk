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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InterfaceID", "GetInterfaceCapability", "GetSubscriberInformation", "GetReadyState", "InEmergencyMode", "GetHomeProvider", "GetPreferredProviders", "SetPreferredProviders", "GetVisibleProviders", "ScanNetwork", "GetConnection"]

    /**
     * 
     * @param {Pointer<BSTR>} InterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid
     */
    get_InterfaceID(InterfaceID) {
        result := ComCall(3, this, "ptr", InterfaceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MBN_INTERFACE_CAPS>} interfaceCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability
     */
    GetInterfaceCapability(interfaceCaps) {
        result := ComCall(4, this, "ptr", interfaceCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMbnSubscriberInformation>} subscriberInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation
     */
    GetSubscriberInformation(subscriberInformation) {
        result := ComCall(5, this, "ptr*", subscriberInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} readyState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getreadystate
     */
    GetReadyState(readyState) {
        readyStateMarshal := readyState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, readyStateMarshal, readyState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} emergencyMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-inemergencymode
     */
    InEmergencyMode(emergencyMode) {
        result := ComCall(7, this, "ptr", emergencyMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MBN_PROVIDER>} homeProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-gethomeprovider
     */
    GetHomeProvider(homeProvider) {
        result := ComCall(8, this, "ptr", homeProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} preferredProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getpreferredproviders
     */
    GetPreferredProviders(preferredProviders) {
        result := ComCall(9, this, "ptr*", preferredProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} preferredProviders 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-setpreferredproviders
     */
    SetPreferredProviders(preferredProviders, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", preferredProviders, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} age 
     * @param {Pointer<Pointer<SAFEARRAY>>} visibleProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getvisibleproviders
     */
    GetVisibleProviders(age, visibleProviders) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, ageMarshal, age, "ptr*", visibleProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-scannetwork
     */
    ScanNetwork(requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMbnConnection>} mbnConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getconnection
     */
    GetConnection(mbnConnection) {
        result := ComCall(13, this, "ptr*", mbnConnection, "HRESULT")
        return result
    }
}
