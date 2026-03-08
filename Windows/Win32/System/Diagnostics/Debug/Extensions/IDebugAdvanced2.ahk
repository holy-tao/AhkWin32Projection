#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugAdvanced2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugAdvanced2
     * @type {Guid}
     */
    static IID => Guid("{716d14c9-119b-4ba5-af1f-0890e672416a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThreadContext", "SetThreadContext", "Request", "GetSourceFileInformation", "FindSourceFileAndToken", "GetSymbolInformation", "GetSystemObjectInformation"]

    /**
     * Retrieves the context of the specified thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a selective context based on the value of the **ContextFlags** member of the context structure. The thread identified by the *hThread* parameter is typically being debugged, but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the [SuspendThread](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread) function to suspend the thread before calling **GetThreadContext**.
     * 
     * If you call **GetThreadContext** for the current thread, the function returns successfully; however, the context returned is not valid.
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(Context, ContextSize) {
        result := ComCall(3, this, "ptr", Context, "uint", ContextSize, "HRESULT")
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
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the context was set, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadcontext
     */
    SetThreadContext(Context, ContextSize) {
        result := ComCall(4, this, "ptr", Context, "uint", ContextSize, "HRESULT")
        return result
    }

    /**
     * Specifies the type of application that created a certificate request.
     * @param {Integer} Request 
     * @param {Pointer} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Pointer} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-requestclientinfoclientid
     */
    Request(Request, InBuffer, InBufferSize, OutBuffer, OutBufferSize) {
        result := ComCall(5, this, "uint", Request, "ptr", InBuffer, "uint", InBufferSize, "ptr", OutBuffer, "uint", OutBufferSize, "uint*", &OutSize := 0, "HRESULT")
        return OutSize
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} SourceFile 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourceFileInformation(Which, SourceFile, Arg64, Arg32, Buffer_R, BufferSize) {
        SourceFile := SourceFile is String ? StrPtr(SourceFile) : SourceFile

        result := ComCall(6, this, "uint", Which, "ptr", SourceFile, "uint", Arg64, "uint", Arg32, "ptr", Buffer_R, "uint", BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} ModAddr 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer} FileToken 
     * @param {Integer} FileTokenSize 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PSTR} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileAndToken(StartElement, ModAddr, File, Flags, FileToken, FileTokenSize, FoundElement, Buffer_R, BufferSize, FoundSize) {
        File := File is String ? StrPtr(File) : File
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        FoundElementMarshal := FoundElement is VarRef ? "uint*" : "ptr"
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", StartElement, "uint", ModAddr, "ptr", File, "uint", Flags, "ptr", FileToken, "uint", FileTokenSize, FoundElementMarshal, FoundElement, "ptr", Buffer_R, "uint", BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @param {PSTR} StringBuffer 
     * @param {Integer} StringBufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolInformation(Which, Arg64, Arg32, Buffer_R, BufferSize, InfoSize, StringBuffer, StringBufferSize, StringSize) {
        StringBuffer := StringBuffer is String ? StrPtr(StringBuffer) : StringBuffer

        InfoSizeMarshal := InfoSize is VarRef ? "uint*" : "ptr"
        StringSizeMarshal := StringSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", Buffer_R, "uint", BufferSize, InfoSizeMarshal, InfoSize, "ptr", StringBuffer, "uint", StringBufferSize, StringSizeMarshal, StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemObjectInformation(Which, Arg64, Arg32, Buffer_R, BufferSize) {
        result := ComCall(9, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", Buffer_R, "uint", BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }
}
