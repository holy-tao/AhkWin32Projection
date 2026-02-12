#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceFeatures3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceFeatures3
     * @type {Guid}
     */
    static IID => Guid("{ed4e03aa-5ca2-5c02-b783-262e91295619}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsOnlookerDetectionSupported"]

    /**
     * @type {Boolean} 
     */
    IsOnlookerDetectionSupported {
        get => this.get_IsOnlookerDetectionSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnlookerDetectionSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
