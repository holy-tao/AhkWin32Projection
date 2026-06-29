#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides the settings that the Task Scheduler uses to perform task during Automatic maintenance.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-imaintenancesettings
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IMaintenanceSettings extends IDispatch {
    /**
     * The interface identifier for IMaintenanceSettings
     * @type {Guid}
     */
    static IID := Guid("{a6024fa8-9652-4adb-a6bf-5cfcd877a7ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMaintenanceSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_Period    : IntPtr
        get_Period    : IntPtr
        put_Deadline  : IntPtr
        get_Deadline  : IntPtr
        put_Exclusive : IntPtr
        get_Exclusive : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMaintenanceSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Period {
        get => this.get_Period()
        set => this.put_Period(value)
    }

    /**
     * @type {BSTR} 
     */
    Deadline {
        get => this.get_Deadline()
        set => this.put_Deadline(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Exclusive {
        get => this.get_Exclusive()
        set => this.put_Exclusive(value)
    }

    /**
     * Gets or sets the amount of time the task needs to be once executed during regular Automatic maintenance. (Put)
     * @remarks
     * The minimum value for this property is 1 day (<i>P1D</i>).
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-period-element">Period</a> element of the Task Scheduler schema.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-put_period
     */
    put_Period(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(7, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time the task needs to be once executed during regular Automatic maintenance. (Get)
     * @remarks
     * The minimum value for this property is 1 day (<i>P1D</i>).
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-period-element">Period</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-get_period
     */
    get_Period(target) {
        result := ComCall(8, this, BSTR.Ptr, target, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time after which the Task scheduler attempts to run the task during emergency Automatic maintenance, if the task failed to complete during regular Automatic maintenance. (Put)
     * @remarks
     * The value of this property must be greater than the value of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-imaintenancesettings-get_period">Period</a> property.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-deadline-element">Deadline</a> element of the Task Scheduler schema.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-put_deadline
     */
    put_Deadline(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(9, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time after which the Task scheduler attempts to run the task during emergency Automatic maintenance, if the task failed to complete during regular Automatic maintenance. (Get)
     * @remarks
     * The value of this property must be greater than the value of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-imaintenancesettings-get_period">Period</a> property.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-deadline-element">Deadline</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-get_deadline
     */
    get_Deadline(target) {
        result := ComCall(10, this, BSTR.Ptr, target, "HRESULT")
        return result
    }

    /**
     * Indicates whether the Task scheduler must start the task during the Automatic maintenance in exclusive mode. (Put)
     * @remarks
     * Starting a task in exclusive mode means that no other maintenance task is get started in parallel with this one. Exclusivity does not guarantee the task any priority in order of execution.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-exclusive-element">Exclusive</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-put_exclusive
     */
    put_Exclusive(value) {
        result := ComCall(11, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Indicates whether the Task scheduler must start the task during the Automatic maintenance in exclusive mode. (Get)
     * @remarks
     * Starting a task in exclusive mode means that no other maintenance task is get started in parallel with this one. Exclusivity does not guarantee the task any priority in order of execution.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-exclusive-element">Exclusive</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imaintenancesettings-get_exclusive
     */
    get_Exclusive(target) {
        targetMarshal := target is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, targetMarshal, target, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMaintenanceSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Period := CallbackCreate(GetMethod(implObj, "put_Period"), flags, 2)
        this.vtbl.get_Period := CallbackCreate(GetMethod(implObj, "get_Period"), flags, 2)
        this.vtbl.put_Deadline := CallbackCreate(GetMethod(implObj, "put_Deadline"), flags, 2)
        this.vtbl.get_Deadline := CallbackCreate(GetMethod(implObj, "get_Deadline"), flags, 2)
        this.vtbl.put_Exclusive := CallbackCreate(GetMethod(implObj, "put_Exclusive"), flags, 2)
        this.vtbl.get_Exclusive := CallbackCreate(GetMethod(implObj, "get_Exclusive"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Period)
        CallbackFree(this.vtbl.get_Period)
        CallbackFree(this.vtbl.put_Deadline)
        CallbackFree(this.vtbl.get_Deadline)
        CallbackFree(this.vtbl.put_Exclusive)
        CallbackFree(this.vtbl.get_Exclusive)
    }
}
