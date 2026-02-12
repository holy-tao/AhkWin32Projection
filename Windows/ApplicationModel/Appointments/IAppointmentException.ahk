#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Appointment.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentException extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentException
     * @type {Guid}
     */
    static IID => Guid("{a2076767-16f6-4bce-9f5a-8600b8019fcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Appointment", "get_ExceptionProperties", "get_IsDeleted"]

    /**
     * @type {Appointment} 
     */
    Appointment {
        get => this.get_Appointment()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    ExceptionProperties {
        get => this.get_ExceptionProperties()
    }

    /**
     * @type {Boolean} 
     */
    IsDeleted {
        get => this.get_IsDeleted()
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_Appointment() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Appointment(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ExceptionProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeleted() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
