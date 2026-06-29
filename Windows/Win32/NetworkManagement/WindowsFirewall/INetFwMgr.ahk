#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_FW_IP_PROTOCOL.ahk" { NET_FW_IP_PROTOCOL }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\NET_FW_IP_VERSION.ahk" { NET_FW_IP_VERSION }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\NET_FW_PROFILE_TYPE.ahk" { NET_FW_PROFILE_TYPE }
#Import ".\INetFwPolicy.ahk" { INetFwPolicy }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * The INetFwMgr interface provides access to the firewall settings for a computer.
 * @remarks
 * <b>Windows Vista:  </b>Windows Vista users must use applications developed in Windows Vista for all methods and properties of this interface.
 * 
 * This interface is
 * supported by the HNetCfg.FwMgr COM object. 
 * 
 * All configuration changes take
 * effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwmgr
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwMgr extends IDispatch {
    /**
     * The interface identifier for INetFwMgr
     * @type {Guid}
     */
    static IID := Guid("{f7898af5-cac4-4632-a2ec-da06e5111af2}")

    /**
     * The class identifier for NetFwMgr
     * @type {Guid}
     */
    static CLSID := Guid("{304ce942-6e39-40d8-943a-b913c40c9cd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwMgr interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_LocalPolicy        : IntPtr
        get_CurrentProfileType : IntPtr
        RestoreDefaults        : IntPtr
        IsPortAllowed          : IntPtr
        IsIcmpTypeAllowed      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {INetFwPolicy} 
     */
    LocalPolicy {
        get => this.get_LocalPolicy()
    }

    /**
     * @type {NET_FW_PROFILE_TYPE} 
     */
    CurrentProfileType {
        get => this.get_CurrentProfileType()
    }

    /**
     * Retrieves the local firewall policy.
     * @returns {INetFwPolicy} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-get_localpolicy
     */
    get_LocalPolicy() {
        result := ComCall(7, this, "ptr*", &localPolicy := 0, "HRESULT")
        return INetFwPolicy(localPolicy)
    }

    /**
     * Retrieves the type of firewall profile currently in effect.
     * @remarks
     * The SharedAccess service must be running.
     * @returns {NET_FW_PROFILE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-get_currentprofiletype
     */
    get_CurrentProfileType() {
        result := ComCall(8, this, "int*", &profileType := 0, "HRESULT")
        return profileType
    }

    /**
     * Restores the local configuration to its default, installed state.
     * @remarks
     * This method deletes all user and application-added applications and ports that return the system to its installed state. This includes restoring the defaults for Internet Connection Sharing.
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
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-restoredefaults
     */
    RestoreDefaults() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Determines whether an application can listen for inbound traffic on the specified port.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-isrulegroupenabled">INetFwPolicy2::IsRuleGroupEnabled</a> method is generally recommended in place of this method.
     * 
     * The  <b>IsPortAllowed</b> method checks whether traffic will be allowed with the current firewall configuration for:
     * 
     * 
     * 
     * <ul>
     * <li>A specific application. 
     * </li>
     * <li>A specific port. 
     * </li>
     * <li>A specific application on a specific port.</li>
     * </ul>
     *  
     *  
     * 
     * In its operation <b>IsPortAllowed</b> considers whether the firewall is currently enabled or disabled, whether the application is allowed in the current profile Exceptions List, whether the port is allowed in the current profile Exceptions List, whether the file and print sharing option has been enabled, and whether the remote administration option has been enabled.
     * 
     * 
     * Because of the many factors in determining whether a port is allowed, the more specific information that is given via this method's input parameters, the more likely  a clear result with meaningful restrictions will be returned.
     * @param {BSTR} imageFileName The image file name of the process listening on the
     *    network. It must be a fully qualified path, but  may contain
     *    environment variables. If <i>imageFileName</i> is <b>NULL</b>, the function
     *    determines whether the port is allowed for all applications.
     * @param {NET_FW_IP_VERSION} ipVersion IP version of the traffic. If <i>localAddress</i> is non-<b>NULL</b>,
     *    this must not be <b>NET_FW_IP_VERSION_ANY</b>.
     * @param {Integer} portNumber Local IP port number of the traffic.
     * @param {BSTR} localAddress Either a dotted-decimal IPv4 address or an IPv6 hex
     *    address specifying the local address of the traffic. Typically, this is
     *    the address passed to bind. If <i>localAddress</i> is <b>NULL</b>, the function
     *    determines whether the port is allowed for all interfaces.
     * @param {NET_FW_IP_PROTOCOL} ipProtocol IP protocol of the traffic, either <b>NET_FW_IP_PROTOCOL_TCP</b> or <b>NET_FW_IP_PROTOCOL_UDP</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-isportallowed
     */
    IsPortAllowed(imageFileName, ipVersion, portNumber, localAddress, ipProtocol, allowed, restricted) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(10, this, BSTR, imageFileName, NET_FW_IP_VERSION, ipVersion, "int", portNumber, BSTR, localAddress, NET_FW_IP_PROTOCOL, ipProtocol, VARIANT.Ptr, allowed, VARIANT.Ptr, restricted, "HRESULT")
        return result
    }

    /**
     * Determines whether the specified ICMP type is allowed.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-isrulegroupenabled">INetFwPolicy2::IsRuleGroupEnabled</a> method is generally recommended in place of this method.
     * @param {NET_FW_IP_VERSION} ipVersion IP version of the traffic. This cannot be <b>NET_FW_IP_VERSION_ANY</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-isicmptypeallowed
     */
    IsIcmpTypeAllowed(ipVersion, localAddress, type, allowed, restricted) {
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(11, this, NET_FW_IP_VERSION, ipVersion, BSTR, localAddress, "char", type, VARIANT.Ptr, allowed, VARIANT.Ptr, restricted, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetFwMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LocalPolicy := CallbackCreate(GetMethod(implObj, "get_LocalPolicy"), flags, 2)
        this.vtbl.get_CurrentProfileType := CallbackCreate(GetMethod(implObj, "get_CurrentProfileType"), flags, 2)
        this.vtbl.RestoreDefaults := CallbackCreate(GetMethod(implObj, "RestoreDefaults"), flags, 1)
        this.vtbl.IsPortAllowed := CallbackCreate(GetMethod(implObj, "IsPortAllowed"), flags, 8)
        this.vtbl.IsIcmpTypeAllowed := CallbackCreate(GetMethod(implObj, "IsIcmpTypeAllowed"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LocalPolicy)
        CallbackFree(this.vtbl.get_CurrentProfileType)
        CallbackFree(this.vtbl.RestoreDefaults)
        CallbackFree(this.vtbl.IsPortAllowed)
        CallbackFree(this.vtbl.IsIcmpTypeAllowed)
    }
}
