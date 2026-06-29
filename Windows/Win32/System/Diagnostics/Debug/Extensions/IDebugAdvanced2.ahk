#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugAdvanced2 extends IUnknown {
    /**
     * The interface identifier for IDebugAdvanced2
     * @type {Guid}
     */
    static IID := Guid("{716d14c9-119b-4ba5-af1f-0890e672416a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugAdvanced2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetThreadContext           : IntPtr
        SetThreadContext           : IntPtr
        Request                    : IntPtr
        GetSourceFileInformation   : IntPtr
        FindSourceFileAndToken     : IntPtr
        GetSymbolInformation       : IntPtr
        GetSystemObjectInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugAdvanced2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the context of the specified thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a selective context based on the value of the **ContextFlags** member of the context structure. The thread identified by the *hThread* parameter is typically being debugged, but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the [SuspendThread](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread) function to suspend the thread before calling **GetThreadContext**.
     * 
     * If you call **GetThreadContext** for the current thread, the function returns successfully; however, the context returned is not valid.
     * @param {Integer} _Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(_Context, ContextSize) {
        result := ComCall(3, this, "ptr", _Context, "uint", ContextSize, "HRESULT")
        return result
    }

    /**
     * Sets the context for the specified thread.
     * @remarks
     * The function sets the thread context based on the value of the <b>ContextFlags</b> member 
     *     of the context structure. The thread identified by the <i>hThread</i> parameter is typically 
     *     being debugged, but the function can also operate even when the thread is not being debugged.
     * 
     * Do not try to set the context for a running thread; the results are unpredictable. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread">SuspendThread</a> function to suspend the thread before 
     *     calling <b>SetThreadContext</b>.
     * @param {Integer} _Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the context was set, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadcontext
     */
    SetThreadContext(_Context, ContextSize) {
        result := ComCall(4, this, "ptr", _Context, "uint", ContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Request 
     * @param {Integer} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Integer} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @returns {Integer} 
     */
    Request(Request, InBuffer, InBufferSize, OutBuffer, OutBufferSize) {
        result := ComCall(5, this, "uint", Request, "ptr", InBuffer, "uint", InBufferSize, "ptr", OutBuffer, "uint", OutBufferSize, "uint*", &OutSize := 0, "HRESULT")
        return OutSize
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} _SourceFile 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourceFileInformation(Which, _SourceFile, Arg64, Arg32, _Buffer, BufferSize) {
        _SourceFile := _SourceFile is String ? StrPtr(_SourceFile) : _SourceFile

        result := ComCall(6, this, "uint", Which, "ptr", _SourceFile, "uint", Arg64, "uint", Arg32, "ptr", _Buffer, "uint", BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} ModAddr 
     * @param {PSTR} _File 
     * @param {Integer} Flags 
     * @param {Integer} FileToken 
     * @param {Integer} FileTokenSize 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileAndToken(StartElement, ModAddr, _File, Flags, FileToken, FileTokenSize, FoundElement, _Buffer, BufferSize, FoundSize) {
        _File := _File is String ? StrPtr(_File) : _File
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FoundElementMarshal := FoundElement is VarRef ? "uint*" : "ptr"
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", StartElement, "uint", ModAddr, "ptr", _File, "uint", Flags, "ptr", FileToken, "uint", FileTokenSize, FoundElementMarshal, FoundElement, "ptr", _Buffer, "uint", BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @param {PSTR} StringBuffer 
     * @param {Integer} StringBufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolInformation(Which, Arg64, Arg32, _Buffer, BufferSize, InfoSize, StringBuffer, StringBufferSize, StringSize) {
        StringBuffer := StringBuffer is String ? StrPtr(StringBuffer) : StringBuffer

        InfoSizeMarshal := InfoSize is VarRef ? "uint*" : "ptr"
        StringSizeMarshal := StringSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", _Buffer, "uint", BufferSize, InfoSizeMarshal, InfoSize, "ptr", StringBuffer, "uint", StringBufferSize, StringSizeMarshal, StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemObjectInformation(Which, Arg64, Arg32, _Buffer, BufferSize) {
        result := ComCall(9, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", _Buffer, "uint", BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    Query(iid) {
        if (IDebugAdvanced2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThreadContext := CallbackCreate(GetMethod(implObj, "GetThreadContext"), flags, 3)
        this.vtbl.SetThreadContext := CallbackCreate(GetMethod(implObj, "SetThreadContext"), flags, 3)
        this.vtbl.Request := CallbackCreate(GetMethod(implObj, "Request"), flags, 7)
        this.vtbl.GetSourceFileInformation := CallbackCreate(GetMethod(implObj, "GetSourceFileInformation"), flags, 8)
        this.vtbl.FindSourceFileAndToken := CallbackCreate(GetMethod(implObj, "FindSourceFileAndToken"), flags, 11)
        this.vtbl.GetSymbolInformation := CallbackCreate(GetMethod(implObj, "GetSymbolInformation"), flags, 10)
        this.vtbl.GetSystemObjectInformation := CallbackCreate(GetMethod(implObj, "GetSystemObjectInformation"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetThreadContext)
        CallbackFree(this.vtbl.SetThreadContext)
        CallbackFree(this.vtbl.Request)
        CallbackFree(this.vtbl.GetSourceFileInformation)
        CallbackFree(this.vtbl.FindSourceFileAndToken)
        CallbackFree(this.vtbl.GetSymbolInformation)
        CallbackFree(this.vtbl.GetSystemObjectInformation)
    }
}
