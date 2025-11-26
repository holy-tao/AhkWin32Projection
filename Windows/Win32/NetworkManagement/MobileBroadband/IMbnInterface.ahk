#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\MBN_INTERFACE_CAPS.ahk
#Include .\IMbnSubscriberInformation.ahk
#Include .\MBN_PROVIDER.ahk
#Include .\IMbnConnection.ahk
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
     * @type {BSTR} 
     */
    InterfaceID {
        get => this.get_InterfaceID()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(3, this, "ptr", InterfaceID, "HRESULT")
        return InterfaceID
    }

    /**
     * 
     * @returns {MBN_INTERFACE_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability
     */
    GetInterfaceCapability() {
        interfaceCaps := MBN_INTERFACE_CAPS()
        result := ComCall(4, this, "ptr", interfaceCaps, "HRESULT")
        return interfaceCaps
    }

    /**
     * 
     * @returns {IMbnSubscriberInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation
     */
    GetSubscriberInformation() {
        result := ComCall(5, this, "ptr*", &subscriberInformation := 0, "HRESULT")
        return IMbnSubscriberInformation(subscriberInformation)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getreadystate
     */
    GetReadyState() {
        result := ComCall(6, this, "int*", &readyState := 0, "HRESULT")
        return readyState
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-inemergencymode
     */
    InEmergencyMode() {
        result := ComCall(7, this, "short*", &emergencyMode := 0, "HRESULT")
        return emergencyMode
    }

    /**
     * 
     * @returns {MBN_PROVIDER} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-gethomeprovider
     */
    GetHomeProvider() {
        homeProvider := MBN_PROVIDER()
        result := ComCall(8, this, "ptr", homeProvider, "HRESULT")
        return homeProvider
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getpreferredproviders
     */
    GetPreferredProviders() {
        result := ComCall(9, this, "ptr*", &preferredProviders := 0, "HRESULT")
        return preferredProviders
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} preferredProviders 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-setpreferredproviders
     */
    SetPreferredProviders(preferredProviders) {
        result := ComCall(10, this, "ptr", preferredProviders, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Pointer<Integer>} age 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getvisibleproviders
     */
    GetVisibleProviders(age) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, ageMarshal, age, "ptr*", &visibleProviders := 0, "HRESULT")
        return visibleProviders
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-scannetwork
     */
    ScanNetwork() {
        result := ComCall(12, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {IMbnConnection} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbninterface-getconnection
     */
    GetConnection() {
        result := ComCall(13, this, "ptr*", &mbnConnection := 0, "HRESULT")
        return IMbnConnection(mbnConnection)
    }
}
