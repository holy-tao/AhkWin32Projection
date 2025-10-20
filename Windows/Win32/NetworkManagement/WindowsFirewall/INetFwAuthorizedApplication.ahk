#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwAuthorizedApplication interface provides access to the properties of an application that has been authorized have openings in the firewall.
 * @remarks
 * 
  * When creating new applications, this interface is supported by the HNetCfg.FwAuthorizedApplication COM object.  
  * 
  * For reading or modifying existing applications, instances of this interface are retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplications">INetFwAuthorizedApplications</a> collection.
  * 
  * All configuration changes take effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwauthorizedapplication
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwAuthorizedApplication extends IDispatch{
    /**
     * The interface identifier for INetFwAuthorizedApplication
     * @type {Guid}
     */
    static IID => Guid("{b5e64ffa-c2c5-444e-a301-fb5e00018050}")

    /**
     * The class identifier for NetFwAuthorizedApplication
     * @type {Guid}
     */
    static CLSID => Guid("{ec9846b3-2762-4a6b-a214-6acb603462d2}")

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
     * @param {Pointer<BSTR>} imageFileName 
     * @returns {HRESULT} 
     */
    get_ProcessImageFileName(imageFileName) {
        result := ComCall(9, this, "ptr", imageFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     */
    put_ProcessImageFileName(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(10, this, "ptr", imageFileName, "int")
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
        result := ComCall(11, this, "int*", ipVersion, "int")
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
        result := ComCall(12, this, "int", ipVersion, "int")
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
        result := ComCall(13, this, "int*", scope, "int")
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
        result := ComCall(14, this, "int", scope, "int")
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
        result := ComCall(15, this, "ptr", remoteAddrs, "int")
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

        result := ComCall(16, this, "ptr", remoteAddrs, "int")
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
        result := ComCall(17, this, "ptr", enabled, "int")
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
        result := ComCall(18, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
