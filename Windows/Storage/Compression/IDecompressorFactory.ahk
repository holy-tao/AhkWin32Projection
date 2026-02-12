#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Decompressor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Compression
 * @version WindowsRuntime 1.4
 */
class IDecompressorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDecompressorFactory
     * @type {Guid}
     */
    static IID => Guid("{5337e252-1da2-42e1-8834-0379d28d742f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDecompressor"]

    /**
     * Generates a new DECOMPRESSOR_HANDLE.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.  If the system can find no compression algorithm matching the specified name and version, the error  can be <b>ERROR_NOT_SUPPORTED</b>.
     * @param {IInputStream} underlyingStream 
     * @returns {Decompressor} 
     * @see https://learn.microsoft.com/windows/win32/api//content/compressapi/nf-compressapi-createdecompressor
     */
    CreateDecompressor(underlyingStream) {
        result := ComCall(6, this, "ptr", underlyingStream, "ptr*", &createdDecompressor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Decompressor(createdDecompressor)
    }
}
