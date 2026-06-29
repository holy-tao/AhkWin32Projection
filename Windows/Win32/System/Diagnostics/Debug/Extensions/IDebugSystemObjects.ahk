#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugSystemObjects extends IUnknown {
    /**
     * The interface identifier for IDebugSystemObjects
     * @type {Guid}
     */
    static IID := Guid("{6b86fe2c-2c4f-4f0c-9da2-174311acc327}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugSystemObjects interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventThread                  : IntPtr
        GetEventProcess                 : IntPtr
        GetCurrentThreadId              : IntPtr
        SetCurrentThreadId              : IntPtr
        GetCurrentProcessId             : IntPtr
        SetCurrentProcessId             : IntPtr
        GetNumberThreads                : IntPtr
        GetTotalNumberThreads           : IntPtr
        GetThreadIdsByIndex             : IntPtr
        GetThreadIdByProcessor          : IntPtr
        GetCurrentThreadDataOffset      : IntPtr
        GetThreadIdByDataOffset         : IntPtr
        GetCurrentThreadTeb             : IntPtr
        GetThreadIdByTeb                : IntPtr
        GetCurrentThreadSystemId        : IntPtr
        GetThreadIdBySystemId           : IntPtr
        GetCurrentThreadHandle          : IntPtr
        GetThreadIdByHandle             : IntPtr
        GetNumberProcesses              : IntPtr
        GetProcessIdsByIndex            : IntPtr
        GetCurrentProcessDataOffset     : IntPtr
        GetProcessIdByDataOffset        : IntPtr
        GetCurrentProcessPeb            : IntPtr
        GetProcessIdByPeb               : IntPtr
        GetCurrentProcessSystemId       : IntPtr
        GetProcessIdBySystemId          : IntPtr
        GetCurrentProcessHandle         : IntPtr
        GetProcessIdByHandle            : IntPtr
        GetCurrentProcessExecutableName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugSystemObjects.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEventThread() {
        result := ComCall(3, this, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEventProcess() {
        result := ComCall(4, this, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * Retrieves the thread identifier of the calling thread.
     * @remarks
     * Until the thread terminates, the thread identifier uniquely identifies the thread throughout the system.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid
     */
    GetCurrentThreadId() {
        result := ComCall(5, this, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    SetCurrentThreadId(Id) {
        result := ComCall(6, this, "uint", Id, "HRESULT")
        return result
    }

    /**
     * Retrieves the process identifier of the calling process.
     * @remarks
     * Until the process terminates, the process identifier uniquely identifies the process throughout the system.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid
     */
    GetCurrentProcessId() {
        result := ComCall(7, this, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    SetCurrentProcessId(Id) {
        result := ComCall(8, this, "uint", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberThreads() {
        result := ComCall(9, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Pointer<Integer>} Total 
     * @param {Pointer<Integer>} LargestProcess 
     * @returns {HRESULT} 
     */
    GetTotalNumberThreads(Total, LargestProcess) {
        TotalMarshal := Total is VarRef ? "uint*" : "ptr"
        LargestProcessMarshal := LargestProcess is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, TotalMarshal, Total, LargestProcessMarshal, LargestProcess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Ids 
     * @param {Pointer<Integer>} SysIds 
     * @returns {HRESULT} 
     */
    GetThreadIdsByIndex(Start, Count, Ids, SysIds) {
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"
        SysIdsMarshal := SysIds is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", Start, "uint", Count, IdsMarshal, Ids, SysIdsMarshal, SysIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @returns {Integer} 
     */
    GetThreadIdByProcessor(Processor) {
        result := ComCall(12, this, "uint", Processor, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentThreadDataOffset() {
        result := ComCall(13, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    GetThreadIdByDataOffset(Offset) {
        result := ComCall(14, this, "uint", Offset, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentThreadTeb() {
        result := ComCall(15, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    GetThreadIdByTeb(Offset) {
        result := ComCall(16, this, "uint", Offset, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentThreadSystemId() {
        result := ComCall(17, this, "uint*", &SysId := 0, "HRESULT")
        return SysId
    }

    /**
     * 
     * @param {Integer} SysId 
     * @returns {Integer} 
     */
    GetThreadIdBySystemId(SysId) {
        result := ComCall(18, this, "uint", SysId, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentThreadHandle() {
        result := ComCall(19, this, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {Integer} 
     */
    GetThreadIdByHandle(_Handle) {
        result := ComCall(20, this, "uint", _Handle, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberProcesses() {
        result := ComCall(21, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Ids 
     * @param {Pointer<Integer>} SysIds 
     * @returns {HRESULT} 
     */
    GetProcessIdsByIndex(Start, Count, Ids, SysIds) {
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"
        SysIdsMarshal := SysIds is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", Start, "uint", Count, IdsMarshal, Ids, SysIdsMarshal, SysIds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentProcessDataOffset() {
        result := ComCall(23, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    GetProcessIdByDataOffset(Offset) {
        result := ComCall(24, this, "uint", Offset, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentProcessPeb() {
        result := ComCall(25, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    GetProcessIdByPeb(Offset) {
        result := ComCall(26, this, "uint", Offset, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentProcessSystemId() {
        result := ComCall(27, this, "uint*", &SysId := 0, "HRESULT")
        return SysId
    }

    /**
     * 
     * @param {Integer} SysId 
     * @returns {Integer} 
     */
    GetProcessIdBySystemId(SysId) {
        result := ComCall(28, this, "uint", SysId, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentProcessHandle() {
        result := ComCall(29, this, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {Integer} 
     */
    GetProcessIdByHandle(_Handle) {
        result := ComCall(30, this, "uint", _Handle, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCurrentProcessExecutableName(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(31, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &ExeSize := 0, "HRESULT")
        return ExeSize
    }

    Query(iid) {
        if (IDebugSystemObjects.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventThread := CallbackCreate(GetMethod(implObj, "GetEventThread"), flags, 2)
        this.vtbl.GetEventProcess := CallbackCreate(GetMethod(implObj, "GetEventProcess"), flags, 2)
        this.vtbl.GetCurrentThreadId := CallbackCreate(GetMethod(implObj, "GetCurrentThreadId"), flags, 2)
        this.vtbl.SetCurrentThreadId := CallbackCreate(GetMethod(implObj, "SetCurrentThreadId"), flags, 2)
        this.vtbl.GetCurrentProcessId := CallbackCreate(GetMethod(implObj, "GetCurrentProcessId"), flags, 2)
        this.vtbl.SetCurrentProcessId := CallbackCreate(GetMethod(implObj, "SetCurrentProcessId"), flags, 2)
        this.vtbl.GetNumberThreads := CallbackCreate(GetMethod(implObj, "GetNumberThreads"), flags, 2)
        this.vtbl.GetTotalNumberThreads := CallbackCreate(GetMethod(implObj, "GetTotalNumberThreads"), flags, 3)
        this.vtbl.GetThreadIdsByIndex := CallbackCreate(GetMethod(implObj, "GetThreadIdsByIndex"), flags, 5)
        this.vtbl.GetThreadIdByProcessor := CallbackCreate(GetMethod(implObj, "GetThreadIdByProcessor"), flags, 3)
        this.vtbl.GetCurrentThreadDataOffset := CallbackCreate(GetMethod(implObj, "GetCurrentThreadDataOffset"), flags, 2)
        this.vtbl.GetThreadIdByDataOffset := CallbackCreate(GetMethod(implObj, "GetThreadIdByDataOffset"), flags, 3)
        this.vtbl.GetCurrentThreadTeb := CallbackCreate(GetMethod(implObj, "GetCurrentThreadTeb"), flags, 2)
        this.vtbl.GetThreadIdByTeb := CallbackCreate(GetMethod(implObj, "GetThreadIdByTeb"), flags, 3)
        this.vtbl.GetCurrentThreadSystemId := CallbackCreate(GetMethod(implObj, "GetCurrentThreadSystemId"), flags, 2)
        this.vtbl.GetThreadIdBySystemId := CallbackCreate(GetMethod(implObj, "GetThreadIdBySystemId"), flags, 3)
        this.vtbl.GetCurrentThreadHandle := CallbackCreate(GetMethod(implObj, "GetCurrentThreadHandle"), flags, 2)
        this.vtbl.GetThreadIdByHandle := CallbackCreate(GetMethod(implObj, "GetThreadIdByHandle"), flags, 3)
        this.vtbl.GetNumberProcesses := CallbackCreate(GetMethod(implObj, "GetNumberProcesses"), flags, 2)
        this.vtbl.GetProcessIdsByIndex := CallbackCreate(GetMethod(implObj, "GetProcessIdsByIndex"), flags, 5)
        this.vtbl.GetCurrentProcessDataOffset := CallbackCreate(GetMethod(implObj, "GetCurrentProcessDataOffset"), flags, 2)
        this.vtbl.GetProcessIdByDataOffset := CallbackCreate(GetMethod(implObj, "GetProcessIdByDataOffset"), flags, 3)
        this.vtbl.GetCurrentProcessPeb := CallbackCreate(GetMethod(implObj, "GetCurrentProcessPeb"), flags, 2)
        this.vtbl.GetProcessIdByPeb := CallbackCreate(GetMethod(implObj, "GetProcessIdByPeb"), flags, 3)
        this.vtbl.GetCurrentProcessSystemId := CallbackCreate(GetMethod(implObj, "GetCurrentProcessSystemId"), flags, 2)
        this.vtbl.GetProcessIdBySystemId := CallbackCreate(GetMethod(implObj, "GetProcessIdBySystemId"), flags, 3)
        this.vtbl.GetCurrentProcessHandle := CallbackCreate(GetMethod(implObj, "GetCurrentProcessHandle"), flags, 2)
        this.vtbl.GetProcessIdByHandle := CallbackCreate(GetMethod(implObj, "GetProcessIdByHandle"), flags, 3)
        this.vtbl.GetCurrentProcessExecutableName := CallbackCreate(GetMethod(implObj, "GetCurrentProcessExecutableName"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventThread)
        CallbackFree(this.vtbl.GetEventProcess)
        CallbackFree(this.vtbl.GetCurrentThreadId)
        CallbackFree(this.vtbl.SetCurrentThreadId)
        CallbackFree(this.vtbl.GetCurrentProcessId)
        CallbackFree(this.vtbl.SetCurrentProcessId)
        CallbackFree(this.vtbl.GetNumberThreads)
        CallbackFree(this.vtbl.GetTotalNumberThreads)
        CallbackFree(this.vtbl.GetThreadIdsByIndex)
        CallbackFree(this.vtbl.GetThreadIdByProcessor)
        CallbackFree(this.vtbl.GetCurrentThreadDataOffset)
        CallbackFree(this.vtbl.GetThreadIdByDataOffset)
        CallbackFree(this.vtbl.GetCurrentThreadTeb)
        CallbackFree(this.vtbl.GetThreadIdByTeb)
        CallbackFree(this.vtbl.GetCurrentThreadSystemId)
        CallbackFree(this.vtbl.GetThreadIdBySystemId)
        CallbackFree(this.vtbl.GetCurrentThreadHandle)
        CallbackFree(this.vtbl.GetThreadIdByHandle)
        CallbackFree(this.vtbl.GetNumberProcesses)
        CallbackFree(this.vtbl.GetProcessIdsByIndex)
        CallbackFree(this.vtbl.GetCurrentProcessDataOffset)
        CallbackFree(this.vtbl.GetProcessIdByDataOffset)
        CallbackFree(this.vtbl.GetCurrentProcessPeb)
        CallbackFree(this.vtbl.GetProcessIdByPeb)
        CallbackFree(this.vtbl.GetCurrentProcessSystemId)
        CallbackFree(this.vtbl.GetProcessIdBySystemId)
        CallbackFree(this.vtbl.GetCurrentProcessHandle)
        CallbackFree(this.vtbl.GetProcessIdByHandle)
        CallbackFree(this.vtbl.GetCurrentProcessExecutableName)
    }
}
