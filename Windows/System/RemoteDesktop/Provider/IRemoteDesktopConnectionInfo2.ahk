#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class IRemoteDesktopConnectionInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopConnectionInfo2
     * @type {Guid}
     */
    static IID => Guid("{871c0b26-23bf-5d3c-bc35-a85c405e25e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PerformLocalActionFromRemote"]

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    PerformLocalActionFromRemote(action) {
        result := ComCall(6, this, "int", action, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
