#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the installation and uninstallation options of an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationbehavior
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationBehavior extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationBehavior
     * @type {Guid}
     */
    static IID => Guid("{d9a59339-e245-4dbd-9686-4d5763e39624}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanRequestUserInput", "get_Impact", "get_RebootBehavior", "get_RequiresNetworkConnectivity"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_canrequestuserinput
     */
    get_CanRequestUserInput(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_impact
     */
    get_Impact(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_rebootbehavior
     */
    get_RebootBehavior(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_requiresnetworkconnectivity
     */
    get_RequiresNetworkConnectivity(retval) {
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return result
    }
}
