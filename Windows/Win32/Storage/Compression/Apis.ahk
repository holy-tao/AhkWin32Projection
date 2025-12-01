#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.Compression
 * @version v4.0.30319
 */
class Compression {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_NULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_MAX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_RAW => 536870912
;@endregion Constants

;@region Methods
    /**
     * Generates a new COMPRESSOR_HANDLE.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.  If the system can find no compression algorithm matching the specified name and version, the error  can be <b>ERROR_NOT_SUPPORTED</b>.
     * @param {Integer} Algorithm The type of compression algorithm and mode to be used by this compressor.
     * @param {Pointer<COMPRESS_ALLOCATION_ROUTINES>} AllocationRoutines Optional memory allocation and deallocation routines in a <a href="https://docs.microsoft.com/windows/win32/api/compressapi/ns-compressapi-compress_allocation_routines">COMPRESS_ALLOCATION_ROUTINES</a> structure.
     * @param {Pointer<COMPRESSOR_HANDLE>} CompressorHandle If the function succeeds, the handle to the specified compressor.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-createcompressor
     * @since windows8.0
     */
    static CreateCompressor(Algorithm, AllocationRoutines, CompressorHandle) {
        A_LastError := 0

        result := DllCall("Cabinet.dll\CreateCompressor", "uint", Algorithm, "ptr", AllocationRoutines, "ptr", CompressorHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets information in a compressor for a particular compression algorithm.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>. If the system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>. If the compression algorithm does not allow changing the value of this information class, the error can be <b>ERROR_NOT_SUPPORTED</b>. If the compression algorithm does not allow the information class, the error can be <b>ERROR_UNSUPPORTED_TYPE</b>.
     * @param {COMPRESSOR_HANDLE} CompressorHandle Handle to the compressor.
     * @param {Integer} CompressInformationClass A value that identifies the type of information. of the  enumeration that identifies the type of information.
     * @param {Pointer} CompressInformation The information being set read as bytes. The maximum size in bytes is given by <i>CompressInformationSize</i>.
     * @param {Pointer} CompressInformationSize Maximum size  of the information in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-setcompressorinformation
     * @since windows8.0
     */
    static SetCompressorInformation(CompressorHandle, CompressInformationClass, CompressInformation, CompressInformationSize) {
        CompressorHandle := CompressorHandle is Win32Handle ? NumGet(CompressorHandle, "ptr") : CompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\SetCompressorInformation", "ptr", CompressorHandle, "int", CompressInformationClass, "ptr", CompressInformation, "ptr", CompressInformationSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queries a compressor for information for a particular compression algorithm.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>. If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>. If the compression algorithm does not allow the information class, the error can be <b>ERROR_UNSUPPORTED_TYPE</b>. If the buffer is too small to hold the value, the error can be <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @param {COMPRESSOR_HANDLE} CompressorHandle Handle to the compressor being queried for information.
     * @param {Integer} CompressInformationClass A value of the  <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/ne-compressapi-compress_information_class">COMPRESS_INFORMATION_CLASS</a> enumeration that identifies the type of information.
     * @param {Pointer} CompressInformation Information for the compression algorithm written as bytes. The maximum size in bytes of this information is given by <i>CompressInformationSize</i>.
     * @param {Pointer} CompressInformationSize Maximum size  in bytes of the information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-querycompressorinformation
     * @since windows8.0
     */
    static QueryCompressorInformation(CompressorHandle, CompressInformationClass, CompressInformation, CompressInformationSize) {
        CompressorHandle := CompressorHandle is Win32Handle ? NumGet(CompressorHandle, "ptr") : CompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\QueryCompressorInformation", "ptr", CompressorHandle, "int", CompressInformationClass, "ptr", CompressInformation, "ptr", CompressInformationSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Takes a block of information and compresses it.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.    If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>. If the output buffer is too small to hold the compressed data, the error can be <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * If <i>CompressedBuffer</i> output buffer is too small to hold the compressed data, the function fails and the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_INSUFFICIENT_BUFFER</b>. In this case, the <i>CompressedDataSize</i> parameter receives with the size that the  <i>CompressedBuffer</i> needs to be to guarantee success for that input buffer. You can set <i>CompressedBufferSize</i> to zero to determine the size of the output buffer to allocate.
     * @param {COMPRESSOR_HANDLE} CompressorHandle Handle to a compressor returned by <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/nf-compressapi-createcompressor">CreateCompressor</a>.
     * @param {Pointer} UncompressedData Contains the block of information that is to be compressed. The size in bytes of the uncompressed block is given by <i>UncompressedDataSize</i>.
     * @param {Pointer} UncompressedDataSize Size in bytes  of the uncompressed information.
     * @param {Pointer} CompressedBuffer The buffer that receives the compressed information. The maximum size in bytes of the buffer is given by <i>CompressedBufferSize</i>.
     * @param {Pointer} CompressedBufferSize Maximum size  in bytes of the buffer that receives the compressed information.
     * @param {Pointer<Pointer>} CompressedDataSize Actual size  in bytes of the compressed information received.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-compress
     * @since windows8.0
     */
    static Compress(CompressorHandle, UncompressedData, UncompressedDataSize, CompressedBuffer, CompressedBufferSize, CompressedDataSize) {
        CompressorHandle := CompressorHandle is Win32Handle ? NumGet(CompressorHandle, "ptr") : CompressorHandle

        CompressedDataSizeMarshal := CompressedDataSize is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("Cabinet.dll\Compress", "ptr", CompressorHandle, "ptr", UncompressedData, "ptr", UncompressedDataSize, "ptr", CompressedBuffer, "ptr", CompressedBufferSize, CompressedDataSizeMarshal, CompressedDataSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prepares the compressor for the compression of a new stream.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.    If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>.
     * @param {COMPRESSOR_HANDLE} CompressorHandle Handle to the compressor returned by <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/nf-compressapi-createcompressor">CreateCompressor</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-resetcompressor
     * @since windows8.0
     */
    static ResetCompressor(CompressorHandle) {
        CompressorHandle := CompressorHandle is Win32Handle ? NumGet(CompressorHandle, "ptr") : CompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\ResetCompressor", "ptr", CompressorHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Call to close an open COMPRESSOR_HANDLE.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.    If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>.
     * @param {COMPRESSOR_HANDLE} CompressorHandle Handle to the compressor to be closed. This is the handle to the compressor that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/nf-compressapi-createcompressor">CreateCompressor</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-closecompressor
     * @since windows8.0
     */
    static CloseCompressor(CompressorHandle) {
        CompressorHandle := CompressorHandle is Win32Handle ? NumGet(CompressorHandle, "ptr") : CompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\CloseCompressor", "ptr", CompressorHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Generates a new DECOMPRESSOR_HANDLE.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.  If the system can find no compression algorithm matching the specified name and version, the error  can be <b>ERROR_NOT_SUPPORTED</b>.
     * @param {Integer} Algorithm The type of compression algorithm and mode to be used by this decompressor.
     * @param {Pointer<COMPRESS_ALLOCATION_ROUTINES>} AllocationRoutines Optional memory allocation and deallocation routines in a <a href="https://docs.microsoft.com/windows/win32/api/compressapi/ns-compressapi-compress_allocation_routines">COMPRESS_ALLOCATION_ROUTINES</a> structure.
     * @param {Pointer<DECOMPRESSOR_HANDLE>} DecompressorHandle If the function succeeds, the handle to the specified decompressor.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-createdecompressor
     * @since windows8.0
     */
    static CreateDecompressor(Algorithm, AllocationRoutines, DecompressorHandle) {
        A_LastError := 0

        result := DllCall("Cabinet.dll\CreateDecompressor", "uint", Algorithm, "ptr", AllocationRoutines, "ptr", DecompressorHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets information in a decompressor for a particular compression algorithm.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>. If the system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>. If the compression algorithm does not allow changing the value of this information class, the error can be <b>ERROR_NOT_SUPPORTED</b>. If the compression algorithm does not allow the information class, the error can be <b>ERROR_UNSUPPORTED_TYPE</b>.
     * @param {DECOMPRESSOR_HANDLE} DecompressorHandle Handle to the decompressor.
     * @param {Integer} CompressInformationClass A value that identifies the type of information. of the  enumeration that identifies the type of information.
     * @param {Pointer} CompressInformation The information being set read as bytes. The maximum size in bytes is given by <i>CompressInformationSize</i>.
     * @param {Pointer} CompressInformationSize Maximum size  of the information in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-setdecompressorinformation
     * @since windows8.0
     */
    static SetDecompressorInformation(DecompressorHandle, CompressInformationClass, CompressInformation, CompressInformationSize) {
        DecompressorHandle := DecompressorHandle is Win32Handle ? NumGet(DecompressorHandle, "ptr") : DecompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\SetDecompressorInformation", "ptr", DecompressorHandle, "int", CompressInformationClass, "ptr", CompressInformation, "ptr", CompressInformationSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Use this function to query information about a particular compression algorithm.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.    If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>. If the compression algorithm does not allow the information class, the error can be <b>ERROR_UNSUPPORTED_TYPE</b>. If the buffer is too small to hold the value, the error can be <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @param {DECOMPRESSOR_HANDLE} DecompressorHandle Handle to the decompressor being queried for information.
     * @param {Integer} CompressInformationClass A value of the  <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/ne-compressapi-compress_information_class">COMPRESS_INFORMATION_CLASS</a> enumeration that identifies the type of information.
     * @param {Pointer} CompressInformation Information for the compression algorithm written as bytes. The maximum size in bytes of this information is given by <i>CompressInformationSize</i>.
     * @param {Pointer} CompressInformationSize Maximum size  in bytes of the information.
     * @returns {BOOL} Returns <b>TRUE</b> to indicate success and <b>FALSE</b> otherwise. Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to determine cause of failure.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-querydecompressorinformation
     * @since windows8.0
     */
    static QueryDecompressorInformation(DecompressorHandle, CompressInformationClass, CompressInformation, CompressInformationSize) {
        DecompressorHandle := DecompressorHandle is Win32Handle ? NumGet(DecompressorHandle, "ptr") : DecompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\QueryDecompressorInformation", "ptr", DecompressorHandle, "int", CompressInformationClass, "ptr", CompressInformation, "ptr", CompressInformationSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Takes a block of compressed information and decompresses it.
     * @remarks
     * If the block of compressed data pointed to by <i>CompressedData</i> is corrupted, the function can fail and the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_BAD_COMPRESSION_BUFFER</b>. It is also possible that the function will produce  a block of uncompressed data that does not match the original data.  
     * 
     * It is recommended that compressors and decompressors not use the <b>COMPRESS_RAW</b> flag. If the compressor is created with the <b>COMPRESS_RAW</b> flag,  the decompressor must also be created with the <b>COMPRESS_RAW</b> flag. 
     * 
     *  If the compressor and decompressor are created using the <b>COMPRESS_RAW</b> flag, the value of <i>UncompressedBufferSize</i> must be exactly equal to the original size of the uncompressed data and not just the size of the output buffer. This means you should save the exact original size of the uncompressed data, as well as the   compressed data and compressed size, when using the <b>COMPRESS_RAW</b> flag. If  <i>UncompressedBufferSize</i> does not equal the original size of the uncompressed data, the uncompressed data will not match the original data. In this case, the function can return success or it can return <b>ERROR_BAD_COMPRESSION_BUFFER</b>. 
     * 
     * If the <b>COMPRESS_RAW</b> flag is not used, <i>UncompressedBufferSize</i> is not required to be exactly equal to the original size of the uncompressed data.  In this case, <i>UncompressedDataSize</i> returns the original size of the uncompressed data. If <i>UncompressedBufferSize</i> is smaller than the original data size, the function will fail and set <i>UncompressedDataSize</i> to the size of the original data and the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> is <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * To determine how large the <i>UncompressedBuffer</i> needs to be, call the function with <i>UncompressedBufferSize</i> set to zero.  In this case, the function will fail and set <i>UncompressedDataSize</i> to the size of the original data and the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> is <b>ERROR_INSUFFICIENT_BUFFER</b>.  Note that the original size returned by the function is extracted from the buffer itself and should be treated as untrusted and tested against reasonable limits.
     * 
     * If the function is called with the <i>CompressedDataSize</i> parameter set to zero, the function fails and the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> is <b>ERROR_INSUFFICIENT_BUFFER</b>. When it fails the function returns with <i>UncompressedDataSize</i> set to a value that you can use to avoid allocating too large a buffer for the compressed data. You must know the maximum possible size of the original data to use this method.
     * 
     * If you set <i>CompressedDataSize</i> to zero, and set <i>UncompressedBufferSize</i> to the maximum possible size of the original uncompressed data, the <b>Decompress</b> function will fail as described and the value of <i>UncompressedDataSize</i> will be set to the maximum size for the compressed data buffer.
     * 
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.     If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>. If the output buffer is too small to hold the uncompressed data, the error can be <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @param {DECOMPRESSOR_HANDLE} DecompressorHandle Handle to a decompressor returned by <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/nf-compressapi-createdecompressor">CreateDecompressor</a>.
     * @param {Pointer} CompressedData Contains the block of information that is to be decompressed. The size in bytes of the compressed block is given by <i>CompressedDataSize</i>.
     * @param {Pointer} CompressedDataSize The size in bytes  of the compressed information.
     * @param {Pointer} UncompressedBuffer The buffer that receives the uncompressed information. The size in bytes of the buffer is given by <i>UncompressedBufferSize</i>.
     * @param {Pointer} UncompressedBufferSize Size  in bytes of the buffer that receives the uncompressed information.
     * @param {Pointer<Pointer>} UncompressedDataSize Actual size  in bytes of the uncompressed information received.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-decompress
     * @since windows8.0
     */
    static Decompress(DecompressorHandle, CompressedData, CompressedDataSize, UncompressedBuffer, UncompressedBufferSize, UncompressedDataSize) {
        DecompressorHandle := DecompressorHandle is Win32Handle ? NumGet(DecompressorHandle, "ptr") : DecompressorHandle

        UncompressedDataSizeMarshal := UncompressedDataSize is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("Cabinet.dll\Decompress", "ptr", DecompressorHandle, "ptr", CompressedData, "ptr", CompressedDataSize, "ptr", UncompressedBuffer, "ptr", UncompressedBufferSize, UncompressedDataSizeMarshal, UncompressedDataSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prepares the decompressor for the decompression of a new stream.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.    If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>.
     * @param {DECOMPRESSOR_HANDLE} DecompressorHandle Handle to the decompressor returned by <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/nf-compressapi-createdecompressor">CreateDecompressor</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-resetdecompressor
     * @since windows8.0
     */
    static ResetDecompressor(DecompressorHandle) {
        DecompressorHandle := DecompressorHandle is Win32Handle ? NumGet(DecompressorHandle, "ptr") : DecompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\ResetDecompressor", "ptr", DecompressorHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Call to close an open DECOMPRESSOR_HANDLE.
     * @remarks
     * If the compression algorithm fails for some internal reason, the error from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can be <b>ERROR_FUNCTION_FAILED</b>.    If the  system cannot locate the compression algorithm handle, the error can be <b>ERROR_INVALID_HANDLE</b>.
     * @param {DECOMPRESSOR_HANDLE} DecompressorHandle Handle to the decompressor to be closed. This is the handle to the compressor that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/compressapi/nf-compressapi-createdecompressor">CreateDecompressor</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/compressapi/nf-compressapi-closedecompressor
     * @since windows8.0
     */
    static CloseDecompressor(DecompressorHandle) {
        DecompressorHandle := DecompressorHandle is Win32Handle ? NumGet(DecompressorHandle, "ptr") : DecompressorHandle

        A_LastError := 0

        result := DllCall("Cabinet.dll\CloseDecompressor", "ptr", DecompressorHandle, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
