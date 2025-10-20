#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwService interface provides access to the properties of a service that may be authorized to listen through the firewall.
 * @remarks
 * 
  * Instances of this interface are retrieved
  * through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwservices">INetFwServices</a> collection. 
  * 
  * All configuration changes take
  * effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwservice
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwService extends IDispatch{
    /**
     * The interface identifier for INetFwService
     * @type {Guid}
     */
    static IID => Guid("{79fd57c8-908e-4a36-9888-d5b3f0a444cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} type 
     * @returns {HRESULT} 
     */
    get_Type(type) {
        result := ComCall(8, this, "int*", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} customized 
     * @returns {HRESULT} 
     */
    get_Customized(customized) {
        result := ComCall(9, this, "ptr", customized, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ipVersion 
     * @returns {HRESULT} 
     */
    get_IpVersion(ipVersion) {
        result := ComCall(10, this, "int*", ipVersion, "int")
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
        result := ComCall(11, this, "int", ipVersion, "int")
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
        result := ComCall(12, this, "int*", scope, "int")
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
        result := ComCall(13, this, "int", scope, "int")
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
        result := ComCall(14, this, "ptr", remoteAddrs, "int")
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

        result := ComCall(15, this, "ptr", remoteAddrs, "int")
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
        result := ComCall(16, this, "ptr", enabled, "int")
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
        result := ComCall(17, this, "short", enabled, "int")
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
}
