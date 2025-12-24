#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwPolicy.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwMgr interface provides access to the firewall settings for a computer.
 * @remarks
 * 
 * <b>Windows Vista:  </b>Windows Vista users must use applications developed in Windows Vista for all methods and properties of this interface.
 * 
 * This interface is
 * supported by the HNetCfg.FwMgr COM object. 
 * 
 * All configuration changes take
 * effect immediately.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwmgr
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwMgr extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwMgr
     * @type {Guid}
     */
    static IID => Guid("{f7898af5-cac4-4632-a2ec-da06e5111af2}")

    /**
     * The class identifier for NetFwMgr
     * @type {Guid}
     */
    static CLSID => Guid("{304ce942-6e39-40d8-943a-b913c40c9cd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalPolicy", "get_CurrentProfileType", "RestoreDefaults", "IsPortAllowed", "IsIcmpTypeAllowed"]

    /**
     * @type {INetFwPolicy} 
     */
    LocalPolicy {
        get => this.get_LocalPolicy()
    }

    /**
     * @type {Integer} 
     */
    CurrentProfileType {
        get => this.get_CurrentProfileType()
    }

    /**
     * Retrieves the local firewall policy.
     * @returns {INetFwPolicy} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwmgr-get_localpolicy
     */
    get_LocalPolicy() {
        result := ComCall(7, this, "ptr*", &localPolicy := 0, "HRESULT")
        return INetFwPolicy(localPolicy)
    }

    /**
     * Retrieves the type of firewall profile currently in effect.
     * @remarks
     * 
     * The SharedAccess service must be running.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwmgr-get_currentprofiletype
     */
    get_CurrentProfileType() {
        result := ComCall(8, this, "int*", &profileType := 0, "HRESULT")
        return profileType
    }

    /**
     * Restores the local configuration to its default, installed state.
     * @returns {HRESULT} <h3>C++</h3>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped because of permissions issues.
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
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds, the return value is S_OK.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped because of permissions issues.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwmgr-restoredefaults
     */
    RestoreDefaults() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Determines whether an application can listen for inbound traffic on the specified port.
     * @param {BSTR} imageFileName The image file name of the process listening on the
     *    network. It must be a fully qualified path, but  may contain
     *    environment variables. If <i>imageFileName</i> is <b>NULL</b>, the function
     *    determines whether the port is allowed for all applications.
     * @param {Integer} ipVersion IP version of the traffic. If <i>localAddress</i> is non-<b>NULL</b>,
     *    this must not be <b>NET_FW_IP_VERSION_ANY</b>.
     * @param {Integer} portNumber Local IP port number of the traffic.
     * @param {BSTR} localAddress Either a dotted-decimal IPv4 address or an IPv6 hex
     *    address specifying the local address of the traffic. Typically, this is
     *    the address passed to bind. If <i>localAddress</i> is <b>NULL</b>, the function
     *    determines whether the port is allowed for all interfaces.
     * @param {Integer} ipProtocol IP protocol of the traffic, either <b>NET_FW_IP_PROTOCOL_TCP</b> or <b>NET_FW_IP_PROTOCOL_UDP</b>.
     * @param {Pointer<VARIANT>} allowed Indicates by a value of VARIANT_TRUE or VARIANT_FALSE whether the port is allowed for at least some local
     *    interfaces and remote addresses.
     * @param {Pointer<VARIANT>} restricted Indicates by a value of VARIANT_TRUE or VARIANT_FALSE whether some local interfaces or remote addresses
     *    are blocked for this port. For example, if the port is restricted to the
     *    local subnet only.
     * @returns {HRESULT} <h3>C++</h3>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped because of permissions issues.
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
     * The method failed because a parameter was not valid.
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
     * The method failed because a pointer was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds, the return value is S_OK.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped because of permissions issues.
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
     * The method failed because a parameter was not valid.
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
     * The method failed because a pointer was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwmgr-isportallowed
     */
    IsPortAllowed(imageFileName, ipVersion, portNumber, localAddress, ipProtocol, allowed, restricted) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(10, this, "ptr", imageFileName, "int", ipVersion, "int", portNumber, "ptr", localAddress, "int", ipProtocol, "ptr", allowed, "ptr", restricted, "HRESULT")
        return result
    }

    /**
     * Determines whether the specified ICMP type is allowed.
     * @param {Integer} ipVersion IP version of the traffic. This cannot be <b>NET_FW_IP_VERSION_ANY</b>.
     * 
     * IP version of the traffic. 
     *    This cannot be <b>NET_FW_IP_VERSION_ANY</b>.
     * @param {BSTR} localAddress Either a dotted-decimal IPv4 address or an IPv6 hex
     *    address specifying the local address of the traffic. Typically, this is
     *    the address passed to bind. If <i>localAddress</i> is <b>NULL</b>, the function
     *    determines whether the port is allowed for all interfaces.
     * 
     * Either a dotted-decimal IPv4 address or an IPv6 hex
     *    address specifying the local address of the traffic. Typically, this is
     *    the address passed to bind. If <i>localAddress</i> is <b>NULL</b>, the function
     *    determines whether the port is allowed for all interfaces.
     * @param {Integer} type ICMP type. For a list of possible ICMP types, see <a href="https://www.iana.org/assignments/icmp-parameters">ICMP Type Numbers</a>.
     * 
     * ICMP type.
     * @param {Pointer<VARIANT>} allowed Indicates by a value of VARIANT_TRUE or VARIANT_FALSE whether the port is allowed for at least some local
     *    interfaces and remote addresses.
     * 
     * Indicates by a value of VARIANT_TRUE or VARIANT_FALSE whether the port is allowed for at least some local
     *    interfaces and remote addresses.
     * @param {Pointer<VARIANT>} restricted Indicates by a value of VARIANT_TRUE or VARIANT_FALSE whether some local interfaces or remote addresses
     *    are blocked for this port. For example, if the port is restricted to the
     *    local subnet only.
     * 
     * Indicates by a value of VARIANT_TRUE or VARIANT_FALSE whether some local interfaces or remote addresses
     *    are blocked for this port. For example, if the port is restricted to the
     *    local subnet only.
     * @returns {HRESULT} <h3>C++</h3>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped because of permissions issues.
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
     * The method failed because a parameter was not valid.
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
     * The method failed because a pointer was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is <b>S_OK</b>.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was stopped because of permissions issues.
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
     * The method failed because a parameter was not valid.
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
     * The method failed because a pointer was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwmgr-isicmptypeallowed
     */
    IsIcmpTypeAllowed(ipVersion, localAddress, type, allowed, restricted) {
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(11, this, "int", ipVersion, "ptr", localAddress, "char", type, "ptr", allowed, "ptr", restricted, "HRESULT")
        return result
    }
}
