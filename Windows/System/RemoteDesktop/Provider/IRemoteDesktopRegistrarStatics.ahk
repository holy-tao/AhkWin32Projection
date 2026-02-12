#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\RemoteDesktopInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class IRemoteDesktopRegistrarStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopRegistrarStatics
     * @type {Guid}
     */
    static IID => Guid("{687c2750-46d9-5de3-8dc3-84a9202cecfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesktopInfos", "IsSwitchToLocalSessionEnabled"]

    /**
     * @type {IVector<RemoteDesktopInfo>} 
     */
    DesktopInfos {
        get => this.get_DesktopInfos()
    }

    /**
     * 
     * @returns {IVector<RemoteDesktopInfo>} 
     */
    get_DesktopInfos() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(RemoteDesktopInfo, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsSwitchToLocalSessionEnabled() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
