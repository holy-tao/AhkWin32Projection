#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IAppointmentActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class AppointmentActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
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

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceId() {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.get_SourceId()
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_Appointment() {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.get_Appointment()
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetAttendees(result_) {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.GetAttendees(result_)
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetPresentedFiles(result_) {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.GetPresentedFiles(result_)
    }

    /**
     * 
     * @param {Integer} files_length 
     * @param {Pointer<RemoteFileActionEntity>} files 
     * @returns {HRESULT} 
     */
    SetPresentedFiles(files_length, files) {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.SetPresentedFiles(files_length, files)
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetSharedFiles(result_) {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.GetSharedFiles(result_)
    }

    /**
     * 
     * @param {Integer} files_length 
     * @param {Pointer<RemoteFileActionEntity>} files 
     * @returns {HRESULT} 
     */
    SetSharedFiles(files_length, files) {
        if (!this.HasProp("__IAppointmentActionEntity")) {
            if ((queryResult := this.QueryInterface(IAppointmentActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentActionEntity := IAppointmentActionEntity(outPtr)
        }

        return this.__IAppointmentActionEntity.SetSharedFiles(files_length, files)
    }

;@endregion Instance Methods
}
