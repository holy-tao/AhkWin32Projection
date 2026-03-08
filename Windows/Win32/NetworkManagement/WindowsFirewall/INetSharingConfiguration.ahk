#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetSharingPortMappingCollection.ahk
#Include .\INetSharingPortMapping.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingConfiguration interface provides methods to manage connection sharing, port mapping, and Internet Connection Firewall.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/nn-netcon-inetsharingconfiguration
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingConfiguration extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingConfiguration
     * @type {Guid}
     */
    static IID => Guid("{c08956b6-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SharingEnabled", "get_SharingConnectionType", "DisableSharing", "EnableSharing", "get_InternetFirewallEnabled", "DisableInternetFirewall", "EnableInternetFirewall", "get_EnumPortMappings", "AddPortMapping", "RemovePortMapping"]

    /**
     * @type {VARIANT_BOOL} 
     */
    SharingEnabled {
        get => this.get_SharingEnabled()
    }

    /**
     * @type {Integer} 
     */
    SharingConnectionType {
        get => this.get_SharingConnectionType()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    InternetFirewallEnabled {
        get => this.get_InternetFirewallEnabled()
    }

    /**
     * The get_SharingEnabled method determines whether sharing is enabled on this connection.
     * @remarks
     * To determine whether connection sharing is supported on the currently-installed operating system, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_sharinginstalled">INetSharingManager::get_SharingInstalled</a>.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> variable that, on successful return, specifies whether sharing is enable on this connection. If sharing is enable, this value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_sharingenabled
     */
    get_SharingEnabled() {
        result := ComCall(7, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The get_SharingConnectionType method determines the type of sharing that is enabled on this connection.
     * @remarks
     * To determine whether connection sharing is supported on the currently-installed operating system, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_sharinginstalled">INetSharingManager::get_SharingInstalled</a>.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @returns {Integer} Pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-sharingconnectiontype">SHARINGCONNECTIONTYPE</a> that specifies whether this connection is shared publicly or privately.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_sharingconnectiontype
     */
    get_SharingConnectionType() {
        result := ComCall(8, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * The DisableSharing method disables sharing on this connection. It also disables all mappings on this connection. It does not disable Internet Connection Firewall or bridge configuration.
     * @remarks
     * Calling this method triggers the following notification:
     * 
     * %programname% is attempting to disable Internet Connection Sharing (ICS). The following number of users or computers are currently sharing the Internet connection: %number%. Do you want to allow %programname% to disable ICS?
     * 
     * This method returns successfully when called on a connection that is not enabled for sharing. In this case, the method still disables all mappings on the connection.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-disablesharing
     */
    DisableSharing() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The EnableSharing method enables sharing on this connection.
     * @remarks
     * Calling this method triggers the following notification:
     * 
     * %programname% is attempting to enable Internet Connection Sharing on the network connection %connectionname%. This will allow other computers on your network to connect to the Internet through a shared public connection. Do you want %programname% to enable Internet Connection Sharing on this connection?
     * 
     * If the calling application specifies that this connection is publicly shared, any previous publicly-shared connection is automatically disabled.
     * 
     * A publicly-shared connection automatically has Internet Connection Firewall enabled. Privately-shared connections retain their existing settings.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @param {Integer} Type Specifies whether this connection is shared publicly or privately.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-enablesharing
     */
    EnableSharing(Type) {
        result := ComCall(10, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * The get_InternetFirewallEnabled method determines whether Internet Connection Firewall is enabled on this connection.
     * @remarks
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * 
     * <b>Windows XP with SP2:  </b> The resulting  firewall status is determined by the combination of  two levels: First check the global operation mode, then the mode on the interface of interest. Use the procedure <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ics/checking-the-effective-firewall-status">Checking the Effective Firewall Status</a> to determine the overall operational state.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> variable that, on successful return, specifies whether Internet Connection Firewall is enabled. If Internet Connection Firewall is enabled, this value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_internetfirewallenabled
     */
    get_InternetFirewallEnabled() {
        result := ComCall(11, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The DisableInternetFirewall method disables Internet Connection Firewall on this connection.
     * @remarks
     * Calling this method triggers the following notification:
     * 
     * %programname% is attempting to disable your Internet Connection Firewall. This  makes your computer more vulnerable to Internet security threats. Do you want to allow %programname% to disable Internet Connection Firewall?
     * 
     * This method returns successfully even if Internet Connection Firewall was not enabled on this connection.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * 
     * <b>Windows XP with SP2:  </b>Calling this API will disable the firewall on the specified interface, regardless of whether the Windows Firewall is on.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-disableinternetfirewall
     */
    DisableInternetFirewall() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The EnableInternetFirewall methods enables Internet Connection Firewall on this connection.
     * @remarks
     * Calling this method triggers the following notification:
     * 
     * %programname% is attempting to enable Internet Connection Firewall to help protect your computer or network from Internet security threats. However, it may cause some of your older Internet games to function incorrectly. Do you want to turn on Internet Connection Firewall?
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * 
     * <b>Windows XP with SP2:  </b>Calling this API will enable the firewall on the specified interface only when Windows Firewall is enabled.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-enableinternetfirewall
     */
    EnableInternetFirewall() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * The get_EnumPortMappings method retrieves an IEnumNetSharingPortMapping interface. Use this interface to enumerate the port mappings for this connection.
     * @remarks
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @param {Integer} Flags This parameter must be ICSSC_DEFAULT.
     * @returns {INetSharingPortMappingCollection} Pointer to an interface pointer that, on successful return, points to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingportmappingcollection">INetSharingPortMappingCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_enumportmappings
     */
    get_EnumPortMappings(Flags) {
        result := ComCall(14, this, "int", Flags, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingPortMappingCollection(ppColl)
    }

    /**
     * Adds a service port mapping for this connection.
     * @remarks
     * When first added, the new mapping is in a disabled state. To enable the new mapping, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingportmapping-enable">INetSharingPortMapping::Enable</a>.
     * 
     * After it is added, the new definition appears in the Port Mappings list in the ICS/ICF user interface.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @param {BSTR} bstrName Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that contains the name for this port mapping.
     * @param {Integer} ucIPProtocol 
     * @param {Integer} usExternalPort Specifies the external port for this port mapping.
     * @param {Integer} usInternalPort Specifies the internal port for this port mapping.
     * @param {Integer} dwOptions This parameter is reserved and not used at this time.
     * @param {BSTR} bstrTargetNameOrIPAddress Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that contains the name of the target computer for this port mapping. Specify either the target name or the target IP address, but not both.
     * @param {Integer} eTargetType Indicates target type.
     * @returns {INetSharingPortMapping} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingportmapping">INetSharingPortMapping</a> interface for the port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-addportmapping
     */
    AddPortMapping(bstrName, ucIPProtocol, usExternalPort, usInternalPort, dwOptions, bstrTargetNameOrIPAddress, eTargetType) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrTargetNameOrIPAddress := bstrTargetNameOrIPAddress is String ? BSTR.Alloc(bstrTargetNameOrIPAddress).Value : bstrTargetNameOrIPAddress

        result := ComCall(15, this, "ptr", bstrName, "char", ucIPProtocol, "ushort", usExternalPort, "ushort", usInternalPort, "uint", dwOptions, "ptr", bstrTargetNameOrIPAddress, "int", eTargetType, "ptr*", &ppMapping := 0, "HRESULT")
        return INetSharingPortMapping(ppMapping)
    }

    /**
     * The RemovePortMapping method removes a service port mapping from the list of mappings for this connection.
     * @remarks
     * Calling this method also removes the name of this port mapping from the list of mappings in the ICS/ICF user interface.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for a particular connection.
     * @param {INetSharingPortMapping} pMapping Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingportmapping">INetSharingPortMapping</a> interface for the port mapping to remove.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-removeportmapping
     */
    RemovePortMapping(pMapping) {
        result := ComCall(16, this, "ptr", pMapping, "HRESULT")
        return result
    }
}
