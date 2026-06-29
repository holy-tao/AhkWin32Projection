#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumJsStackFrames.ahk" { IEnumJsStackFrames }
#Import ".\JsDebugReadMemoryFlags.ahk" { JsDebugReadMemoryFlags }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsDebugDataTarget extends IUnknown {
    /**
     * The interface identifier for IJsDebugDataTarget
     * @type {Guid}
     */
    static IID := Guid("{53b28977-53a1-48e5-9000-5d0dfa893931}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsDebugDataTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadMemory                 : IntPtr
        WriteMemory                : IntPtr
        AllocateVirtualMemory      : IntPtr
        FreeVirtualMemory          : IntPtr
        GetTlsValue                : IntPtr
        ReadBSTR                   : IntPtr
        ReadNullTerminatedString   : IntPtr
        CreateStackFrameEnumerator : IntPtr
        GetThreadContext           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsDebugDataTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} _address 
     * @param {JsDebugReadMemoryFlags} flags 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} _size 
     * @param {Pointer<Integer>} pBytesRead 
     * @returns {HRESULT} 
     */
    ReadMemory(_address, flags, pBuffer, _size, pBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pBytesReadMarshal := pBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", _address, JsDebugReadMemoryFlags, flags, pBufferMarshal, pBuffer, "uint", _size, pBytesReadMarshal, pBytesRead, "HRESULT")
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
        pString := BSTR.Owned()
        result := ComCall(8, this, "uint", _address, BSTR.Ptr, pString, "HRESULT")
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
        pString := BSTR.Owned()
        result := ComCall(9, this, "uint", _address, "ushort", characterSize, "uint", maxCharacters, BSTR.Ptr, pString, "HRESULT")
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

    Query(iid) {
        if (IJsDebugDataTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadMemory := CallbackCreate(GetMethod(implObj, "ReadMemory"), flags, 6)
        this.vtbl.WriteMemory := CallbackCreate(GetMethod(implObj, "WriteMemory"), flags, 4)
        this.vtbl.AllocateVirtualMemory := CallbackCreate(GetMethod(implObj, "AllocateVirtualMemory"), flags, 6)
        this.vtbl.FreeVirtualMemory := CallbackCreate(GetMethod(implObj, "FreeVirtualMemory"), flags, 4)
        this.vtbl.GetTlsValue := CallbackCreate(GetMethod(implObj, "GetTlsValue"), flags, 4)
        this.vtbl.ReadBSTR := CallbackCreate(GetMethod(implObj, "ReadBSTR"), flags, 3)
        this.vtbl.ReadNullTerminatedString := CallbackCreate(GetMethod(implObj, "ReadNullTerminatedString"), flags, 5)
        this.vtbl.CreateStackFrameEnumerator := CallbackCreate(GetMethod(implObj, "CreateStackFrameEnumerator"), flags, 3)
        this.vtbl.GetThreadContext := CallbackCreate(GetMethod(implObj, "GetThreadContext"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadMemory)
        CallbackFree(this.vtbl.WriteMemory)
        CallbackFree(this.vtbl.AllocateVirtualMemory)
        CallbackFree(this.vtbl.FreeVirtualMemory)
        CallbackFree(this.vtbl.GetTlsValue)
        CallbackFree(this.vtbl.ReadBSTR)
        CallbackFree(this.vtbl.ReadNullTerminatedString)
        CallbackFree(this.vtbl.CreateStackFrameEnumerator)
        CallbackFree(this.vtbl.GetThreadContext)
    }
}
