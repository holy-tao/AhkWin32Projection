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
        result := ComCall(3, this, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetEventProcess(Id) {
        result := ComCall(4, this, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * Retrieves the thread identifier of the calling thread.
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} The return value is the thread identifier of the calling thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadid
     */
    GetCurrentThreadId(Id) {
        result := ComCall(5, this, "uint*", Id, "HRESULT")
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
        result := ComCall(7, this, "uint*", Id, "HRESULT")
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
        result := ComCall(9, this, "uint*", Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Total 
     * @param {Pointer<Integer>} LargestProcess 
     * @returns {HRESULT} 
     */
    GetTotalNumberThreads(Total, LargestProcess) {
        result := ComCall(10, this, "uint*", Total, "uint*", LargestProcess, "HRESULT")
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
        result := ComCall(11, this, "uint", Start, "uint", Count, "uint*", Ids, "uint*", SysIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByProcessor(Processor, Id) {
        result := ComCall(12, this, "uint", Processor, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentThreadDataOffset(Offset) {
        result := ComCall(13, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByDataOffset(Offset, Id) {
        result := ComCall(14, this, "uint", Offset, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentThreadTeb(Offset) {
        result := ComCall(15, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByTeb(Offset, Id) {
        result := ComCall(16, this, "uint", Offset, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SysId 
     * @returns {HRESULT} 
     */
    GetCurrentThreadSystemId(SysId) {
        result := ComCall(17, this, "uint*", SysId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SysId 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdBySystemId(SysId, Id) {
        result := ComCall(18, this, "uint", SysId, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    GetCurrentThreadHandle(Handle) {
        result := ComCall(19, this, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByHandle(Handle, Id) {
        result := ComCall(20, this, "uint", Handle, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberProcesses(Number) {
        result := ComCall(21, this, "uint*", Number, "HRESULT")
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
        result := ComCall(22, this, "uint", Start, "uint", Count, "uint*", Ids, "uint*", SysIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentProcessDataOffset(Offset) {
        result := ComCall(23, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByDataOffset(Offset, Id) {
        result := ComCall(24, this, "uint", Offset, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentProcessPeb(Offset) {
        result := ComCall(25, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByPeb(Offset, Id) {
        result := ComCall(26, this, "uint", Offset, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SysId 
     * @returns {HRESULT} 
     */
    GetCurrentProcessSystemId(SysId) {
        result := ComCall(27, this, "uint*", SysId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SysId 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdBySystemId(SysId, Id) {
        result := ComCall(28, this, "uint", SysId, "uint*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    GetCurrentProcessHandle(Handle) {
        result := ComCall(29, this, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByHandle(Handle, Id) {
        result := ComCall(30, this, "uint", Handle, "uint*", Id, "HRESULT")
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

        result := ComCall(31, this, "ptr", Buffer, "uint", BufferSize, "uint*", ExeSize, "HRESULT")
        return result
    }
}
