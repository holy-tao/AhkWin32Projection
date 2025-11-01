#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSystemObjects extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSystemObjects
     * @type {Guid}
     */
    static IID => Guid("{6b86fe2c-2c4f-4f0c-9da2-174311acc327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventThread", "GetEventProcess", "GetCurrentThreadId", "SetCurrentThreadId", "GetCurrentProcessId", "SetCurrentProcessId", "GetNumberThreads", "GetTotalNumberThreads", "GetThreadIdsByIndex", "GetThreadIdByProcessor", "GetCurrentThreadDataOffset", "GetThreadIdByDataOffset", "GetCurrentThreadTeb", "GetThreadIdByTeb", "GetCurrentThreadSystemId", "GetThreadIdBySystemId", "GetCurrentThreadHandle", "GetThreadIdByHandle", "GetNumberProcesses", "GetProcessIdsByIndex", "GetCurrentProcessDataOffset", "GetProcessIdByDataOffset", "GetCurrentProcessPeb", "GetProcessIdByPeb", "GetCurrentProcessSystemId", "GetProcessIdBySystemId", "GetCurrentProcessHandle", "GetProcessIdByHandle", "GetCurrentProcessExecutableName"]

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
}
