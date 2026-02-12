#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop
 * @version WindowsRuntime 1.4
 */
class IInteractiveSessionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractiveSessionStatics
     * @type {Guid}
     */
    static IID => Guid("{60884631-dd3a-4576-9c8d-e8027618bdce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRemote"]

    /**
     * @type {Boolean} 
     */
    IsRemote {
        get => this.get_IsRemote()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemote() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
