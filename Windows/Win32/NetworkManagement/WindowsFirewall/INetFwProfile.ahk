#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwProfile interface provides access to the firewall settings profile.
 * @remarks
 * 
  * Instances of this interface
  * are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-get_currentprofile">CurrentProfile</a> property or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-getprofilebytype">GetProfileByType</a> method
  * of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwpolicy">INetFwPolicy</a> interface.
  * 
  * All configuration changes take
  * effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwprofile
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwProfile extends IDispatch{
    /**
     * The interface identifier for INetFwProfile
     * @type {Guid}
     */
    static IID => Guid("{174a0dda-e9f9-449d-993b-21ab667ca456}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} type 
     * @returns {HRESULT} 
     */
    get_Type(type) {
        result := ComCall(7, this, "int*", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_FirewallEnabled(enabled) {
        result := ComCall(8, this, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_FirewallEnabled(enabled) {
        result := ComCall(9, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} notAllowed 
     * @returns {HRESULT} 
     */
    get_ExceptionsNotAllowed(notAllowed) {
        result := ComCall(10, this, "ptr", notAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} notAllowed 
     * @returns {HRESULT} 
     */
    put_ExceptionsNotAllowed(notAllowed) {
        result := ComCall(11, this, "short", notAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     */
    get_NotificationsDisabled(disabled) {
        result := ComCall(12, this, "ptr", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     */
    put_NotificationsDisabled(disabled) {
        result := ComCall(13, this, "short", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     */
    get_UnicastResponsesToMulticastBroadcastDisabled(disabled) {
        result := ComCall(14, this, "ptr", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(disabled) {
        result := ComCall(15, this, "short", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwRemoteAdminSettings>} remoteAdminSettings 
     * @returns {HRESULT} 
     */
    get_RemoteAdminSettings(remoteAdminSettings) {
        result := ComCall(16, this, "ptr", remoteAdminSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwIcmpSettings>} icmpSettings 
     * @returns {HRESULT} 
     */
    get_IcmpSettings(icmpSettings) {
        result := ComCall(17, this, "ptr", icmpSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwOpenPorts>} openPorts 
     * @returns {HRESULT} 
     */
    get_GloballyOpenPorts(openPorts) {
        result := ComCall(18, this, "ptr", openPorts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwServices>} services 
     * @returns {HRESULT} 
     */
    get_Services(services) {
        result := ComCall(19, this, "ptr", services, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwAuthorizedApplications>} apps 
     * @returns {HRESULT} 
     */
    get_AuthorizedApplications(apps) {
        result := ComCall(20, this, "ptr", apps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
