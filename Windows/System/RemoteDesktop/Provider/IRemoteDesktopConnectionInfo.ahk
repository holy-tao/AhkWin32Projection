#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class IRemoteDesktopConnectionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopConnectionInfo
     * @type {Guid}
     */
    static IID => Guid("{68bd69d6-6dea-543b-b737-f347919f5093}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConnectionStatus", "SwitchToLocalSession"]

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetConnectionStatus(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchToLocalSession() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
