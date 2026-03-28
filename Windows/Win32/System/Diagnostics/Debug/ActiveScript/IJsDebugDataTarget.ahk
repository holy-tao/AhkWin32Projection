#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IEnumJsStackFrames.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugDataTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsDebugDataTarget
     * @type {Guid}
     */
    static IID => Guid("{53b28977-53a1-48e5-9000-5d0dfa893931}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadMemory", "WriteMemory", "AllocateVirtualMemory", "FreeVirtualMemory", "GetTlsValue", "ReadBSTR", "ReadNullTerminatedString", "CreateStackFrameEnumerator", "GetThreadContext"]

    /**
     * 
     * @param {Integer} _address 
     * @param {Integer} flags 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} _size 
     * @param {Pointer<Integer>} pBytesRead 
     * @returns {HRESULT} 
     */
    ReadMemory(_address, flags, pBuffer, _size, pBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pBytesReadMarshal := pBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", _address, "int", flags, pBufferMarshal, pBuffer, "uint", _size, pBytesReadMarshal, pBytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _address 
     * @param {Pointer<Integer>} pMemory 
     * @param {Integer} _size 
     * @returns {HRESULT} 
     */
    WriteMemory(_address, pMemory, _size) {
        pMemoryMarshal := pMemory is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", _address, pMemoryMarshal, pMemory, "uint", _size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _address 
     * @param {Integer} _size 
     * @param {Integer} allocationType 
     * @param {Integer} pageProtection 
     * @returns {Integer} 
     */
    AllocateVirtualMemory(_address, _size, allocationType, pageProtection) {
        result := ComCall(5, this, "uint", _address, "uint", _size, "uint", allocationType, "uint", pageProtection, "uint*", &pAllocatedAddress := 0, "HRESULT")
        return pAllocatedAddress
    }

    /**
     * 
     * @param {Integer} _address 
     * @param {Integer} _size 
     * @param {Integer} freeType 
     * @returns {HRESULT} 
     */
    FreeVirtualMemory(_address, _size, freeType) {
        result := ComCall(6, this, "uint", _address, "uint", _size, "uint", freeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @param {Integer} tlsIndex 
     * @returns {Integer} 
     */
    GetTlsValue(threadId, tlsIndex) {
        result := ComCall(7, this, "uint", threadId, "uint", tlsIndex, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} _address 
     * @returns {BSTR} 
     */
    ReadBSTR(_address) {
        pString := BSTR()
        result := ComCall(8, this, "uint", _address, "ptr", pString, "HRESULT")
        return pString
    }

    /**
     * 
     * @param {Integer} _address 
     * @param {Integer} characterSize 
     * @param {Integer} maxCharacters 
     * @returns {BSTR} 
     */
    ReadNullTerminatedString(_address, characterSize, maxCharacters) {
        pString := BSTR()
        result := ComCall(9, this, "uint", _address, "ushort", characterSize, "uint", maxCharacters, "ptr", pString, "HRESULT")
        return pString
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {IEnumJsStackFrames} 
     */
    CreateStackFrameEnumerator(threadId) {
        result := ComCall(10, this, "uint", threadId, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IEnumJsStackFrames(ppEnumerator)
    }

    /**
     * Retrieves the context of the specified thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a selective context based on the value of the **ContextFlags** member of the context structure. The thread identified by the *hThread* parameter is typically being debugged, but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the [SuspendThread](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread) function to suspend the thread before calling **GetThreadContext**.
     * 
     * If you call **GetThreadContext** for the current thread, the function returns successfully; however, the context returned is not valid.
     * @param {Integer} threadId 
     * @param {Integer} contextFlags 
     * @param {Integer} contextSize 
     * @returns {Void} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(threadId, contextFlags, contextSize) {
        result := ComCall(11, this, "uint", threadId, "uint", contextFlags, "uint", contextSize, "ptr", &pContext := 0, "HRESULT")
        return pContext
    }
}
