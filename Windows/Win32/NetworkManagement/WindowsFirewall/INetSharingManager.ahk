#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetSharingPublicConnectionCollection.ahk
#Include .\INetSharingPrivateConnectionCollection.ahk
#Include .\INetSharingConfiguration.ahk
#Include .\INetSharingEveryConnectionCollection.ahk
#Include .\INetConnectionProps.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingManager interface is the primary interface for the Manager object. INetSharingManager provides methods to determine if sharing is installed, to manage port mappings, and to obtain enumeration interfaces for public and private connections.
 * @remarks
 * 
 * To obtain an enumeration interface for port mappings, use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">get_INetSharingConfigurationForINetConnection</a> method to obtain an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface. Then use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingconfiguration-get_enumportmappings">INetSharingConfiguration::EnumPortMappings</a> method to obtain an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/nn-netcon-ienumnetsharingportmapping">IEnumNetSharingPortMapping</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingmanager
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingManager
     * @type {Guid}
     */
    static IID => Guid("{c08956b7-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The class identifier for NetSharingManager
     * @type {Guid}
     */
    static CLSID => Guid("{5c63c1ad-3956-4ff8-8486-40034758315b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SharingInstalled", "get_EnumPublicConnections", "get_EnumPrivateConnections", "get_INetSharingConfigurationForINetConnection", "get_EnumEveryConnection", "get_NetConnectionProps"]

    /**
     * @type {VARIANT_BOOL} 
     */
    SharingInstalled {
        get => this.get_SharingInstalled()
    }

    /**
     * @type {INetSharingEveryConnectionCollection} 
     */
    EnumEveryConnection {
        get => this.get_EnumEveryConnection()
    }

    /**
     * Reports whether the currently-installed version of Windows XP supports connection sharing.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> that specifies whether the currently-installed version Windows XP supports connection sharing. For more information, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingmanager-get_sharinginstalled
     */
    get_SharingInstalled() {
        result := ComCall(7, this, "short*", &pbInstalled := 0, "HRESULT")
        return pbInstalled
    }

    /**
     * The EnumPublicConnections method retrieves an enumeration interface for publicly-shared connections.
     * @param {Integer} Flags This parameter must be ICSSC_DEFAULT.
     * @returns {INetSharingPublicConnectionCollection} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingpublicconnectioncollection">INetSharingPublicConnectionCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingmanager-get_enumpublicconnections
     */
    get_EnumPublicConnections(Flags) {
        result := ComCall(8, this, "int", Flags, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingPublicConnectionCollection(ppColl)
    }

    /**
     * The get_EnumPrivateConnections method retrieves an enumeration interface for privately-shared connections.
     * @param {Integer} Flags This parameter must be ICSSC_DEFAULT.
     * @returns {INetSharingPrivateConnectionCollection} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/nn-netcon-inetsharingprivateconnectioncollection">INetSharingPrivateConnectionCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingmanager-get_enumprivateconnections
     */
    get_EnumPrivateConnections(Flags) {
        result := ComCall(9, this, "int", Flags, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingPrivateConnectionCollection(ppColl)
    }

    /**
     * The get_INetSharingConfigurationForINetConnection method retrieves an INetSharingConfiguration interface for the specified connection.
     * @param {INetConnection} pNetConnection Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetconnection">INetConnection</a> interface for an Internet connection.
     * @returns {INetSharingConfiguration} Pointer to an interface pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for the connection specified by the <i>pNetConnection</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection
     */
    get_INetSharingConfigurationForINetConnection(pNetConnection) {
        result := ComCall(10, this, "ptr", pNetConnection, "ptr*", &ppNetSharingConfiguration := 0, "HRESULT")
        return INetSharingConfiguration(ppNetSharingConfiguration)
    }

    /**
     * The get_EnumEveryConnection method retrieves an enumeration interface for all the connections in the connection folder.
     * @returns {INetSharingEveryConnectionCollection} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingeveryconnectioncollection">INetSharingEveryConnectionCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingmanager-get_enumeveryconnection
     */
    get_EnumEveryConnection() {
        result := ComCall(11, this, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingEveryConnectionCollection(ppColl)
    }

    /**
     * The get_NetConnectionProps method retrieves a properties interface for the specified connection.
     * @param {INetConnection} pNetConnection Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetconnection">INetConnection</a> interface for the connection for which to retrieve the properties interface.
     * @returns {INetConnectionProps} Pointer to an interface pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetconnectionprops">INetConnectionProps</a> interface for the connection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingmanager-get_netconnectionprops
     */
    get_NetConnectionProps(pNetConnection) {
        result := ComCall(12, this, "ptr", pNetConnection, "ptr*", &ppProps := 0, "HRESULT")
        return INetConnectionProps(ppProps)
    }
}
