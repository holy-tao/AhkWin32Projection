#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentCalendarSyncManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentCalendarSyncManager2
     * @type {Guid}
     */
    static IID => Guid("{647528ad-0d29-4c7c-aaa7-bf996805537c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Status", "put_LastSuccessfulSyncTime", "put_LastAttemptedSyncTime"]

    /**
     * @type {HRESULT} 
     */
    Status {
        set => this.put_Status(value)
    }

    /**
     * @type {HRESULT} 
     */
    LastSuccessfulSyncTime {
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * @type {HRESULT} 
     */
    LastAttemptedSyncTime {
        set => this.put_LastAttemptedSyncTime(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastAttemptedSyncTime(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
