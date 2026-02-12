#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DateTimeActionEntity.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppointmentActionEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactory6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactory6
     * @type {Guid}
     */
    static IID => Guid("{da7123da-5639-590f-a2db-c3b5e221f3b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDateTimeEntity", "CreateAppointmentEntity"]

    /**
     * 
     * @param {DateTime} dateTime_ 
     * @returns {DateTimeActionEntity} 
     */
    CreateDateTimeEntity(dateTime_) {
        result := ComCall(6, this, "ptr", dateTime_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeActionEntity(result_)
    }

    /**
     * 
     * @param {HSTRING} sourceId 
     * @param {Appointment} appointment_ 
     * @param {Integer} attendees_length 
     * @param {Pointer<ContactActionEntity>} attendees 
     * @returns {AppointmentActionEntity} 
     */
    CreateAppointmentEntity(sourceId, appointment_, attendees_length, attendees) {
        if(sourceId is String) {
            pin := HSTRING.Create(sourceId)
            sourceId := pin.Value
        }
        sourceId := sourceId is Win32Handle ? NumGet(sourceId, "ptr") : sourceId

        result := ComCall(7, this, "ptr", sourceId, "ptr", appointment_, "uint", attendees_length, "ptr*", attendees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentActionEntity(result_)
    }
}
