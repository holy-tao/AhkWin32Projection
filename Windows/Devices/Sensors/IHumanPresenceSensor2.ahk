#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensor2
     * @type {Guid}
     */
    static IID => Guid("{f8833779-65fe-541a-b9d6-1e474a485e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPresenceSupported", "get_IsEngagementSupported"]

    /**
     * @type {Boolean} 
     */
    IsPresenceSupported {
        get => this.get_IsPresenceSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsEngagementSupported {
        get => this.get_IsEngagementSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPresenceSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEngagementSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
