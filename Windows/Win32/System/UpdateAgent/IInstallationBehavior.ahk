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
     * @type {VARIANT_BOOL} 
     */
    CanRequestUserInput {
        get => this.get_CanRequestUserInput()
    }

    /**
     * @type {Integer} 
     */
    Impact {
        get => this.get_Impact()
    }

    /**
     * @type {Integer} 
     */
    RebootBehavior {
        get => this.get_RebootBehavior()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RequiresNetworkConnectivity {
        get => this.get_RequiresNetworkConnectivity()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_canrequestuserinput
     */
    get_CanRequestUserInput() {
        result := ComCall(7, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_impact
     */
    get_Impact() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_rebootbehavior
     */
    get_RebootBehavior() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationbehavior-get_requiresnetworkconnectivity
     */
    get_RequiresNetworkConnectivity() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}
