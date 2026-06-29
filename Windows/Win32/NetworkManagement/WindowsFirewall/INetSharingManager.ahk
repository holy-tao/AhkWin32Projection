#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetSharingConfiguration.ahk" { INetSharingConfiguration }
#Import ".\INetSharingEveryConnectionCollection.ahk" { INetSharingEveryConnectionCollection }
#Import ".\INetSharingPublicConnectionCollection.ahk" { INetSharingPublicConnectionCollection }
#Import ".\SHARINGCONNECTION_ENUM_FLAGS.ahk" { SHARINGCONNECTION_ENUM_FLAGS }
#Import ".\INetConnection.ahk" { INetConnection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\INetConnectionProps.ahk" { INetConnectionProps }
#Import ".\INetSharingPrivateConnectionCollection.ahk" { INetSharingPrivateConnectionCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The INetSharingManager interface is the primary interface for the Manager object. INetSharingManager provides methods to determine if sharing is installed, to manage port mappings, and to obtain enumeration interfaces for public and private connections.
 * @remarks
 * To obtain an enumeration interface for port mappings, use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">get_INetSharingConfigurationForINetConnection</a> method to obtain an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface. Then use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingconfiguration-get_enumportmappings">INetSharingConfiguration::EnumPortMappings</a> method to obtain an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/nn-netcon-ienumnetsharingportmapping">IEnumNetSharingPortMapping</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/nn-netcon-inetsharingmanager
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetSharingManager extends IDispatch {
    /**
     * The interface identifier for INetSharingManager
     * @type {Guid}
     */
    static IID := Guid("{c08956b7-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The class identifier for NetSharingManager
     * @type {Guid}
     */
    static CLSID := Guid("{5c63c1ad-3956-4ff8-8486-40034758315b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetSharingManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SharingInstalled                          : IntPtr
        get_EnumPublicConnections                     : IntPtr
        get_EnumPrivateConnections                    : IntPtr
        get_INetSharingConfigurationForINetConnection : IntPtr
        get_EnumEveryConnection                       : IntPtr
        get_NetConnectionProps                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetSharingManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * This method sets the <i>pbInstalled</i> parameter to <b>TRUE</b> when called on the following versions of Windows XP:
     * 
     * <ul>
     * <li>Windows XP Home Edition</li>
     * <li>Windows XP Professional</li>
     * <li>Windows XP Embedded</li>
     * </ul>
     * This function sets the <i>pbInstalled</i> parameter to <b>FALSE</b> when called on other versions of Windows XP.
     * 
     * To determine whether sharing is enable for a particular connection, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingconfiguration-get_sharingenabled">INetSharingConfiguration::get_SharingEnabled</a> method for that connection.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> that specifies whether the currently-installed version Windows XP supports connection sharing. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingmanager-get_sharinginstalled
     */
    get_SharingInstalled() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbInstalled := 0, "HRESULT")
        return pbInstalled
    }

    /**
     * The EnumPublicConnections method retrieves an enumeration interface for publicly-shared connections.
     * @param {SHARINGCONNECTION_ENUM_FLAGS} Flags This parameter must be ICSSC_DEFAULT.
     * @returns {INetSharingPublicConnectionCollection} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingpublicconnectioncollection">INetSharingPublicConnectionCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingmanager-get_enumpublicconnections
     */
    get_EnumPublicConnections(Flags) {
        result := ComCall(8, this, SHARINGCONNECTION_ENUM_FLAGS, Flags, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingPublicConnectionCollection(ppColl)
    }

    /**
     * The get_EnumPrivateConnections method retrieves an enumeration interface for privately-shared connections.
     * @param {SHARINGCONNECTION_ENUM_FLAGS} Flags This parameter must be ICSSC_DEFAULT.
     * @returns {INetSharingPrivateConnectionCollection} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/nn-netcon-inetsharingprivateconnectioncollection">INetSharingPrivateConnectionCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingmanager-get_enumprivateconnections
     */
    get_EnumPrivateConnections(Flags) {
        result := ComCall(9, this, SHARINGCONNECTION_ENUM_FLAGS, Flags, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingPrivateConnectionCollection(ppColl)
    }

    /**
     * The get_INetSharingConfigurationForINetConnection method retrieves an INetSharingConfiguration interface for the specified connection.
     * @param {INetConnection} pNetConnection Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetconnection">INetConnection</a> interface for an Internet connection.
     * @returns {INetSharingConfiguration} Pointer to an interface pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingconfiguration">INetSharingConfiguration</a> interface for the connection specified by the <i>pNetConnection</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection
     */
    get_INetSharingConfigurationForINetConnection(pNetConnection) {
        result := ComCall(10, this, "ptr", pNetConnection, "ptr*", &ppNetSharingConfiguration := 0, "HRESULT")
        return INetSharingConfiguration(ppNetSharingConfiguration)
    }

    /**
     * The get_EnumEveryConnection method retrieves an enumeration interface for all the connections in the connection folder.
     * @returns {INetSharingEveryConnectionCollection} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetsharingeveryconnectioncollection">INetSharingEveryConnectionCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingmanager-get_enumeveryconnection
     */
    get_EnumEveryConnection() {
        result := ComCall(11, this, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingEveryConnectionCollection(ppColl)
    }

    /**
     * The get_NetConnectionProps method retrieves a properties interface for the specified connection.
     * @remarks
     * Not all connections can be configured for sharing. Retrieve the properties for the connection to verify that the connection can be shared before calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingmanager-get_inetsharingconfigurationforinetconnection">INetSharingManager::get_INetSharingConfigurationForINetConnection</a>.
     * @param {INetConnection} pNetConnection Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetconnection">INetConnection</a> interface for the connection for which to retrieve the properties interface.
     * @returns {INetConnectionProps} Pointer to an interface pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nn-netcon-inetconnectionprops">INetConnectionProps</a> interface for the connection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingmanager-get_netconnectionprops
     */
    get_NetConnectionProps(pNetConnection) {
        result := ComCall(12, this, "ptr", pNetConnection, "ptr*", &ppProps := 0, "HRESULT")
        return INetConnectionProps(ppProps)
    }

    Query(iid) {
        if (INetSharingManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SharingInstalled := CallbackCreate(GetMethod(implObj, "get_SharingInstalled"), flags, 2)
        this.vtbl.get_EnumPublicConnections := CallbackCreate(GetMethod(implObj, "get_EnumPublicConnections"), flags, 3)
        this.vtbl.get_EnumPrivateConnections := CallbackCreate(GetMethod(implObj, "get_EnumPrivateConnections"), flags, 3)
        this.vtbl.get_INetSharingConfigurationForINetConnection := CallbackCreate(GetMethod(implObj, "get_INetSharingConfigurationForINetConnection"), flags, 3)
        this.vtbl.get_EnumEveryConnection := CallbackCreate(GetMethod(implObj, "get_EnumEveryConnection"), flags, 2)
        this.vtbl.get_NetConnectionProps := CallbackCreate(GetMethod(implObj, "get_NetConnectionProps"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SharingInstalled)
        CallbackFree(this.vtbl.get_EnumPublicConnections)
        CallbackFree(this.vtbl.get_EnumPrivateConnections)
        CallbackFree(this.vtbl.get_INetSharingConfigurationForINetConnection)
        CallbackFree(this.vtbl.get_EnumEveryConnection)
        CallbackFree(this.vtbl.get_NetConnectionProps)
    }
}
