#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSystemObjects3 extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetEventThread(Id) {
        result := ComCall(3, this, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetEventProcess(Id) {
        result := ComCall(4, this, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the thread identifier of the calling thread.
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} The return value is the thread identifier of the calling thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadid
     */
    GetCurrentThreadId(Id) {
        result := ComCall(5, this, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    SetCurrentThreadId(Id) {
        result := ComCall(6, this, "uint", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the process identifier of the calling process.
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} The return value is the process identifier of the calling process.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocessid
     */
    GetCurrentProcessId(Id) {
        result := ComCall(7, this, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    SetCurrentProcessId(Id) {
        result := ComCall(8, this, "uint", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberThreads(Number) {
        result := ComCall(9, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Total 
     * @param {Pointer<UInt32>} LargestProcess 
     * @returns {HRESULT} 
     */
    GetTotalNumberThreads(Total, LargestProcess) {
        result := ComCall(10, this, "uint*", Total, "uint*", LargestProcess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Ids 
     * @param {Pointer<UInt32>} SysIds 
     * @returns {HRESULT} 
     */
    GetThreadIdsByIndex(Start, Count, Ids, SysIds) {
        result := ComCall(11, this, "uint", Start, "uint", Count, "uint*", Ids, "uint*", SysIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByProcessor(Processor, Id) {
        result := ComCall(12, this, "uint", Processor, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentThreadDataOffset(Offset) {
        result := ComCall(13, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByDataOffset(Offset, Id) {
        result := ComCall(14, this, "uint", Offset, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentThreadTeb(Offset) {
        result := ComCall(15, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByTeb(Offset, Id) {
        result := ComCall(16, this, "uint", Offset, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} SysId 
     * @returns {HRESULT} 
     */
    GetCurrentThreadSystemId(SysId) {
        result := ComCall(17, this, "uint*", SysId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SysId 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdBySystemId(SysId, Id) {
        result := ComCall(18, this, "uint", SysId, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    GetCurrentThreadHandle(Handle) {
        result := ComCall(19, this, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetThreadIdByHandle(Handle, Id) {
        result := ComCall(20, this, "uint", Handle, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberProcesses(Number) {
        result := ComCall(21, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Ids 
     * @param {Pointer<UInt32>} SysIds 
     * @returns {HRESULT} 
     */
    GetProcessIdsByIndex(Start, Count, Ids, SysIds) {
        result := ComCall(22, this, "uint", Start, "uint", Count, "uint*", Ids, "uint*", SysIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentProcessDataOffset(Offset) {
        result := ComCall(23, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByDataOffset(Offset, Id) {
        result := ComCall(24, this, "uint", Offset, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetCurrentProcessPeb(Offset) {
        result := ComCall(25, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByPeb(Offset, Id) {
        result := ComCall(26, this, "uint", Offset, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} SysId 
     * @returns {HRESULT} 
     */
    GetCurrentProcessSystemId(SysId) {
        result := ComCall(27, this, "uint*", SysId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SysId 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdBySystemId(SysId, Id) {
        result := ComCall(28, this, "uint", SysId, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    GetCurrentProcessHandle(Handle) {
        result := ComCall(29, this, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetProcessIdByHandle(Handle, Id) {
        result := ComCall(30, this, "uint", Handle, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} ExeSize 
     * @returns {HRESULT} 
     */
    GetCurrentProcessExecutableName(Buffer, BufferSize, ExeSize) {
        result := ComCall(31, this, "ptr", Buffer, "uint", BufferSize, "uint*", ExeSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} UpTime 
     * @returns {HRESULT} 
     */
    GetCurrentProcessUpTime(UpTime) {
        result := ComCall(32, this, "uint*", UpTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetImplicitThreadDataOffset(Offset) {
        result := ComCall(33, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    SetImplicitThreadDataOffset(Offset) {
        result := ComCall(34, this, "uint", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetImplicitProcessDataOffset(Offset) {
        result := ComCall(35, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    SetImplicitProcessDataOffset(Offset) {
        result := ComCall(36, this, "uint", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetEventSystem(Id) {
        result := ComCall(37, this, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetCurrentSystemId(Id) {
        result := ComCall(38, this, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    SetCurrentSystemId(Id) {
        result := ComCall(39, this, "uint", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSystems(Number) {
        result := ComCall(40, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Ids 
     * @returns {HRESULT} 
     */
    GetSystemIdsByIndex(Start, Count, Ids) {
        result := ComCall(41, this, "uint", Start, "uint", Count, "uint*", Ids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} TotalThreads 
     * @param {Pointer<UInt32>} TotalProcesses 
     * @param {Pointer<UInt32>} LargestProcessThreads 
     * @param {Pointer<UInt32>} LargestSystemThreads 
     * @param {Pointer<UInt32>} LargestSystemProcesses 
     * @returns {HRESULT} 
     */
    GetTotalNumberThreadsAndProcesses(TotalThreads, TotalProcesses, LargestProcessThreads, LargestSystemThreads, LargestSystemProcesses) {
        result := ComCall(42, this, "uint*", TotalThreads, "uint*", TotalProcesses, "uint*", LargestProcessThreads, "uint*", LargestSystemThreads, "uint*", LargestSystemProcesses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Server 
     * @returns {HRESULT} 
     */
    GetCurrentSystemServer(Server) {
        result := ComCall(43, this, "uint*", Server, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Pointer<UInt32>} Id 
     * @returns {HRESULT} 
     */
    GetSystemByServer(Server, Id) {
        result := ComCall(44, this, "uint", Server, "uint*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetCurrentSystemServerName(Buffer, BufferSize, NameSize) {
        result := ComCall(45, this, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
