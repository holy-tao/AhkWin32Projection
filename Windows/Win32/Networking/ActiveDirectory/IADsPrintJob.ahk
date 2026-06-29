#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsPrintJob interface is a dual interface that inherits from IADs.
 * @remarks
 * To manage a print job across a network, use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsprintjoboperations">IADsPrintJobOperations</a> interface, which supports the functionality to examine the status of a print job and to pause or resume the operation of printing the document, and so on.
 * 
 * To access any print jobs in a print queue, call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsprintqueueoperations-printjobs">IADsPrintQueueOperations::PrintJobs</a> method to obtain the collection object holding all the print jobs in the print queue.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsprintjob
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPrintJob extends IADs {
    /**
     * The interface identifier for IADsPrintJob
     * @type {Guid}
     */
    static IID := Guid("{32fb6780-1ed0-11cf-a988-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPrintJob interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_HostPrintQueue : IntPtr
        get_User           : IntPtr
        get_UserPath       : IntPtr
        get_TimeSubmitted  : IntPtr
        get_TotalPages     : IntPtr
        get_Size           : IntPtr
        get_Description    : IntPtr
        put_Description    : IntPtr
        get_Priority       : IntPtr
        put_Priority       : IntPtr
        get_StartTime      : IntPtr
        put_StartTime      : IntPtr
        get_UntilTime      : IntPtr
        put_UntilTime      : IntPtr
        get_Notify         : IntPtr
        put_Notify         : IntPtr
        get_NotifyPath     : IntPtr
        put_NotifyPath     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPrintJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    HostPrintQueue {
        get => this.get_HostPrintQueue()
    }

    /**
     * @type {BSTR} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {BSTR} 
     */
    UserPath {
        get => this.get_UserPath()
    }

    /**
     * @type {Float} 
     */
    TimeSubmitted {
        get => this.get_TimeSubmitted()
    }

    /**
     * @type {Integer} 
     */
    TotalPages {
        get => this.get_TotalPages()
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {Float} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {Float} 
     */
    UntilTime {
        get => this.get_UntilTime()
        set => this.put_UntilTime(value)
    }

    /**
     * @type {BSTR} 
     */
    Notify {
        get => this.get_Notify()
        set => this.put_Notify(value)
    }

    /**
     * @type {BSTR} 
     */
    NotifyPath {
        get => this.get_NotifyPath()
        set => this.put_NotifyPath(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostPrintQueue() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_User() {
        retval := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserPath() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TimeSubmitted() {
        result := ComCall(23, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalPages() {
        result := ComCall(24, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(25, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(27, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(28, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lnPriority) {
        result := ComCall(29, this, "int", lnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StartTime() {
        result := ComCall(30, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daStartTime 
     * @returns {HRESULT} 
     */
    put_StartTime(daStartTime) {
        result := ComCall(31, this, "double", daStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UntilTime() {
        result := ComCall(32, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daUntilTime 
     * @returns {HRESULT} 
     */
    put_UntilTime(daUntilTime) {
        result := ComCall(33, this, "double", daUntilTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notify() {
        retval := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNotify 
     * @returns {HRESULT} 
     */
    put_Notify(bstrNotify) {
        bstrNotify := bstrNotify is String ? BSTR.Alloc(bstrNotify).Value : bstrNotify

        result := ComCall(35, this, BSTR, bstrNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NotifyPath() {
        retval := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNotifyPath 
     * @returns {HRESULT} 
     */
    put_NotifyPath(bstrNotifyPath) {
        bstrNotifyPath := bstrNotifyPath is String ? BSTR.Alloc(bstrNotifyPath).Value : bstrNotifyPath

        result := ComCall(37, this, BSTR, bstrNotifyPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPrintJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HostPrintQueue := CallbackCreate(GetMethod(implObj, "get_HostPrintQueue"), flags, 2)
        this.vtbl.get_User := CallbackCreate(GetMethod(implObj, "get_User"), flags, 2)
        this.vtbl.get_UserPath := CallbackCreate(GetMethod(implObj, "get_UserPath"), flags, 2)
        this.vtbl.get_TimeSubmitted := CallbackCreate(GetMethod(implObj, "get_TimeSubmitted"), flags, 2)
        this.vtbl.get_TotalPages := CallbackCreate(GetMethod(implObj, "get_TotalPages"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.put_StartTime := CallbackCreate(GetMethod(implObj, "put_StartTime"), flags, 2)
        this.vtbl.get_UntilTime := CallbackCreate(GetMethod(implObj, "get_UntilTime"), flags, 2)
        this.vtbl.put_UntilTime := CallbackCreate(GetMethod(implObj, "put_UntilTime"), flags, 2)
        this.vtbl.get_Notify := CallbackCreate(GetMethod(implObj, "get_Notify"), flags, 2)
        this.vtbl.put_Notify := CallbackCreate(GetMethod(implObj, "put_Notify"), flags, 2)
        this.vtbl.get_NotifyPath := CallbackCreate(GetMethod(implObj, "get_NotifyPath"), flags, 2)
        this.vtbl.put_NotifyPath := CallbackCreate(GetMethod(implObj, "put_NotifyPath"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HostPrintQueue)
        CallbackFree(this.vtbl.get_User)
        CallbackFree(this.vtbl.get_UserPath)
        CallbackFree(this.vtbl.get_TimeSubmitted)
        CallbackFree(this.vtbl.get_TotalPages)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.put_StartTime)
        CallbackFree(this.vtbl.get_UntilTime)
        CallbackFree(this.vtbl.put_UntilTime)
        CallbackFree(this.vtbl.get_Notify)
        CallbackFree(this.vtbl.put_Notify)
        CallbackFree(this.vtbl.get_NotifyPath)
        CallbackFree(this.vtbl.put_NotifyPath)
    }
}
