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
     * 
     * @param {Pointer<Int32>} ipVersion 
     * @returns {HRESULT} 
     */
    get_IpVersion(ipVersion) {
        result := ComCall(7, this, "int*", ipVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ipVersion 
     * @returns {HRESULT} 
     */
    put_IpVersion(ipVersion) {
        result := ComCall(8, this, "int", ipVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} scope 
     * @returns {HRESULT} 
     */
    get_Scope(scope) {
        result := ComCall(9, this, "int*", scope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     */
    put_Scope(scope) {
        result := ComCall(10, this, "int", scope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} remoteAddrs 
     * @returns {HRESULT} 
     */
    get_RemoteAddresses(remoteAddrs) {
        result := ComCall(11, this, "ptr", remoteAddrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(12, this, "ptr", remoteAddrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_Enabled(enabled) {
        result := ComCall(13, this, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(14, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
