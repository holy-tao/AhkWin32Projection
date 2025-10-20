#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugDataTarget extends IUnknown{
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
     * 
     * @param {Integer} address 
     * @param {Integer} flags 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} size 
     * @param {Pointer<UInt32>} pBytesRead 
     * @returns {HRESULT} 
     */
    ReadMemory(address, flags, pBuffer, size, pBytesRead) {
        result := ComCall(3, this, "uint", address, "int", flags, "char*", pBuffer, "uint", size, "uint*", pBytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Pointer<Byte>} pMemory 
     * @param {Integer} size 
     * @returns {HRESULT} 
     */
    WriteMemory(address, pMemory, size) {
        result := ComCall(4, this, "uint", address, "char*", pMemory, "uint", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} size 
     * @param {Integer} allocationType 
     * @param {Integer} pageProtection 
     * @param {Pointer<UInt64>} pAllocatedAddress 
     * @returns {HRESULT} 
     */
    AllocateVirtualMemory(address, size, allocationType, pageProtection, pAllocatedAddress) {
        result := ComCall(5, this, "uint", address, "uint", size, "uint", allocationType, "uint", pageProtection, "uint*", pAllocatedAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} size 
     * @param {Integer} freeType 
     * @returns {HRESULT} 
     */
    FreeVirtualMemory(address, size, freeType) {
        result := ComCall(6, this, "uint", address, "uint", size, "uint", freeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @param {Integer} tlsIndex 
     * @param {Pointer<UInt64>} pValue 
     * @returns {HRESULT} 
     */
    GetTlsValue(threadId, tlsIndex, pValue) {
        result := ComCall(7, this, "uint", threadId, "uint", tlsIndex, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Pointer<BSTR>} pString 
     * @returns {HRESULT} 
     */
    ReadBSTR(address, pString) {
        result := ComCall(8, this, "uint", address, "ptr", pString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} characterSize 
     * @param {Integer} maxCharacters 
     * @param {Pointer<BSTR>} pString 
     * @returns {HRESULT} 
     */
    ReadNullTerminatedString(address, characterSize, maxCharacters, pString) {
        result := ComCall(9, this, "uint", address, "ushort", characterSize, "uint", maxCharacters, "ptr", pString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @param {Pointer<IEnumJsStackFrames>} ppEnumerator 
     * @returns {HRESULT} 
     */
    CreateStackFrameEnumerator(threadId, ppEnumerator) {
        result := ComCall(10, this, "uint", threadId, "ptr", ppEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the context of the specified thread.
     * @param {Integer} threadId 
     * @param {Integer} contextFlags 
     * @param {Integer} contextSize 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(threadId, contextFlags, contextSize, pContext) {
        result := ComCall(11, this, "uint", threadId, "uint", contextFlags, "uint", contextSize, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
