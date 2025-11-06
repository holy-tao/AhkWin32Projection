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
     * @param {Integer} address 
     * @param {Integer} flags 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} size 
     * @param {Pointer<Integer>} pBytesRead 
     * @returns {HRESULT} 
     */
    ReadMemory(address, flags, pBuffer, size, pBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pBytesReadMarshal := pBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", address, "int", flags, pBufferMarshal, pBuffer, "uint", size, pBytesReadMarshal, pBytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Pointer<Integer>} pMemory 
     * @param {Integer} size 
     * @returns {HRESULT} 
     */
    WriteMemory(address, pMemory, size) {
        pMemoryMarshal := pMemory is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", address, pMemoryMarshal, pMemory, "uint", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} size 
     * @param {Integer} allocationType 
     * @param {Integer} pageProtection 
     * @returns {Integer} 
     */
    AllocateVirtualMemory(address, size, allocationType, pageProtection) {
        result := ComCall(5, this, "uint", address, "uint", size, "uint", allocationType, "uint", pageProtection, "uint*", &pAllocatedAddress := 0, "HRESULT")
        return pAllocatedAddress
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} size 
     * @param {Integer} freeType 
     * @returns {HRESULT} 
     */
    FreeVirtualMemory(address, size, freeType) {
        result := ComCall(6, this, "uint", address, "uint", size, "uint", freeType, "HRESULT")
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
     * @param {Integer} address 
     * @returns {BSTR} 
     */
    ReadBSTR(address) {
        pString := BSTR()
        result := ComCall(8, this, "uint", address, "ptr", pString, "HRESULT")
        return pString
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} characterSize 
     * @param {Integer} maxCharacters 
     * @returns {BSTR} 
     */
    ReadNullTerminatedString(address, characterSize, maxCharacters) {
        pString := BSTR()
        result := ComCall(9, this, "uint", address, "ushort", characterSize, "uint", maxCharacters, "ptr", pString, "HRESULT")
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
     * @param {Integer} threadId 
     * @param {Integer} contextFlags 
     * @param {Integer} contextSize 
     * @returns {Void} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(threadId, contextFlags, contextSize) {
        result := ComCall(11, this, "uint", threadId, "uint", contextFlags, "uint", contextSize, "ptr", &pContext := 0, "HRESULT")
        return pContext
    }
}
