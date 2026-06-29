#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides the extended settings that the Task Scheduler uses to run the task. (ITaskSettings2)
 * @remarks
 * When reading or writing XML for a task, the task settings are defined in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-settings-tasktype-element">Settings</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itasksettings2
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskSettings2 extends IDispatch {
    /**
     * The interface identifier for ITaskSettings2
     * @type {Guid}
     */
    static IID := Guid("{2c05c3f0-6eed-4c05-a15f-ed7d7a98a369}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskSettings2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DisallowStartOnRemoteAppSession : IntPtr
        put_DisallowStartOnRemoteAppSession : IntPtr
        get_UseUnifiedSchedulingEngine      : IntPtr
        put_UseUnifiedSchedulingEngine      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskSettings2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisallowStartOnRemoteAppSession {
        get => this.get_DisallowStartOnRemoteAppSession()
        set => this.put_DisallowStartOnRemoteAppSession(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseUnifiedSchedulingEngine {
        get => this.get_UseUnifiedSchedulingEngine()
        set => this.put_UseUnifiedSchedulingEngine(value)
    }

    /**
     * Gets or sets a Boolean value that specifies that the task will not be started if triggered to run in a Remote Applications Integrated Locally (RAIL) session. (Get)
     * @remarks
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-disallowstartonremoteappsession-settingstype-element">DisallowStartOnRemoteAppSession</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-get_disallowstartonremoteappsession
     */
    get_DisallowStartOnRemoteAppSession(pDisallowStart) {
        pDisallowStartMarshal := pDisallowStart is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pDisallowStartMarshal, pDisallowStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that specifies that the task will not be started if triggered to run in a Remote Applications Integrated Locally (RAIL) session. (Put)
     * @remarks
     * When reading or writing  XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-disallowstartonremoteappsession-settingstype-element">DisallowStartOnRemoteAppSession</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-put_disallowstartonremoteappsession
     */
    put_DisallowStartOnRemoteAppSession(disallowStart) {
        result := ComCall(8, this, VARIANT_BOOL, disallowStart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Unified Scheduling Engine will be utilized to run this task. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-useunifiedschedulingengine-settingstype-element">UseUnifiedSchedulingEngine</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pUseUnifiedEngine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-get_useunifiedschedulingengine
     */
    get_UseUnifiedSchedulingEngine(pUseUnifiedEngine) {
        pUseUnifiedEngineMarshal := pUseUnifiedEngine is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, pUseUnifiedEngineMarshal, pUseUnifiedEngine, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Unified Scheduling Engine will be utilized to run this task. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-useunifiedschedulingengine-settingstype-element">UseUnifiedSchedulingEngine</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} useUnifiedEngine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-put_useunifiedschedulingengine
     */
    put_UseUnifiedSchedulingEngine(useUnifiedEngine) {
        result := ComCall(10, this, VARIANT_BOOL, useUnifiedEngine, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskSettings2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisallowStartOnRemoteAppSession := CallbackCreate(GetMethod(implObj, "get_DisallowStartOnRemoteAppSession"), flags, 2)
        this.vtbl.put_DisallowStartOnRemoteAppSession := CallbackCreate(GetMethod(implObj, "put_DisallowStartOnRemoteAppSession"), flags, 2)
        this.vtbl.get_UseUnifiedSchedulingEngine := CallbackCreate(GetMethod(implObj, "get_UseUnifiedSchedulingEngine"), flags, 2)
        this.vtbl.put_UseUnifiedSchedulingEngine := CallbackCreate(GetMethod(implObj, "put_UseUnifiedSchedulingEngine"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisallowStartOnRemoteAppSession)
        CallbackFree(this.vtbl.put_DisallowStartOnRemoteAppSession)
        CallbackFree(this.vtbl.get_UseUnifiedSchedulingEngine)
        CallbackFree(this.vtbl.put_UseUnifiedSchedulingEngine)
    }
}
