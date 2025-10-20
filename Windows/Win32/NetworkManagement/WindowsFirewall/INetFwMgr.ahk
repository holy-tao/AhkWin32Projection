#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<INetFwPolicy>} localPolicy 
     * @returns {HRESULT} 
     */
    get_LocalPolicy(localPolicy) {
        result := ComCall(7, this, "ptr", localPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} profileType 
     * @returns {HRESULT} 
     */
    get_CurrentProfileType(profileType) {
        result := ComCall(8, this, "int*", profileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreDefaults() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} imageFileName 
     * @param {Integer} ipVersion 
     * @param {Integer} portNumber 
     * @param {BSTR} localAddress 
     * @param {Integer} ipProtocol 
     * @param {Pointer<VARIANT>} allowed 
     * @param {Pointer<VARIANT>} restricted 
     * @returns {HRESULT} 
     */
    IsPortAllowed(imageFileName, ipVersion, portNumber, localAddress, ipProtocol, allowed, restricted) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(10, this, "ptr", imageFileName, "int", ipVersion, "int", portNumber, "ptr", localAddress, "int", ipProtocol, "ptr", allowed, "ptr", restricted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ipVersion 
     * @param {BSTR} localAddress 
     * @param {Integer} type 
     * @param {Pointer<VARIANT>} allowed 
     * @param {Pointer<VARIANT>} restricted 
     * @returns {HRESULT} 
     */
    IsIcmpTypeAllowed(ipVersion, localAddress, type, allowed, restricted) {
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(11, this, "int", ipVersion, "ptr", localAddress, "char", type, "ptr", allowed, "ptr", restricted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
