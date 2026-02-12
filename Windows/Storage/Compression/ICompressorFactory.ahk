#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Compressor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Compression
 * @version WindowsRuntime 1.4
 */
class ICompressorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompressorFactory
     * @type {Guid}
     */
    static IID => Guid("{5f3d96a4-2cfb-442c-a8ba-d7d11b039da0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCompressor", "CreateCompressorEx"]

    /**
     * Generates a new COMPRESSOR_HANDLE.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.  If the system can find no compression algorithm matching the specified name and version, the error  can be <b>ERROR_NOT_SUPPORTED</b>.
     * @param {IOutputStream} underlyingStream 
     * @returns {Compressor} 
     * @see https://learn.microsoft.com/windows/win32/api//content/compressapi/nf-compressapi-createcompressor
     */
    CreateCompressor(underlyingStream) {
        result := ComCall(6, this, "ptr", underlyingStream, "ptr*", &createdCompressor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Compressor(createdCompressor)
    }

    /**
     * 
     * @param {IOutputStream} underlyingStream 
     * @param {Integer} algorithm 
     * @param {Integer} blockSize 
     * @returns {Compressor} 
     */
    CreateCompressorEx(underlyingStream, algorithm, blockSize) {
        result := ComCall(7, this, "ptr", underlyingStream, "int", algorithm, "uint", blockSize, "ptr*", &createdCompressor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Compressor(createdCompressor)
    }
}
