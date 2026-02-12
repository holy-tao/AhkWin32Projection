#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IPenDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPenDevice
     * @type {Guid}
     */
    static IID => Guid("{31856eba-a738-5a8c-b8f6-f97ef68d18ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PenId"]

    /**
     * @type {Guid} 
     */
    PenId {
        get => this.get_PenId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_PenId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
