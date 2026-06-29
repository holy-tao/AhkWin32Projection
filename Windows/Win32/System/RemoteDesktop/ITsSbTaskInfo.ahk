#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RDV_TASK_STATUS.ahk" { RDV_TASK_STATUS }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes properties that the Remote Desktop Connection Broker uses to set a plugin’s queue.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbtaskinfo
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbTaskInfo extends IUnknown {
    /**
     * The interface identifier for ITsSbTaskInfo
     * @type {Guid}
     */
    static IID := Guid("{523d1083-89be-48dd-99ea-04e82ffa7265}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbTaskInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_TargetId   : IntPtr
        get_StartTime  : IntPtr
        get_EndTime    : IntPtr
        get_Deadline   : IntPtr
        get_Identifier : IntPtr
        get_Label      : IntPtr
        get_Context    : IntPtr
        get_Plugin     : IntPtr
        get_Status     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbTaskInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    TargetId {
        get => this.get_TargetId()
    }

    /**
     * @type {FILETIME} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {FILETIME} 
     */
    EndTime {
        get => this.get_EndTime()
    }

    /**
     * @type {FILETIME} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * @type {BSTR} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * @type {BSTR} 
     */
    Label {
        get => this.get_Label()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * @type {BSTR} 
     */
    Plugin {
        get => this.get_Plugin()
    }

    /**
     * @type {RDV_TASK_STATUS} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Retrieves the target identifier.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_targetid
     */
    get_TargetId() {
        pName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * Retrieves the earliest time the task agent can start the task.
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_starttime
     */
    get_StartTime() {
        pStartTime := FILETIME()
        result := ComCall(4, this, FILETIME.Ptr, pStartTime, "HRESULT")
        return pStartTime
    }

    /**
     * Retrieves the latest time the task agent can start the task.
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_endtime
     */
    get_EndTime() {
        pEndTime := FILETIME()
        result := ComCall(5, this, FILETIME.Ptr, pEndTime, "HRESULT")
        return pEndTime
    }

    /**
     * Retrieves the time by which the task must be initiated. This is used to prioritize patches. The patch with the earliest deadline will get initiated first.
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_deadline
     */
    get_Deadline() {
        pDeadline := FILETIME()
        result := ComCall(6, this, FILETIME.Ptr, pDeadline, "HRESULT")
        return pDeadline
    }

    /**
     * Retrieves a GUID that is used as a unique identifier by the task agent.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_identifier
     */
    get_Identifier() {
        pIdentifier := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pIdentifier, "HRESULT")
        return pIdentifier
    }

    /**
     * Retrieves the label that describes the purpose of the task.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_label
     */
    get_Label() {
        pLabel := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pLabel, "HRESULT")
        return pLabel
    }

    /**
     * Retrieves the context bytes associated with the task.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_context
     */
    get_Context() {
        result := ComCall(9, this, "ptr*", &pContext := 0, "HRESULT")
        return pContext
    }

    /**
     * Retrieves the display name of the task agent.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_plugin
     */
    get_Plugin() {
        pPlugin := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pPlugin, "HRESULT")
        return pPlugin
    }

    /**
     * Retrieves an RDV_TASK_STATUS enumeration value that represents the state of the task.
     * @returns {RDV_TASK_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    Query(iid) {
        if (ITsSbTaskInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TargetId := CallbackCreate(GetMethod(implObj, "get_TargetId"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.get_EndTime := CallbackCreate(GetMethod(implObj, "get_EndTime"), flags, 2)
        this.vtbl.get_Deadline := CallbackCreate(GetMethod(implObj, "get_Deadline"), flags, 2)
        this.vtbl.get_Identifier := CallbackCreate(GetMethod(implObj, "get_Identifier"), flags, 2)
        this.vtbl.get_Label := CallbackCreate(GetMethod(implObj, "get_Label"), flags, 2)
        this.vtbl.get_Context := CallbackCreate(GetMethod(implObj, "get_Context"), flags, 2)
        this.vtbl.get_Plugin := CallbackCreate(GetMethod(implObj, "get_Plugin"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TargetId)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.get_EndTime)
        CallbackFree(this.vtbl.get_Deadline)
        CallbackFree(this.vtbl.get_Identifier)
        CallbackFree(this.vtbl.get_Label)
        CallbackFree(this.vtbl.get_Context)
        CallbackFree(this.vtbl.get_Plugin)
        CallbackFree(this.vtbl.get_Status)
    }
}
