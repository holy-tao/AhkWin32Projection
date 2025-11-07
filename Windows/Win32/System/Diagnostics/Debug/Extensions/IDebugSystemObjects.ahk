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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadid
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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocessid
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
        result := ComCall(9, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
        result := ComCall(19, this, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {Integer} 
     */
    GetThreadIdByHandle(Handle) {
        result := ComCall(20, this, "uint", Handle, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberProcesses() {
        result := ComCall(21, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
        result := ComCall(29, this, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {Integer} 
     */
    GetProcessIdByHandle(Handle) {
        result := ComCall(30, this, "uint", Handle, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCurrentProcessExecutableName(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(31, this, "ptr", Buffer, "uint", BufferSize, "uint*", &ExeSize := 0, "HRESULT")
        return ExeSize
    }
}
