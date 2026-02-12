#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorInfo2
     * @type {Guid}
     */
    static IID => Guid("{14d981a3-fc26-4ff7-abc3-48e82a512a0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PresenceMonitoringMode", "UpdateDevicePresenceAsync", "get_IsAuthenticationSupported"]

    /**
     * @type {Integer} 
     */
    PresenceMonitoringMode {
        get => this.get_PresenceMonitoringMode()
    }

    /**
     * @type {Boolean} 
     */
    IsAuthenticationSupported {
        get => this.get_IsAuthenticationSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresenceMonitoringMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} presenceState 
     * @returns {IAsyncAction} 
     */
    UpdateDevicePresenceAsync(presenceState) {
        result := ComCall(7, this, "int", presenceState, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAuthenticationSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
