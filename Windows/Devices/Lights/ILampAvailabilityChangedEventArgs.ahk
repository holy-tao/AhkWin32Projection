#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class ILampAvailabilityChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampAvailabilityChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4f6e3ded-07a2-499d-9260-67e304532ba4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAvailable"]

    /**
     * @type {Boolean} 
     */
    IsAvailable {
        get => this.get_IsAvailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
