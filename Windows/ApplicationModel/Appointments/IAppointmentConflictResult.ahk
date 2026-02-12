#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentConflictResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentConflictResult
     * @type {Guid}
     */
    static IID => Guid("{d5cdf0be-2f2f-3b7d-af0a-a7e20f3a46e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Date"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
