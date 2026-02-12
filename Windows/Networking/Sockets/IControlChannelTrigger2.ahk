#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IControlChannelTrigger2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlChannelTrigger2
     * @type {Guid}
     */
    static IID => Guid("{af00d237-51be-4514-9725-3556e1879580}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsWakeFromLowPowerSupported"]

    /**
     * @type {Boolean} 
     */
    IsWakeFromLowPowerSupported {
        get => this.get_IsWakeFromLowPowerSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWakeFromLowPowerSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
