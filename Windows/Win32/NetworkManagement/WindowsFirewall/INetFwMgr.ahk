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
     * 
     * @param {Pointer<INetFwPolicy>} localPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-get_localpolicy
     */
    get_LocalPolicy(localPolicy) {
        result := ComCall(7, this, "ptr*", localPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} profileType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-get_currentprofiletype
     */
    get_CurrentProfileType(profileType) {
        result := ComCall(8, this, "int*", profileType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-restoredefaults
     */
    RestoreDefaults() {
        result := ComCall(9, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-isportallowed
     */
    IsPortAllowed(imageFileName, ipVersion, portNumber, localAddress, ipProtocol, allowed, restricted) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(10, this, "ptr", imageFileName, "int", ipVersion, "int", portNumber, "ptr", localAddress, "int", ipProtocol, "ptr", allowed, "ptr", restricted, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwmgr-isicmptypeallowed
     */
    IsIcmpTypeAllowed(ipVersion, localAddress, type, allowed, restricted) {
        localAddress := localAddress is String ? BSTR.Alloc(localAddress).Value : localAddress

        result := ComCall(11, this, "int", ipVersion, "ptr", localAddress, "char", type, "ptr", allowed, "ptr", restricted, "HRESULT")
        return result
    }
}
