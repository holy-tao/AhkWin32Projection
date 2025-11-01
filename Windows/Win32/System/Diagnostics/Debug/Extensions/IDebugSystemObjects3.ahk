#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSystemObjects3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSystemObjects3
     * @type {Guid}
     */
    static IID => Guid("{e9676e2f-e286-4ea3-b0f9-dfe5d9fc330e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventThread", "GetEventProcess", "GetCurrentThreadId", "SetCurrentThreadId", "GetCurrentProcessId", "SetCurrentProcessId", "GetNumberThreads", "GetTotalNumberThreads", "GetThreadIdsByIndex", "GetThreadIdByProcessor", "GetCurrentThreadDataOffset", "GetThreadIdByDataOffset", "GetCurrentThreadTeb", "GetThreadIdByTeb", "GetCurrentThreadSystemId", "GetThreadIdBySystemId", "GetCurrentThreadHandle", "GetThreadIdByHandle", "GetNumberProcesses", "GetProcessIdsByIndex", "GetCurrentProcessDataOffset", "GetProcessIdByDataOffset", "GetCurrentProcessPeb", "GetProcessIdByPeb", "GetCurrentProcessSystemId", "GetProcessIdBySystemId", "GetCurrentProcessHandle", "GetProcessIdByHandle", "GetCurrentProcessExecutableName", "GetCurrentProcessUpTime", "GetImplicitThreadDataOffset", "SetImplicitThreadDataOffset", "GetImplicitProcessDataOffset", "SetImplicitProcessDataOffset", "GetEventSystem", "GetCurrentSystemId", "SetCurrentSystemId", "GetNumberSystems", "GetSystemIdsByIndex", "GetTotalNumberThreadsAndProcesses", "GetCurrentSystemServer", "GetSystemByServer", "GetCurrentSystemServerName"]

    /**
     * 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetEventThread(Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetEventProcess(Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * Retrieves the thread identifier of the calling thread.
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} The return value is the thread identifier of the calling thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadid
     */
    GetCurrentThreadId(Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, IdMarshal, Id, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} The return value is the process identifier of the calling process.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocessid
     */
    GetCurrentProcessId(Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, IdMarshal, Id, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberThreads(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, NumberMarshal, Number, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByProcessor(Processor, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", Processor, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentThreadDataOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByDataOffset(Offset, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", Offset, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentThreadTeb(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByTeb(Offset, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", Offset, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SysId 
     * @returns {HRESULT} 
     */
    GetCurrentThreadSystemId(SysId) {
        SysIdMarshal := SysId is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, SysIdMarshal, SysId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SysId 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdBySystemId(SysId, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "uint", SysId, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    GetCurrentThreadHandle(Handle) {
        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, HandleMarshal, Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByHandle(Handle, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", Handle, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberProcesses(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, NumberMarshal, Number, "HRESULT")
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
    GetProcessIdsByIndex(Start, Count, Ids, SysIds) {
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"
        SysIdsMarshal := SysIds is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", Start, "uint", Count, IdsMarshal, Ids, SysIdsMarshal, SysIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentProcessDataOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByDataOffset(Offset, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", Offset, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentProcessPeb(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByPeb(Offset, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", Offset, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SysId 
     * @returns {HRESULT} 
     */
    GetCurrentProcessSystemId(SysId) {
        SysIdMarshal := SysId is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, SysIdMarshal, SysId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SysId 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdBySystemId(SysId, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "uint", SysId, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    GetCurrentProcessHandle(Handle) {
        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, HandleMarshal, Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByHandle(Handle, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "uint", Handle, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} ExeSize 
     * @returns {HRESULT} 
     */
    GetCurrentProcessExecutableName(Buffer, BufferSize, ExeSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        ExeSizeMarshal := ExeSize is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "ptr", Buffer, "uint", BufferSize, ExeSizeMarshal, ExeSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} UpTime 
     * @returns {HRESULT} 
     */
    GetCurrentProcessUpTime(UpTime) {
        UpTimeMarshal := UpTime is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, UpTimeMarshal, UpTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetImplicitThreadDataOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    SetImplicitThreadDataOffset(Offset) {
        result := ComCall(34, this, "uint", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetImplicitProcessDataOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    SetImplicitProcessDataOffset(Offset) {
        result := ComCall(36, this, "uint", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetEventSystem(Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetCurrentSystemId(Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    SetCurrentSystemId(Id) {
        result := ComCall(39, this, "uint", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSystems(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, NumberMarshal, Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Ids 
     * @returns {HRESULT} 
     */
    GetSystemIdsByIndex(Start, Count, Ids) {
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "uint", Start, "uint", Count, IdsMarshal, Ids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} TotalThreads 
     * @param {Pointer<Integer>} TotalProcesses 
     * @param {Pointer<Integer>} LargestProcessThreads 
     * @param {Pointer<Integer>} LargestSystemThreads 
     * @param {Pointer<Integer>} LargestSystemProcesses 
     * @returns {HRESULT} 
     */
    GetTotalNumberThreadsAndProcesses(TotalThreads, TotalProcesses, LargestProcessThreads, LargestSystemThreads, LargestSystemProcesses) {
        TotalThreadsMarshal := TotalThreads is VarRef ? "uint*" : "ptr"
        TotalProcessesMarshal := TotalProcesses is VarRef ? "uint*" : "ptr"
        LargestProcessThreadsMarshal := LargestProcessThreads is VarRef ? "uint*" : "ptr"
        LargestSystemThreadsMarshal := LargestSystemThreads is VarRef ? "uint*" : "ptr"
        LargestSystemProcessesMarshal := LargestSystemProcesses is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, TotalThreadsMarshal, TotalThreads, TotalProcessesMarshal, TotalProcesses, LargestProcessThreadsMarshal, LargestProcessThreads, LargestSystemThreadsMarshal, LargestSystemThreads, LargestSystemProcessesMarshal, LargestSystemProcesses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Server 
     * @returns {HRESULT} 
     */
    GetCurrentSystemServer(Server) {
        ServerMarshal := Server is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, ServerMarshal, Server, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetSystemByServer(Server, Id) {
        IdMarshal := Id is VarRef ? "uint*" : "ptr"

        result := ComCall(44, this, "uint", Server, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetCurrentSystemServerName(Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, "ptr", Buffer, "uint", BufferSize, NameSizeMarshal, NameSize, "HRESULT")
        return result
    }
}
