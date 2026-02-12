#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GameBarServices.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IGameBarServicesManagerGameBarServicesCreatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameBarServicesManagerGameBarServicesCreatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ededbd9c-143e-49a3-a5ea-0b1995c8d46e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GameBarServices"]

    /**
     * @type {GameBarServices} 
     */
    GameBarServices {
        get => this.get_GameBarServices()
    }

    /**
     * 
     * @returns {GameBarServices} 
     */
    get_GameBarServices() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameBarServices(value)
    }
}
