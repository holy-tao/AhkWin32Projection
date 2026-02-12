#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\OnlookerDetectionOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSettings3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSettings3
     * @type {Guid}
     */
    static IID => Guid("{89757226-acc1-4f58-81df-47f1d69537f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsOnlookerDetectionEnabled", "put_IsOnlookerDetectionEnabled", "get_OnlookerDetectionOptions"]

    /**
     * @type {Boolean} 
     */
    IsOnlookerDetectionEnabled {
        get => this.get_IsOnlookerDetectionEnabled()
        set => this.put_IsOnlookerDetectionEnabled(value)
    }

    /**
     * @type {OnlookerDetectionOptions} 
     */
    OnlookerDetectionOptions {
        get => this.get_OnlookerDetectionOptions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnlookerDetectionEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOnlookerDetectionEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {OnlookerDetectionOptions} 
     */
    get_OnlookerDetectionOptions() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OnlookerDetectionOptions(value)
    }
}
