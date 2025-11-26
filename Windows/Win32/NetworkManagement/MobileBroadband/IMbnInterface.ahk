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
     * The interface ID.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(3, this, "ptr", InterfaceID, "HRESULT")
        return InterfaceID
    }

    /**
     * Gets the capabilities of the device.
     * @returns {MBN_INTERFACE_CAPS} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure that contains the interface capabilities.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-getinterfacecapability
     */
    GetInterfaceCapability() {
        interfaceCaps := MBN_INTERFACE_CAPS()
        result := ComCall(4, this, "ptr", interfaceCaps, "HRESULT")
        return interfaceCaps
    }

    /**
     * Gets the subscriber information.
     * @returns {IMbnSubscriberInformation} A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsubscriberinformation">IMbnSubscriberInformation</a> interface that contains subscriber information for the device.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation
     */
    GetSubscriberInformation() {
        result := ComCall(5, this, "ptr*", &subscriberInformation := 0, "HRESULT")
        return IMbnSubscriberInformation(subscriberInformation)
    }

    /**
     * Gets the ready state.
     * @returns {Integer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_ready_state">MBN_READY_STATE</a> structure.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-getreadystate
     */
    GetReadyState() {
        result := ComCall(6, this, "int*", &readyState := 0, "HRESULT")
        return readyState
    }

    /**
     * Determines whether the device is in emergency mode.
     * @returns {VARIANT_BOOL} Points to VARIANT_TRUE if the device is in emergency mode, and VARIANT_FALSE if it is not.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-inemergencymode
     */
    InEmergencyMode() {
        result := ComCall(7, this, "short*", &emergencyMode := 0, "HRESULT")
        return emergencyMode
    }

    /**
     * Gets the home provider.
     * @returns {MBN_PROVIDER} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure that represents the home provider.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.  Upon completion, the calling application must free the memory allocated to the  <b>providerID</b> and <b>providerName</b> members of <b>MBN_PROVIDER</b> by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-gethomeprovider
     */
    GetHomeProvider() {
        homeProvider := MBN_PROVIDER()
        result := ComCall(8, this, "ptr", homeProvider, "HRESULT")
        return homeProvider
    }

    /**
     * Gets the list of preferred providers.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structures that contains the list of preferred providers.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.   When <b>GetPreferredProviders</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-getpreferredproviders
     */
    GetPreferredProviders() {
        result := ComCall(9, this, "ptr*", &preferredProviders := 0, "HRESULT")
        return preferredProviders
    }

    /**
     * Updates the preferred providers list for the device.
     * @param {Pointer<SAFEARRAY>} preferredProviders An array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structures that contains the list of preferred providers.
     * @returns {Integer} Pointer to the request ID set by the operating system for this request.  The asynchronous response will contain this same <i>requestID</i>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-setpreferredproviders
     */
    SetPreferredProviders(preferredProviders) {
        result := ComCall(10, this, "ptr", preferredProviders, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the list of visible providers.
     * @param {Pointer<Integer>} age A pointer to the time in seconds since the last refresh of the visible provider list from the device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structures that contains the list of providers for the interface.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.  Otherwise, upon completion, the calling program must free the allocated memory  by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-getvisibleproviders
     */
    GetVisibleProviders(age) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, ageMarshal, age, "ptr*", &visibleProviders := 0, "HRESULT")
        return visibleProviders
    }

    /**
     * Asynchronously scans the network to get a list of visible providers.
     * @returns {Integer} Pointer to the request ID set by the operating system for this request.  The asynchronous response will contain this same <i>requestID</i>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-scannetwork
     */
    ScanNetwork() {
        result := ComCall(12, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the IMbnConnection object.
     * @returns {IMbnConnection} The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbninterface-getconnection
     */
    GetConnection() {
        result := ComCall(13, this, "ptr*", &mbnConnection := 0, "HRESULT")
        return IMbnConnection(mbnConnection)
    }
}
