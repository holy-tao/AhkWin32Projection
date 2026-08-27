#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugAdvanced3 extends IUnknown {
    /**
     * The interface identifier for IDebugAdvanced3
     * @type {Guid}
     */
    static IID := Guid("{cba4abb4-84c4-444d-87ca-a04e13286739}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugAdvanced3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetThreadContext             : IntPtr
        SetThreadContext             : IntPtr
        Request                      : IntPtr
        GetSourceFileInformation     : IntPtr
        FindSourceFileAndToken       : IntPtr
        GetSymbolInformation         : IntPtr
        GetSystemObjectInformation   : IntPtr
        GetSourceFileInformationWide : IntPtr
        FindSourceFileAndTokenWide   : IntPtr
        GetSymbolInformationWide     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugAdvanced3.Vtbl()
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
        result := ComCall(3, this, IntPtr, _Context, UInt32, ContextSize, "HRESULT")
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
        result := ComCall(4, this, IntPtr, _Context, UInt32, ContextSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Request 
     * @param {Integer} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Integer} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @returns {Integer} 
     */
    Request(Request, InBuffer, InBufferSize, OutBuffer, OutBufferSize) {
        InBufferMarshal := InBuffer == 0 ? IntPtr : IntPtr
        OutBufferMarshal := OutBuffer == 0 ? IntPtr : IntPtr

        result := ComCall(5, this, UInt32, Request, InBufferMarshal, InBuffer, UInt32, InBufferSize, OutBufferMarshal, OutBuffer, UInt32, OutBufferSize, "uint*", &OutSize := 0, "HRESULT")
        return OutSize
    }

    /**
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

        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr

        result := ComCall(6, this, UInt32, Which, "ptr", _SourceFile, Int64, Arg64, UInt32, Arg32, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    /**
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

        FileTokenMarshal := FileToken == 0 ? IntPtr : IntPtr
        FoundElementMarshal := FoundElement is VarRef ? "uint*" : IntPtr
        FoundElementMarshal := FoundElement == 0 ? IntPtr : "uint*"
        _BufferMarshal := _Buffer == 0 ? IntPtr : PSTR
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : IntPtr
        FoundSizeMarshal := FoundSize == 0 ? IntPtr : "uint*"

        result := ComCall(7, this, UInt32, StartElement, Int64, ModAddr, "ptr", _File, UInt32, Flags, FileTokenMarshal, FileToken, UInt32, FileTokenSize, FoundElementMarshal, FoundElement, _BufferMarshal, _Buffer, UInt32, BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
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

        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr
        InfoSizeMarshal := InfoSize is VarRef ? "uint*" : IntPtr
        InfoSizeMarshal := InfoSize == 0 ? IntPtr : "uint*"
        StringBufferMarshal := StringBuffer == 0 ? IntPtr : PSTR
        StringSizeMarshal := StringSize is VarRef ? "uint*" : IntPtr
        StringSizeMarshal := StringSize == 0 ? IntPtr : "uint*"

        result := ComCall(8, this, UInt32, Which, Int64, Arg64, UInt32, Arg32, _BufferMarshal, _Buffer, UInt32, BufferSize, InfoSizeMarshal, InfoSize, StringBufferMarshal, StringBuffer, UInt32, StringBufferSize, StringSizeMarshal, StringSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemObjectInformation(Which, Arg64, Arg32, _Buffer, BufferSize) {
        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr

        result := ComCall(9, this, UInt32, Which, Int64, Arg64, UInt32, Arg32, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    /**
     * @param {Integer} Which 
     * @param {PWSTR} _SourceFile 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourceFileInformationWide(Which, _SourceFile, Arg64, Arg32, _Buffer, BufferSize) {
        _SourceFile := _SourceFile is String ? StrPtr(_SourceFile) : _SourceFile

        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr

        result := ComCall(10, this, UInt32, Which, "ptr", _SourceFile, Int64, Arg64, UInt32, Arg32, _BufferMarshal, _Buffer, UInt32, BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    /**
     * @param {Integer} StartElement 
     * @param {Integer} ModAddr 
     * @param {PWSTR} _File 
     * @param {Integer} Flags 
     * @param {Integer} FileToken 
     * @param {Integer} FileTokenSize 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileAndTokenWide(StartElement, ModAddr, _File, Flags, FileToken, FileTokenSize, FoundElement, _Buffer, BufferSize, FoundSize) {
        _File := _File is String ? StrPtr(_File) : _File
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FileTokenMarshal := FileToken == 0 ? IntPtr : IntPtr
        FoundElementMarshal := FoundElement is VarRef ? "uint*" : IntPtr
        FoundElementMarshal := FoundElement == 0 ? IntPtr : "uint*"
        _BufferMarshal := _Buffer == 0 ? IntPtr : PWSTR
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : IntPtr
        FoundSizeMarshal := FoundSize == 0 ? IntPtr : "uint*"

        result := ComCall(11, this, UInt32, StartElement, Int64, ModAddr, "ptr", _File, UInt32, Flags, FileTokenMarshal, FileToken, UInt32, FileTokenSize, FoundElementMarshal, FoundElement, _BufferMarshal, _Buffer, UInt32, BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @param {PWSTR} StringBuffer 
     * @param {Integer} StringBufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolInformationWide(Which, Arg64, Arg32, _Buffer, BufferSize, InfoSize, StringBuffer, StringBufferSize, StringSize) {
        StringBuffer := StringBuffer is String ? StrPtr(StringBuffer) : StringBuffer

        _BufferMarshal := _Buffer == 0 ? IntPtr : IntPtr
        InfoSizeMarshal := InfoSize is VarRef ? "uint*" : IntPtr
        InfoSizeMarshal := InfoSize == 0 ? IntPtr : "uint*"
        StringBufferMarshal := StringBuffer == 0 ? IntPtr : PWSTR
        StringSizeMarshal := StringSize is VarRef ? "uint*" : IntPtr
        StringSizeMarshal := StringSize == 0 ? IntPtr : "uint*"

        result := ComCall(12, this, UInt32, Which, Int64, Arg64, UInt32, Arg32, _BufferMarshal, _Buffer, UInt32, BufferSize, InfoSizeMarshal, InfoSize, StringBufferMarshal, StringBuffer, UInt32, StringBufferSize, StringSizeMarshal, StringSize, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IDebugAdvanced3.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThreadContext := CallbackCreate(ObjBindMethod(implObj, "GetThreadContext"), flags, 3)
        this.vtbl.SetThreadContext := CallbackCreate(ObjBindMethod(implObj, "SetThreadContext"), flags, 3)
        this.vtbl.Request := CallbackCreate(ObjBindMethod(implObj, "Request"), flags, 7)
        this.vtbl.GetSourceFileInformation := CallbackCreate(ObjBindMethod(implObj, "GetSourceFileInformation"), flags, 8)
        this.vtbl.FindSourceFileAndToken := CallbackCreate(ObjBindMethod(implObj, "FindSourceFileAndToken"), flags, 11)
        this.vtbl.GetSymbolInformation := CallbackCreate(ObjBindMethod(implObj, "GetSymbolInformation"), flags, 10)
        this.vtbl.GetSystemObjectInformation := CallbackCreate(ObjBindMethod(implObj, "GetSystemObjectInformation"), flags, 7)
        this.vtbl.GetSourceFileInformationWide := CallbackCreate(ObjBindMethod(implObj, "GetSourceFileInformationWide"), flags, 8)
        this.vtbl.FindSourceFileAndTokenWide := CallbackCreate(ObjBindMethod(implObj, "FindSourceFileAndTokenWide"), flags, 11)
        this.vtbl.GetSymbolInformationWide := CallbackCreate(ObjBindMethod(implObj, "GetSymbolInformationWide"), flags, 10)
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
        CallbackFree(this.vtbl.GetSourceFileInformationWide)
        CallbackFree(this.vtbl.FindSourceFileAndTokenWide)
        CallbackFree(this.vtbl.GetSymbolInformationWide)
    }
}
