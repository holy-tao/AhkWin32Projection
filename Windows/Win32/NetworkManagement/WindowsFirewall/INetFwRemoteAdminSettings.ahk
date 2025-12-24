#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwRemoteAdminSettings interface provides access to the settings that control remote administration.
 * @remarks
 * 
 * An
 * instance of this interface is retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_remoteadminsettings">RemoteAdminSettings</a>property of the INetFwProfile interface. 
 * 
 * All configuration changes take
 *  effect immediately.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwremoteadminsettings
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRemoteAdminSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwRemoteAdminSettings
     * @type {Guid}
     */
    static IID => Guid("{d4becddf-6f73-4a83-b832-9c66874cd20e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IpVersion", "put_IpVersion", "get_Scope", "put_Scope", "get_RemoteAddresses", "put_RemoteAddresses", "get_Enabled", "put_Enabled"]

    /**
     * @type {Integer} 
     */
    IpVersion {
        get => this.get_IpVersion()
        set => this.put_IpVersion(value)
    }

    /**
     * @type {Integer} 
     */
    Scope {
        get => this.get_Scope()
        set => this.put_Scope(value)
    }

    /**
     * @type {BSTR} 
     */
    RemoteAddresses {
        get => this.get_RemoteAddresses()
        set => this.put_RemoteAddresses(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Specifies the IP version.
     * @remarks
     * 
     * This is the IP version for which remote admin is authorized. 
     * 
     * Only
     *     <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-get_ipversion
     */
    get_IpVersion() {
        result := ComCall(7, this, "int*", &ipVersion := 0, "HRESULT")
        return ipVersion
    }

    /**
     * Specifies the IP version.
     * @remarks
     * 
     * This is the IP version for which remote admin is authorized. 
     * 
     * Only
     *     <b>NET_FW_IP_VERSION_ANY</b> is supported.
     * 
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-put_ipversion
     */
    put_IpVersion(ipVersion) {
        result := ComCall(8, this, "int", ipVersion, "HRESULT")
        return result
    }

    /**
     * Controls the network scope from which remote administration is allowed.
     * @remarks
     * 
     * When setting the
     *    <b>Scope</b> property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses">RemoteAddresses</a> property of this interface.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-get_scope
     */
    get_Scope() {
        result := ComCall(9, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Controls the network scope from which remote administration is allowed.
     * @remarks
     * 
     * When setting the
     *    <b>Scope</b> property, only <b>NET_FW_SCOPE_ALL</b> and <b>NET_FW_SCOPE_LOCAL_SUBNET</b> are valid.
     *    
     * 
     * The default value is
     *    <b>NET_FW_SCOPE_ALL</b> for new ports.
     * 
     * To create a custom scope, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses">RemoteAddresses</a> property of this interface.
     * 
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-put_scope
     */
    put_Scope(scope) {
        result := ComCall(10, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * Specifies a set of remote addresses from which remote administration is allowed.
     * @remarks
     * 
     * The <i>remoteAddrs</i> parameter consists of one or more comma-delimited tokens specifying the remote addresses from which the application can listen for traffic. The default value is "*". 
     * 
     * Valid tokens:
     * 
     * 
     * <ul>
     * <li>"*": any remote address; if present, it must be the only token.</li>
     * <li>"LocalSubnet": not case-sensitive; specifying more than once has no effect.</li>
     * <li>subnet: may be specified using either subnet mask or network prefix notation. If neither a subnet mask nor a network prefix is specified, the subnet mask defaults to 255.255.255.255. Examples of valid subnets: 
     * 10.0.0.2/255.0.0.0 
     * 10.0.0.2/8 
     * 10.0.0.2</li>
     * <li>Windows Vista: A valid IPv6 address.</li>
     * <li>Windows Vista: An IPv4 address range in the format "start address - end address."</li>
     * <li>Windows Vista: An IPv6 address range in the format "start address - end address."</li>
     * </ul>
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_scope">Scope</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(11, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies a set of remote addresses from which remote administration is allowed.
     * @remarks
     * 
     * The <i>remoteAddrs</i> parameter consists of one or more comma-delimited tokens specifying the remote addresses from which the application can listen for traffic. The default value is "*". 
     * 
     * Valid tokens:
     * 
     * 
     * <ul>
     * <li>"*": any remote address; if present, it must be the only token.</li>
     * <li>"LocalSubnet": not case-sensitive; specifying more than once has no effect.</li>
     * <li>subnet: may be specified using either subnet mask or network prefix notation. If neither a subnet mask nor a network prefix is specified, the subnet mask defaults to 255.255.255.255. Examples of valid subnets: 
     * 10.0.0.2/255.0.0.0 
     * 10.0.0.2/8 
     * 10.0.0.2</li>
     * <li>Windows Vista: A valid IPv6 address.</li>
     * <li>Windows Vista: An IPv4 address range in the format "start address - end address."</li>
     * <li>Windows Vista: An IPv6 address range in the format "start address - end address."</li>
     * </ul>
     * For a predefined address range, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwremoteadminsettings-get_scope">Scope</a> property.
     * 
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(12, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Indicates whether remote administration is enabled..
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-get_enabled
     */
    get_Enabled() {
        result := ComCall(13, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether remote administration is enabled..
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwremoteadminsettings-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(14, this, "short", enabled, "HRESULT")
        return result
    }
}
