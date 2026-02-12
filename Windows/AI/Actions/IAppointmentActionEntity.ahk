#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\ApplicationModel\Appointments\Appointment.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IAppointmentActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentActionEntity
     * @type {Guid}
     */
    static IID => Guid("{29daa00e-b474-581c-b555-6187d1aa8231}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceId", "get_Appointment", "GetAttendees", "GetPresentedFiles", "SetPresentedFiles", "GetSharedFiles", "SetSharedFiles"]

    /**
     * @type {HSTRING} 
     */
    SourceId {
        get => this.get_SourceId()
    }

    /**
     * @type {Appointment} 
     */
    Appointment {
        get => this.get_Appointment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_Appointment() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Appointment(value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetAttendees(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetPresentedFiles(result_) {
        result := ComCall(9, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} files_length 
     * @param {Pointer<RemoteFileActionEntity>} files 
     * @returns {HRESULT} 
     */
    SetPresentedFiles(files_length, files) {
        result := ComCall(10, this, "uint", files_length, "ptr*", files, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetSharedFiles(result_) {
        result := ComCall(11, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} files_length 
     * @param {Pointer<RemoteFileActionEntity>} files 
     * @returns {HRESULT} 
     */
    SetSharedFiles(files_length, files) {
        result := ComCall(12, this, "uint", files_length, "ptr*", files, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
