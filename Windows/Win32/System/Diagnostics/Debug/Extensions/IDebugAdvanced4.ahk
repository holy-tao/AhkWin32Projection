#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugAdvanced4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugAdvanced4
     * @type {Guid}
     */
    static IID => Guid("{d1069067-2a65-4bf0-ae97-76184b67856b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThreadContext", "SetThreadContext", "Request", "GetSourceFileInformation", "FindSourceFileAndToken", "GetSymbolInformation", "GetSystemObjectInformation", "GetSourceFileInformationWide", "FindSourceFileAndTokenWide", "GetSymbolInformationWide", "GetSymbolInformationWideEx"]

    /**
     * Retrieves the context of the specified thread.
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(Context, ContextSize) {
        result := ComCall(3, this, "ptr", Context, "uint", ContextSize, "HRESULT")
        return result
    }

    /**
     * Sets the context for the specified thread.
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the context was set, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadcontext
     */
    SetThreadContext(Context, ContextSize) {
        result := ComCall(4, this, "ptr", Context, "uint", ContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Request 
     * @param {Pointer} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Pointer} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @param {Pointer<Integer>} OutSize 
     * @returns {HRESULT} 
     */
    Request(Request, InBuffer, InBufferSize, OutBuffer, OutBufferSize, OutSize) {
        result := ComCall(5, this, "uint", Request, "ptr", InBuffer, "uint", InBufferSize, "ptr", OutBuffer, "uint", OutBufferSize, "uint*", OutSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} SourceFile 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @returns {HRESULT} 
     */
    GetSourceFileInformation(Which, SourceFile, Arg64, Arg32, Buffer, BufferSize, InfoSize) {
        SourceFile := SourceFile is String ? StrPtr(SourceFile) : SourceFile

        result := ComCall(6, this, "uint", Which, "ptr", SourceFile, "uint", Arg64, "uint", Arg32, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "HRESULT")
        return result
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileAndToken(StartElement, ModAddr, File, Flags, FileToken, FileTokenSize, FoundElement, Buffer, BufferSize, FoundSize) {
        File := File is String ? StrPtr(File) : File
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(7, this, "uint", StartElement, "uint", ModAddr, "ptr", File, "uint", Flags, "ptr", FileToken, "uint", FileTokenSize, "uint*", FoundElement, "ptr", Buffer, "uint", BufferSize, "uint*", FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @param {PSTR} StringBuffer 
     * @param {Integer} StringBufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolInformation(Which, Arg64, Arg32, Buffer, BufferSize, InfoSize, StringBuffer, StringBufferSize, StringSize) {
        StringBuffer := StringBuffer is String ? StrPtr(StringBuffer) : StringBuffer

        result := ComCall(8, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "ptr", StringBuffer, "uint", StringBufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @returns {HRESULT} 
     */
    GetSystemObjectInformation(Which, Arg64, Arg32, Buffer, BufferSize, InfoSize) {
        result := ComCall(9, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PWSTR} SourceFile 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @returns {HRESULT} 
     */
    GetSourceFileInformationWide(Which, SourceFile, Arg64, Arg32, Buffer, BufferSize, InfoSize) {
        SourceFile := SourceFile is String ? StrPtr(SourceFile) : SourceFile

        result := ComCall(10, this, "uint", Which, "ptr", SourceFile, "uint", Arg64, "uint", Arg32, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} ModAddr 
     * @param {PWSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer} FileToken 
     * @param {Integer} FileTokenSize 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFileAndTokenWide(StartElement, ModAddr, File, Flags, FileToken, FileTokenSize, FoundElement, Buffer, BufferSize, FoundSize) {
        File := File is String ? StrPtr(File) : File
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(11, this, "uint", StartElement, "uint", ModAddr, "ptr", File, "uint", Flags, "ptr", FileToken, "uint", FileTokenSize, "uint*", FoundElement, "ptr", Buffer, "uint", BufferSize, "uint*", FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @param {PWSTR} StringBuffer 
     * @param {Integer} StringBufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSymbolInformationWide(Which, Arg64, Arg32, Buffer, BufferSize, InfoSize, StringBuffer, StringBufferSize, StringSize) {
        StringBuffer := StringBuffer is String ? StrPtr(StringBuffer) : StringBuffer

        result := ComCall(12, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "ptr", StringBuffer, "uint", StringBufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Arg64 
     * @param {Integer} Arg32 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @param {PWSTR} StringBuffer 
     * @param {Integer} StringBufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @param {Pointer<SYMBOL_INFO_EX>} pInfoEx 
     * @returns {HRESULT} 
     */
    GetSymbolInformationWideEx(Which, Arg64, Arg32, Buffer, BufferSize, InfoSize, StringBuffer, StringBufferSize, StringSize, pInfoEx) {
        StringBuffer := StringBuffer is String ? StrPtr(StringBuffer) : StringBuffer

        result := ComCall(13, this, "uint", Which, "uint", Arg64, "uint", Arg32, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "ptr", StringBuffer, "uint", StringBufferSize, "uint*", StringSize, "ptr", pInfoEx, "HRESULT")
        return result
    }
}
