#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwOpenPort interface provides access to the properties of a port that has been opened in the firewall.
 * @remarks
 * 
  * Ports  with their <b>BuiltIn</b> property set to true (<b>VARIANT_TRUE</b>) are system specified and cannot be removed.
  * 
  * When creating new ports, this interface is supported by the
  * <b>HNetCfg.FWOpenPort</b> COM object. 
  * 
  * For reading or modifying existing ports,
  * instances of this interface are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwopenports">INetFwOpenPorts</a>collection. 
  * 
  * All configuration changes take effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwopenport
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwOpenPort extends IDispatch{
    /**
     * The interface identifier for INetFwOpenPort
     * @type {Guid}
     */
    static IID => Guid("{e0483ba0-47ff-4d9c-a6d6-7741d0b195f7}")

    /**
     * The class identifier for NetFwOpenPort
     * @type {Guid}
     */
    static CLSID => Guid("{0ca545c6-37ad-4a6c-bf92-9f7610067ef5}")

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
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int")
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
        result := ComCall(9, this, "int*", ipVersion, "int")
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
        result := ComCall(10, this, "int", ipVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ipProtocol 
     * @returns {HRESULT} 
     */
    get_Protocol(ipProtocol) {
        result := ComCall(11, this, "int*", ipProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ipProtocol 
     * @returns {HRESULT} 
     */
    put_Protocol(ipProtocol) {
        result := ComCall(12, this, "int", ipProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} portNumber 
     * @returns {HRESULT} 
     */
    get_Port(portNumber) {
        result := ComCall(13, this, "int*", portNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} portNumber 
     * @returns {HRESULT} 
     */
    put_Port(portNumber) {
        result := ComCall(14, this, "int", portNumber, "int")
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
        result := ComCall(15, this, "int*", scope, "int")
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
        result := ComCall(16, this, "int", scope, "int")
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
        result := ComCall(17, this, "ptr", remoteAddrs, "int")
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

        result := ComCall(18, this, "ptr", remoteAddrs, "int")
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
        result := ComCall(19, this, "ptr", enabled, "int")
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
        result := ComCall(20, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} builtIn 
     * @returns {HRESULT} 
     */
    get_BuiltIn(builtIn) {
        result := ComCall(21, this, "ptr", builtIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
