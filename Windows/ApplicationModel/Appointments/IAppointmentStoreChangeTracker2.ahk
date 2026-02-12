#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentStoreChangeTracker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStoreChangeTracker2
     * @type {Guid}
     */
    static IID => Guid("{b66aaf45-9542-4cf7-8550-eb370e0c08d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTracking"]

    /**
     * @type {Boolean} 
     */
    IsTracking {
        get => this.get_IsTracking()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTracking() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
