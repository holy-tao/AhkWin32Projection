#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbInstalled 
     * @returns {HRESULT} 
     */
    get_SharingInstalled(pbInstalled) {
        result := ComCall(7, this, "ptr", pbInstalled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<INetSharingPublicConnectionCollection>} ppColl 
     * @returns {HRESULT} 
     */
    get_EnumPublicConnections(Flags, ppColl) {
        result := ComCall(8, this, "int", Flags, "ptr", ppColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<INetSharingPrivateConnectionCollection>} ppColl 
     * @returns {HRESULT} 
     */
    get_EnumPrivateConnections(Flags, ppColl) {
        result := ComCall(9, this, "int", Flags, "ptr", ppColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetConnection>} pNetConnection 
     * @param {Pointer<INetSharingConfiguration>} ppNetSharingConfiguration 
     * @returns {HRESULT} 
     */
    get_INetSharingConfigurationForINetConnection(pNetConnection, ppNetSharingConfiguration) {
        result := ComCall(10, this, "ptr", pNetConnection, "ptr", ppNetSharingConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetSharingEveryConnectionCollection>} ppColl 
     * @returns {HRESULT} 
     */
    get_EnumEveryConnection(ppColl) {
        result := ComCall(11, this, "ptr", ppColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetConnection>} pNetConnection 
     * @param {Pointer<INetConnectionProps>} ppProps 
     * @returns {HRESULT} 
     */
    get_NetConnectionProps(pNetConnection, ppProps) {
        result := ComCall(12, this, "ptr", pNetConnection, "ptr", ppProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
